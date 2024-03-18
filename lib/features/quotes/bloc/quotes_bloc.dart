import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/features/quotes/data/repository/quotes_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'quotes_event.dart';
part 'quotes_state.dart';

class QuotesBloc extends Bloc<QuotesEvent, QuotesState> {
  final QuotesRepository _quotesRepository;

  QuotesBloc({required QuotesRepository quotesRepository}) : _quotesRepository = quotesRepository, super(QuotesInitial()) {
    on<CreateQuoteEvent>(_onCreateQuoteEvent);
    on<FetchAllQuotesEvent>(_onFetchAllQuotesEvent);
    on<FetchQuoteByIdEvent>(_onFetchQuoteByIdEvent);
  }

  void _onFetchAllQuotesEvent(FetchAllQuotesEvent event, Emitter<QuotesState> emit) async{
    emit(QuotesLoading());
    try{
      final quotes = await _quotesRepository.fetchAllQuotesRequest();
      emit(QuotesLoaded(quotes: quotes));
    }
    on DioException catch(e){
      emit(QuotesFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(QuotesFailure(errorMessage: e.toString()));
    }
  }

  void _onFetchQuoteByIdEvent(FetchQuoteByIdEvent event, Emitter<QuotesState> emit) async{
    emit(QuoteLoading());
    try{
      final quote = await _quotesRepository.fetchQuoteByIdRequest(id: event.id);
      emit(QuoteLoaded(quote: quote));
    }
    on DioException catch(e){
      emit(QuoteFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(QuoteFailure(errorMessage: e.toString()));
    }
  }

  void _onCreateQuoteEvent(CreateQuoteEvent event, Emitter<QuotesState> emit) async{
    emit(QuoteCreatingLoading());
    try{
      await _quotesRepository.createNewQuoteRequest(quote: event.quote);
      emit(QuoteCreatingSuccess());
    }
    on DioException catch(e){
      emit(QuoteCreatingFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(QuoteCreatingFailure(errorMessage: e.toString()));
    }
  }


}
