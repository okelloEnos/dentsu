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
  final String? childrenCovered;
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
    this.childrenCovered
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
    String? childrenCovered
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
        childrenCovered: childrenCovered ?? this.childrenCovered
      );

  factory Quote.fromJson(Map<Object?, Object?> json) => Quote(
    id: "${json["id"]}",
    clientFirstName: "${json["client_first_name"]}",
    clientMiddleName: "${json["client_middle_name"]}",
    clientLastName: "${json["client_last_name"]}",
    originatingLeadSource: "${json["originating_lead_source"]}",
    owningBusinessUnit: "${json["owning_business_unit"]}",
    leadId: "${json["lead_id"]}",
    source: "${json["source"]}",
    capturingUser: "${json["capturing_user"]}",
    ageBracket: "${json["age_bracket"]}",
    inPatientCoverLimit: "${json["in_patient_cover_limit"]}",
    spouseCovered: "${json["spouse_covered"]}",
    spouseAgeBracket: "${json["spouse_age_bracket"]}",
    numberOfChildren: "${json["number_of_children"]}",
    childrenCovered: "${json["children_covered"]}",
    leadBenefit: json["lead_benefit"] == null ? LeadBenefit() : LeadBenefit.fromJson(json["lead_benefit"] as Map<Object?, Object?>),
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
    "children_covered": childrenCovered,
  };


}

class LeadBenefit{
  final bool? inPatient;
  final bool? outPatient;
  final bool? coPayment;
  final bool? dental;
  final bool? optical;
  final bool? maternity;
  final bool? lastExpense;
  final bool? personalAccident;
  final bool? covidCover;
  final bool? amrefEvacuation;
  final String? totalCharges;

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
    this.totalCharges
  });

  LeadBenefit copyWith({
    bool? inPatient,
    bool? outPatient,
    bool? coPayment,
    bool? dental,
    bool? optical,
    bool? maternity,
    bool? lastExpense,
    bool? personalAccident,
    bool? covidCover,
    bool? amrefEvacuation,
    String? totalCharges
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
        totalCharges: totalCharges ?? this.totalCharges
      );

  factory LeadBenefit.fromJson(Map<Object?, Object?> json) => LeadBenefit(
    inPatient: json["in_patient"] as bool,
    outPatient: json["out_patient"] as bool,
    coPayment: json["co_payment"] as bool,
    dental: json["dental"] as bool,
    optical: json["optical"] as bool,
    maternity: json["maternity"] as bool,
    lastExpense: json["last_expense"] as bool,
    personalAccident: json["personal_accident"] as bool,
    covidCover: json["covid_cover"] as bool,
    amrefEvacuation: json["amref_evacuation"] as bool,
    totalCharges: "${json["total_charges"]}",
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
    "total_charges": totalCharges,
  };

}