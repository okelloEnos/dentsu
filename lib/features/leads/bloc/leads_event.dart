part of 'leads_bloc.dart';

abstract class LeadsEvent extends Equatable {
  const LeadsEvent();
}

class FetchAllLeadsEvent extends LeadsEvent {
  @override
  List<Object> get props => [];
}

class FetchLeadByIdEvent extends LeadsEvent {
  final String id;

  const FetchLeadByIdEvent({required this.id});

  @override
  List<Object> get props => [id];
}

class CreateLeadEvent extends LeadsEvent {
  final Lead lead;

  const CreateLeadEvent({required this.lead});

  @override
  List<Object> get props => [lead];
}
