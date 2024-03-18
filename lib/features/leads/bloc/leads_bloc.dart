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
    on<FetchLeadByIdEvent>(_onFetchLeadByIdEvent);
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

  void _onFetchLeadByIdEvent(FetchLeadByIdEvent event, Emitter<LeadsState> emit) async{
    emit(LeadLoading());
    try{
      final lead = await _leadsRepository.fetchLeadByIdRequest(id: event.id);
      emit(LeadLoaded(lead: lead));
    }
    on DioException catch(e){
      emit(LeadFailure(errorMessage: e.message ?? 'An error occurred'));
    }
    catch(e){
      emit(LeadFailure(errorMessage: e.toString()));
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
