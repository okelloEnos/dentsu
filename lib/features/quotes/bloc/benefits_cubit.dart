import 'package:bloc/bloc.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'benefits_state.dart';

class BenefitsCubit extends Cubit<List<Benefits>> {
  final QuotesRepository _quotesRepository;
  BenefitsCubit({required QuotesRepository quotesRepository}) : _quotesRepository = quotesRepository, super([]);

  Future<void> fetchAllBenefits() async{
    try{
      final benefits = await _quotesRepository.fetchAllBenefitsRequest();
      emit(benefits);
    }
    on DioException catch(e){
      emit([]);
    }
    catch(e){
      emit([]);
    }
  }
}
