import 'package:dentsu_test/features/dashboard/data/data_provider/product_data_provider.dart';
import 'package:dentsu_test/features/dashboard/data/model/product_requests.dart';

class ProductRepository{
  final ProductDataProvider _productDataProvider;

  ProductRepository({required ProductDataProvider productDataProvider}) : _productDataProvider = productDataProvider;

  Future<List<ProductRequests>> fetchAllProductsRequest() async{
    final allProductsResponse = await _productDataProvider.fetchAllProductsRequest();
    List<ProductRequests> listOfProducts = [];
    listOfProducts = List<ProductRequests>.from(allProductsResponse.map((productMap) => ProductRequests.fromJson(productMap)));
    return listOfProducts;
  }
}