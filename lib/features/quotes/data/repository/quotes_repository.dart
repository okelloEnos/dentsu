import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/features/quotes/data/data_provider/quotes_data_provider.dart';

class QuotesRepository{
  final QuotesDataProvider _quotesDataProvider;

  QuotesRepository({required QuotesDataProvider quotesDataProvider}) : _quotesDataProvider = quotesDataProvider;

  Future<void> createNewQuoteRequest({required Quote quote}) async {
    await _quotesDataProvider.createNewQuoteRequest(quote: quote);
  }

  Future<void> updateQuoteRequest({required Quote quote}) async {
    await _quotesDataProvider.updateQuoteRequest(quote: quote);
  }

  Future<void> deleteQuoteRequest({required String id}) async {
    await _quotesDataProvider.deleteQuoteRequest(id: id);
  }

  Future<List<Quote>> fetchAllQuotesRequest() async{
    final allQuotesResponse = await _quotesDataProvider.fetchAllQuotesRequest();
    List<Quote> listOfQuotes = [];
    listOfQuotes = List<Quote>.from(allQuotesResponse.values.map((quoteMap) => Quote.fromJson(quoteMap)));
    return listOfQuotes;
  }

  Future<Quote> fetchQuoteByIdRequest({required String id}) async{
    final quoteResponse = await _quotesDataProvider.fetchQuoteByIdRequest(id: id);
    Quote quote = Quote.fromJson(quoteResponse);
    return quote;
  }

  Future<List<Benefits>> fetchAllBenefitsRequest() async{
    final  allBenefitsResponse = await _quotesDataProvider.fetchAllBenefitsRequest();
    List<Benefits> listOfBenefits = [];
    listOfBenefits = List<Benefits>.from(allBenefitsResponse.values.map((benefitMap) => Benefits.fromJson(benefitMap)));
    return listOfBenefits;
  }

}