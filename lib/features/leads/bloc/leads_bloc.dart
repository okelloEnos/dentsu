import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dentsu_test/features/features_barrel.dart';
import 'package:dentsu_test/features/leads/data/repository/leads_repository.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'leads_event.dart';
part 'leads_state.dart';

class LeadsBloc extends Bloc<LeadsEvent, LeadsState> {
  final LeadsRepository _leadsRepository;
  LeadsBloc({required LeadsRepository leadsRepository}) : _leadsRepository = leadsRepository, super(LeadsInitial()) {
    on<FetchAllLeadsEvent>(_onFetchAllLeadsEvent);
    on<UpdateLeadEvent>(_onUpdateLeadEvent);
    on<CreateLeadEvent>(_onCreateLeadEvent);
  }

  void _onFetchAllLeadsEvent(FetchAllLeadsEvent event, Emitter<LeadsState> emit) async{
    emit(LeadsLoading());
    try{
      final leads = await _leadsRepository.fetchAllLeadsRequest();
      emit(LeadsLoaded(leads: leads));
    }
    on DioException catch(e){
      emit(LeadsFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(LeadsFailure(errorMessage: e.toString()));
    }
  }

  void _onUpdateLeadEvent(UpdateLeadEvent event, Emitter<LeadsState> emit) async{
    emit(UpdateLeadLoading());
    try{
      await _leadsRepository.updateLeadRequest(lead: event.lead);
      emit(UpdateLeadLoaded());
    }
    on DioException catch(e){
      emit(UpdateLeadFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(UpdateLeadFailure(errorMessage: e.toString()));
    }
  }

  void _onCreateLeadEvent(CreateLeadEvent event, Emitter<LeadsState> emit) async{
    emit(LeadCreatingLoading());
    try{
      await _leadsRepository.createLeadRequest(lead: event.lead);
      emit(LeadCreatingSuccess());
    }
    on DioException catch(e){
      emit(LeadCreatingFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(LeadCreatingFailure(errorMessage: e.toString()));
    }
  }
}
