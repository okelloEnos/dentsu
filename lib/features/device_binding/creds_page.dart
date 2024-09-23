import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../util/functions/device_data.dart';

class CredentialsPage extends StatefulWidget {
  const CredentialsPage({super.key});

  @override
  State<CredentialsPage> createState() => _CredentialsPageState();
}

class _CredentialsPageState extends State<CredentialsPage> {
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  String deviceID = "";

  @override
  void initState() {
    super.initState();
    captureInfo();
    FirebaseFirestore.instance
        .collection('action')
        .doc('device')
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        String? remoteUsername = snapshot.data()?['username'];
        String? remoteDeviceId = snapshot.data()?['deviceId'];
        // Perform some action based on the update
        if (remoteDeviceId != deviceID) {
          // Execute the response action on the second device
          Navigator.pop(context);
        }
        else{
          debugPrint("Device ID is the same");
        }
      }
    });

  }

  void captureInfo() async{
    String? id = await retrieveUnifiedId();
    setState(() {
      deviceID = id ?? "No device ID";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credentials Page'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('This is the credentials page'),
          ),
          SizedBox(
            height: 20,
          ),
          Text("email"),
          TextField(
            controller: emailController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text("password"),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Password',
            ),
          ),
          SizedBox(
            height: 100,
          ),
          ElevatedButton(onPressed: () async{
            print(emailController.text);
            print(passwordController.text);
            String? id = await retrieveUnifiedId();
            deviceID = id ?? "No device ID";
            var response = await normalLogIn(email: emailController.text, password: passwordController.text);
            if(response.deviceId != null && response.deviceId != ""){
              // check if the device id is the same as the one in the device
              if(response.deviceId == deviceID){
                /// login normally
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scaffold(
                    appBar: AppBar(title: Text("Device Data")),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(child: Text("Submitted")),
                        SizedBox(height: 20,),
                        Text("Device ID : ${deviceID}"),
                        Text("Username : ${response.username}"),
                        Text("Name : ${response.name}"),
                        Text("Device ID : ${response.deviceId}"),
                        Text("Is device ID set : ${(response.deviceId != null)}"),
                        Text("Do device numbers match : ${(response.deviceId == deviceID)}"),
                      ],
                    ))));
              }
              else{
                // this is a different device id show dialog to confirm this device as a primary device
                showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Device ID Mismatch"),
                    content: Text("The device ID on this device does not match the one on the server. Do you want to set this device as the primary device?"),
                    actions: [
                      ElevatedButton(onPressed: () async{
                        await updateSubmission(userName: emailController.text, deviceId: deviceID);

                        ///
                        FirebaseFirestore.instance.collection('action').doc('device').set({
                          'deviceId': deviceID,
                          'username': emailController.text,
                        });

                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scaffold(
                            appBar: AppBar(title: Text("Device Data")),
                            body: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(child: Text("Submitted")),
                                SizedBox(height: 20,),
                                Text("Device ID : ${deviceID}"),
                                Text("Username : ${response.username}"),
                                Text("Name : ${response.name}"),
                                Text("Device ID : ${response.deviceId}"),
                                Text("Is device ID set : ${(response.deviceId != null)}"),
                                Text("Do device numbers match : ${(response.deviceId == deviceID)}"),
                                // ElevatedButton(onPressed: () async{
                                //   await createNewSubmission(email: emailController.text, deviceId: deviceID);
                                // }, child: Text("New Submission")),
                                // ElevatedButton(onPressed: () async{
                                //   await updateSubmission(userName: emailController.text, deviceId: deviceID);
                                // }, child: Text("Update Existing One"))
                              ],
                            ))));
                      }, child: Text("Yes")),
                      ElevatedButton(onPressed: (){
                        Navigator.of(context).pop();
                      }, child: Text("No"))
                    ],
                  );
                });
              }
            }
            else{
              /// login normally
              // todo: update the device id on the server
              // await createNewSubmission(email: emailController.text, deviceId: deviceID, password: passwordController.text);
              await updateSubmission(userName: emailController.text, deviceId: deviceID);
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => Scaffold(
                  appBar: AppBar(title: Text("Device Data")),
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(child: Text("Submitted")),
                      SizedBox(height: 20,),
                      Text("Device ID : ${deviceID}"),
                      Text("Username : ${response.username}"),
                      Text("Name : ${response.name}"),
                      Text("Device ID : ${response.deviceId}"),
                      Text("Is device ID set : ${(response.deviceId != null)}"),
                      Text("Do device numbers match : ${(response.deviceId == deviceID)}"),
                      // ElevatedButton(onPressed: () async{
                      //   await createNewSubmission(email: emailController.text, deviceId: deviceID);
                      // }, child: Text("New Submission")),
                      // ElevatedButton(onPressed: () async{
                      //   await updateSubmission(userName: emailController.text, deviceId: deviceID);
                      // }, child: Text("Update Existing One"))
                    ],
                  ))));
            }

          }, child: Text("Submit"))
        ],
      ),
    );
  }



  Future<TestDeviceData> normalLogIn(
      {required String email, required String password}) async {

    var url = "$deviceBaseUrl/idapi/user_list";

    // var logInMapData = {"email": email.trim(), "password": password};
    var logInMapData = {"email": email.trim(), "password": password};

    final response = await Dio().get(url);

    if ((response.statusCode ?? 0) == 200) {
      var responseToken = response.data;

      List<TestDeviceData> deviceData = [];
      deviceData = (response.data as List).map((e) => TestDeviceData.fromJson(e)).toList();
      if(email.isEmpty){
        email = "johndoe";
      }
      TestDeviceData extractedUser = deviceData.firstWhere((element) => element.username == email);
      return extractedUser;
    } else {
      throw ("${response.statusMessage}");
    }
  }

  Future<TestDeviceData> createNewSubmission(
      {required String email, required String deviceId, required String password}) async {

    var url = "$deviceBaseUrl/idapi/create-user/";

    var logInMapData = {
      "name": "Peter Mwangi",
      "username": email,
      "password": password,
      "device_id": deviceID
    };

    final response = await Dio().post(url, data: logInMapData);

    if ((response.statusCode ?? 0) == 201) {
      var responseToken = response.data;
      return responseToken;
    } else {
      throw ("${response.statusMessage}");
    }
  }

  Future<dynamic> updateSubmission(
      {required String userName, required String deviceId}) async {

    var url = "$deviceBaseUrl/idapi/update_device_id/";

    var logInMapData = {"username": userName, "device_id": deviceId};

    final response = await Dio().post(url, data: logInMapData);

    if ((response.statusCode ?? 0) == 200) {
      var responseToken = response.data;
      return responseToken;
    } else {
      throw ("${response.statusMessage}");
    }
  }
}

class TestDeviceData{
  final String? username;
  final String? name;
  final String? deviceId;

  TestDeviceData({this.username, this.name, this.deviceId});

  factory TestDeviceData.fromJson(Map<String, dynamic> json){
    return TestDeviceData(
        username: json['username'],
        name: json['name'],
        deviceId: json['device_id']
    );
  }
}
const deviceBaseUrl = "http://18.222.37.86:8000";