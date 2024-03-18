part of 'quotes_bloc.dart';

abstract class QuotesState extends Equatable {
  const QuotesState();
}

class QuotesInitial extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuotesLoading extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuotesLoaded extends QuotesState {
  final List<Quote> quotes;

  const QuotesLoaded({required this.quotes});

  @override
  List<Object> get props => [quotes];
}

class QuotesFailure extends QuotesState {
  final String errorMessage;

  const QuotesFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class QuoteLoading extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuoteLoaded extends QuotesState {
  final Quote quote;

  const QuoteLoaded({required this.quote});

  @override
  List<Object> get props => [quote];
}

class QuoteFailure extends QuotesState {
  final String errorMessage;

  const QuoteFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class QuoteCreatingLoading extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuoteCreatingSuccess extends QuotesState {
  @override
  List<Object> get props => [];
}

class QuoteCreatingFailure extends QuotesState {
  final String errorMessage;

  const QuoteCreatingFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}