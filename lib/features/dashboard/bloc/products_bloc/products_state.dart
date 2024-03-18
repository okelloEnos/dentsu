part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();
}

class ProductsInitial extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoading extends ProductsState {
  @override
  List<Object> get props => [];
}

class ProductsLoaded extends ProductsState {
  final List<ProductRequests> products;

  const ProductsLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductsFailure extends ProductsState {
  final String errorMessage;

  const ProductsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

