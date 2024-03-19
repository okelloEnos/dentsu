import 'package:dentsu_test/features/features_barrel.dart';
import 'package:firebase_database/firebase_database.dart';

class LeadsDataProvider{
  final FirebaseDatabase _database;

  LeadsDataProvider({required FirebaseDatabase database}) : _database = database;

  // create a new lead
  Future<void> createLeadRequest({required Lead lead}) async {
    DatabaseReference databaseReference = _database.ref();
    DatabaseReference leadsDatabaseReference = databaseReference.child('leads');
    var leadsChildDatabaseReference = leadsDatabaseReference.push();
    String? leadId = leadsChildDatabaseReference.key;
    if(leadId != null){
      var newLeadData = lead.copyWith(id: leadId).toJson();
      await leadsChildDatabaseReference.set(newLeadData);
      //todo: make a request for lead request records *
      DatabaseReference leadRequestDatabaseReference = databaseReference.child('lead_request');
      var leadRequestChildDatabaseReference = leadRequestDatabaseReference.push();
      String? leadRequestId = leadRequestChildDatabaseReference.key;
      if(leadRequestId != null){
        // ProductRequests product = ProductRequests(
        //   id: productRequestId,
        // );
        // var newProductData = product.toJson();
        // await productRequestChildDatabaseReference.set(newProductData);
      }
    }
    else{
      throw('Could not create a new lead');
    }
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