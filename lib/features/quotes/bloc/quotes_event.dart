part of 'quotes_bloc.dart';

abstract class QuotesEvent extends Equatable {
  const QuotesEvent();
}

class FetchAllQuotesEvent extends QuotesEvent {
  @override
  List<Object> get props => [];
}

class FetchQuoteByIdEvent extends QuotesEvent {
  final String id;

  const FetchQuoteByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class CreateQuoteEvent extends QuotesEvent {
  final Quote quote;

  const CreateQuoteEvent({required this.quote});

  @override
  List<Object> get props => [quote];
}
