class Quote{

  final String? id;
  final String? clientFirstName;
  final String? clientMiddleName;
  final String? clientLastName;
  final String? originatingLeadSource;
  final String? owningBusinessUnit;
  final String? leadId;
  final String? source;
  final String? capturingUser;
  final String? ageBracket;
  final String? inPatientCoverLimit;
  final String? spouseCovered;
  final String? spouseAgeBracket;
  final String? numberOfChildren;
  final LeadBenefit? leadBenefit;

  Quote({
    this.id,
    this.clientFirstName,
    this.clientMiddleName,
    this.clientLastName,
    this.originatingLeadSource,
    this.owningBusinessUnit,
    this.leadId,
    this.source,
    this.capturingUser,
    this.ageBracket,
    this.inPatientCoverLimit,
    this.spouseCovered,
    this.spouseAgeBracket,
    this.numberOfChildren,
    this.leadBenefit,
  });

  Quote copyWith({
    String? id,
    String? clientFirstName,
    String? clientMiddleName,
    String? clientLastName,
    String? originatingLeadSource,
    String? owningBusinessUnit,
    String? leadId,
    String? source,
    String? capturingUser,
    String? ageBracket,
    String? inPatientCoverLimit,
    String? spouseCovered,
    String? spouseAgeBracket,
    String? numberOfChildren,
    LeadBenefit? leadBenefit,
  }) =>
      Quote(
        id: id ?? this.id,
        clientFirstName: clientFirstName ?? this.clientFirstName,
        clientMiddleName: clientMiddleName ?? this.clientMiddleName,
        clientLastName: clientLastName ?? this.clientLastName,
        originatingLeadSource: originatingLeadSource ?? this.originatingLeadSource,
        owningBusinessUnit: owningBusinessUnit ?? this.owningBusinessUnit,
        leadId: leadId ?? this.leadId,
        source: source ?? this.source,
        capturingUser: capturingUser ?? this.capturingUser,
        ageBracket: ageBracket ?? this.ageBracket,
        inPatientCoverLimit: inPatientCoverLimit ?? this.inPatientCoverLimit,
        spouseCovered: spouseCovered ?? this.spouseCovered,
        spouseAgeBracket: spouseAgeBracket ?? this.spouseAgeBracket,
        numberOfChildren: numberOfChildren ?? this.numberOfChildren,
        leadBenefit: leadBenefit ?? this.leadBenefit,
      );

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    id: json["id"],
    clientFirstName: json["client_first_name"],
    clientMiddleName: json["client_middle_name"],
    clientLastName: json["client_last_name"],
    originatingLeadSource: json["originating_lead_source"],
    owningBusinessUnit: json["owning_business_unit"],
    leadId: json["lead_id"],
    source: json["source"],
    capturingUser: json["capturing_user"],
    ageBracket: json["age_bracket"],
    inPatientCoverLimit: json["in_patient_cover_limit"],
    spouseCovered: json["spouse_covered"],
    spouseAgeBracket: json["spouse_age_bracket"],
    numberOfChildren: json["number_of_children"],
    leadBenefit: LeadBenefit.fromJson(json["lead_benefit"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "client_first_name": clientFirstName,
    "client_middle_name": clientMiddleName,
    "client_last_name": clientLastName,
    "originating_lead_source": originatingLeadSource,
    "owning_business_unit": owningBusinessUnit,
    "lead_id": leadId,
    "source": source,
    "capturing_user": capturingUser,
    "age_bracket": ageBracket,
    "in_patient_cover_limit": inPatientCoverLimit,
    "spouse_covered": spouseCovered,
    "spouse_age_bracket": spouseAgeBracket,
    "number_of_children": numberOfChildren,
    "lead_benefit": leadBenefit?.toJson(),
  };


}

class LeadBenefit{
  final String? inPatient;
  final String? outPatient;
  final String? coPayment;
  final String? dental;
  final String? optical;
  final String? maternity;
  final String? lastExpense;
  final String? personalAccident;
  final String? covidCover;
  final String? amrefEvacuation;

  LeadBenefit({
    this.inPatient,
    this.outPatient,
    this.coPayment,
    this.dental,
    this.optical,
    this.maternity,
    this.lastExpense,
    this.personalAccident,
    this.covidCover,
    this.amrefEvacuation,
  });

  LeadBenefit copyWith({
    String? inPatient,
    String? outPatient,
    String? coPayment,
    String? dental,
    String? optical,
    String? maternity,
    String? lastExpense,
    String? personalAccident,
    String? covidCover,
    String? amrefEvacuation,
  }) =>
      LeadBenefit(
        inPatient: inPatient ?? this.inPatient,
        outPatient: outPatient ?? this.outPatient,
        coPayment: coPayment ?? this.coPayment,
        dental: dental ?? this.dental,
        optical: optical ?? this.optical,
        maternity: maternity ?? this.maternity,
        lastExpense: lastExpense ?? this.lastExpense,
        personalAccident: personalAccident ?? this.personalAccident,
        covidCover: covidCover ?? this.covidCover,
        amrefEvacuation: amrefEvacuation ?? this.amrefEvacuation,
      );

  factory LeadBenefit.fromJson(Map<String, dynamic> json) => LeadBenefit(
    inPatient: json["in_patient"],
    outPatient: json["out_patient"],
    coPayment: json["co_payment"],
    dental: json["dental"],
    optical: json["optical"],
    maternity: json["maternity"],
    lastExpense: json["last_expense"],
    personalAccident: json["personal_accident"],
    covidCover: json["covid_cover"],
    amrefEvacuation: json["amref_evacuation"],
  );

  Map<String, dynamic> toJson() => {
    "in_patient": inPatient,
    "out_patient": outPatient,
    "co_payment": coPayment,
    "dental": dental,
    "optical": optical,
    "maternity": maternity,
    "last_expense": lastExpense,
    "personal_accident": personalAccident,
    "covid_cover": covidCover,
    "amref_evacuation": amrefEvacuation,
  };

}