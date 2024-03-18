import 'package:dentsu_test/features/features_barrel.dart';
import 'package:firebase_database/firebase_database.dart';

class LeadsDataProvider{
  final FirebaseDatabase _database;

  LeadsDataProvider({required FirebaseDatabase database}) : _database = database;

  // create a new lead
  Future<void> createLeadRequest({required Lead lead}) async {
    var newLeadData = lead.toJson();
    await _database.ref().child('leads').push().set(newLeadData);
  }

  // update a lead
  Future<void> updateLeadRequest({required Lead lead}) async {
    var updatedLeadData = lead.toJson();
    await _database.ref().child('leads').child("${lead.id}").update(updatedLeadData);
  }

  // delete a lead
  Future<void> deleteLeadRequest({required String id}) async {
    await _database.ref().child('leads').child(id).remove();
  }

  // get all leads
  Future<dynamic> fetchAllLeadsRequest() async{
    try{
      final leadInfoResponse = await _database.ref("leads").get();
      if(leadInfoResponse.exists){
        return leadInfoResponse.value;
      }
      else{
        throw('Leads not found');
      }
    }
    catch(e){
      rethrow;
    }
  }

  // get lead by id
  Future<dynamic> fetchLeadByIdRequest({required String id}) async{
    try{
      final leadInfoResponse = await _database.ref("leads").child(id).get();
      if(leadInfoResponse.exists){
        return leadInfoResponse.value;
      }
      else{
        throw('Lead not found');
      }
    }
    catch(e){
      rethrow;
    }
  }
}