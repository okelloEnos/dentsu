import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dentsu_test/features/dashboard/dashboard_barrel.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductRepository _productRepository;
  ProductsBloc({required ProductRepository productRepository}) : _productRepository = productRepository, super(ProductsInitial()) {
    on<FetchAllProductsEvent>(_onFetchAllProductsEvent);
  }

  _onFetchAllProductsEvent(FetchAllProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await _productRepository.fetchAllProductsRequest();
      emit(ProductsLoaded(products: products));
    }
    on DioException catch (e) {
      emit(ProductsFailure(errorMessage: e.error.toString()));
    }
    catch (e) {
      emit(ProductsFailure(errorMessage: e.toString()));
    }
  }
}
