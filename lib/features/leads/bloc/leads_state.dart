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

class UpdateLeadLoading extends LeadsState {
  @override
  List<Object> get props => [];
}

class UpdateLeadLoaded extends LeadsState {

  @override
  List<Object> get props => [];
}

class UpdateLeadFailure extends LeadsState {
  final String errorMessage;

  const UpdateLeadFailure({required this.errorMessage});

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


