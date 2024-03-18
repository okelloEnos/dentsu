import 'package:dentsu_test/features/features_barrel.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductDataProvider{
  final FirebaseDatabase _database;

  ProductDataProvider({required FirebaseDatabase database}) : _database = database;

  // get all products records
  Future<dynamic> fetchAllProductsRequest() async{
    try{
      final productInfoResponse = await _database.ref("products").get();
      if(productInfoResponse.exists){
        return productInfoResponse.value;
      }
      else{
        throw('Products not found');
      }
    }
    catch(e){
      rethrow;
    }
  }

  // get Quote by id
  Future<dynamic> fetchQuoteByIdRequest({required String id}) async{
    try{
      final quoteInfoResponse = await _database.ref("quotes").child(id).get();
      if(quoteInfoResponse.exists){
        return quoteInfoResponse.value;
      }
      else{
        throw('Quote not found');
      }
    }
    catch(e){
      rethrow;
    }
  }

  // get all benefits
  Future<dynamic> fetchAllBenefitsRequest() async{
    try{
      final benefitsInfoResponse = await _database.ref("benefits").get();
      if(benefitsInfoResponse.exists){
        return benefitsInfoResponse.value;
      }
      else{
        throw('Benefits not found');
      }
    }
    catch(e){
      rethrow;
    }
  }
}