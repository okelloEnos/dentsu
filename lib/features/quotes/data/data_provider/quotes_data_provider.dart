import 'package:dentsu_test/features/features_barrel.dart';
import 'package:firebase_database/firebase_database.dart';

class QuotesDataProvider{
  final FirebaseDatabase _database;

  QuotesDataProvider({required FirebaseDatabase database}) : _database = database;

  // create a new quote
  Future<void> createNewQuoteRequest({required Quote quote}) async {
    DatabaseReference databaseReference = _database.ref();
    DatabaseReference quotesDatabaseReference = databaseReference.child('quotes');
    var quotesChildDatabaseReference = quotesDatabaseReference.push();
    String? quoteId = quotesChildDatabaseReference.key;
    if(quoteId != null){
      var newQuoteData = quote.copyWith(id: quoteId).toJson();
      await quotesChildDatabaseReference.set(newQuoteData);
      //todo: make a request for product records
      DatabaseReference productRequestDatabaseReference = databaseReference.child('product_request');
      var productRequestChildDatabaseReference = productRequestDatabaseReference.push();
      String? productRequestId = productRequestChildDatabaseReference.key;
      if(productRequestId != null){
        ProductRequests product = ProductRequests(
          id: productRequestId,
        );
        var newProductData = product.toJson();
        await productRequestChildDatabaseReference.set(newProductData);
      }
    }
    else{
      throw('Could not create a new quote');
    }

  }

  // update quote
  Future<void> updateQuoteRequest({required Quote quote}) async {
    var updatedQuoteData = quote.toJson();
    await _database.ref().child('quotes').child("${quote.id}").update(updatedQuoteData);
  }

  // delete a quote
  Future<void> deleteQuoteRequest({required String id}) async {
    await _database.ref().child('quotes').child(id).remove();
  }

  // get all quotes
  Future<dynamic> fetchAllQuotesRequest() async{
    try{
      final quotesInfoResponse = await _database.ref("quotes").get();
      if(quotesInfoResponse.exists){
        return quotesInfoResponse.value;
      }
      else{
        throw('Quotes not found');
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