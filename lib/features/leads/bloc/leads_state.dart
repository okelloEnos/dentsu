part of 'leads_bloc.dart';

abstract class LeadsState extends Equatable {
  const LeadsState();
}

class LeadsInitial extends LeadsState {
  @override
  List<Object> get props => [];
}

class LeadsLoading extends LeadsState {
  @override
  List<Object> get props => [];
}

class LeadsLoaded extends LeadsState {
  final List<Lead> leads;

  const LeadsLoaded({required this.leads});

  @override
  List<Object> get props => [leads];
}

class LeadsFailure extends LeadsState {
  final String errorMessage;

  const LeadsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class LeadLoading extends LeadsState {
  @override
  List<Object> get props => [];
}

class LeadLoaded extends LeadsState {
  final Lead lead;

  const LeadLoaded({required this.lead});

  @override
  List<Object> get props => [lead];
}

class LeadFailure extends LeadsState {
  final String errorMessage;

  const LeadFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}

class LeadCreatingLoading extends LeadsState {
  @override
  List<Object> get props => [];
}

class LeadCreatingSuccess extends LeadsState {
  @override
  List<Object> get props => [];
}

class LeadCreatingFailure extends LeadsState {
  final String errorMessage;

  const LeadCreatingFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}


