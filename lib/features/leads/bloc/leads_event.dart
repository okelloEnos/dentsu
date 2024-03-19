part of 'leads_bloc.dart';

abstract class LeadsEvent extends Equatable {
  const LeadsEvent();
}

class FetchAllLeadsEvent extends LeadsEvent {
  @override
  List<Object> get props => [];
}

class UpdateLeadEvent extends LeadsEvent {
  final Lead lead;

  const UpdateLeadEvent({required this.lead});

  @override
  List<Object> get props => [lead];
}

class CreateLeadEvent extends LeadsEvent {
  final Lead lead;

  const CreateLeadEvent({required this.lead});

  @override
  List<Object> get props => [lead];
}
