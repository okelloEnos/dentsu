import 'package:equatable/equatable.dart';

class Lead extends Equatable{
  final String? id;
  final String? firstName;
  final String? middleName;
  final String? lastName;
  final String? location;
  final String? leadCreatedDate;
  final String? leadContactedDate;
  final String? nextAppointmentDate;
  final String? leadSource;
  final String? productRequested;
  final String? productSold;
  final String? leadStatus;
  final String? leadCloseReason;
  final String? recordingAgentName;

  const Lead({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.location,
    this.leadCreatedDate,
    this.leadContactedDate,
    this.nextAppointmentDate,
    this.leadSource,
    this.productRequested,
    this.productSold,
    this.leadStatus,
    this.leadCloseReason,
    this.recordingAgentName,
  });

  Lead copyWith({
    String? id,
    String? firstName,
    String? middleName,
    String? lastName,
    String? location,
    String? leadCreatedDate,
    String? leadContactedDate,
    String? nextAppointmentDate,
    String? leadSource,
    String? productRequested,
    String? productSold,
    String? leadStatus,
    String? leadCloseReason,
    String? recordingAgentName,
  }) =>
      Lead(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        location: location ?? this.location,
        leadCreatedDate: leadCreatedDate ?? this.leadCreatedDate,
        leadContactedDate: leadContactedDate ?? this.leadContactedDate,
        nextAppointmentDate: nextAppointmentDate ?? this.nextAppointmentDate,
        leadSource: leadSource ?? this.leadSource,
        productRequested: productRequested ?? this.productRequested,
        productSold: productSold ?? this.productSold,
        leadStatus: leadStatus ?? this.leadStatus,
        leadCloseReason: leadCloseReason ?? this.leadCloseReason,
        recordingAgentName: recordingAgentName ?? this.recordingAgentName,
      );

  factory Lead.fromJson(Map<Object?, Object?> json) => Lead(
    id: "${json["id"]}",
    firstName: "${json["first_name"]}",
    middleName: "${json["middle_name"]}",
    lastName: "${json["last_name"]}",
    location: "${json["location"]}",
    leadCreatedDate: "${json["lead_created_date"]}",
    leadContactedDate: "${json["lead_contacted_date"]}",
    nextAppointmentDate: "${json["next_appointment_date"]}",
    leadSource: "${json["lead_source"]}",
    productRequested: "${json["product_requested"]}",
    productSold: "${json["product_sold"]}",
    leadStatus: "${json["lead_status"]}",
    leadCloseReason: "${json["lead_close_reason"]}",
    recordingAgentName: "${json["recording_agent_name"]}",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "middle_name": middleName,
    "last_name": lastName,
    "location": location,
    "lead_created_date": leadCreatedDate,
    "lead_contacted_date": leadContactedDate,
    "next_appointment_date": nextAppointmentDate,
    "lead_source": leadSource,
    "product_requested": productRequested,
    "product_sold": productSold,
    "lead_status": leadStatus,
    "lead_close_reason": leadCloseReason,
    "recording_agent_name": recordingAgentName,
  };

  @override
  List<Object?> get props => [
    id,
    firstName,
    middleName,
    lastName,
    location,
    leadCreatedDate,
    leadContactedDate,
    nextAppointmentDate,
    leadSource,
    productRequested,
    productSold,
    leadStatus,
    leadCloseReason,
    recordingAgentName,
  ];
}