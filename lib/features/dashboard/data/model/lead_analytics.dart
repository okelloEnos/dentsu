class LeadsAnalytics {
  final String? date;
  final String? activeLeads;
  final String? inactive;
  final String? registeredLeads;
  final String? totalLeads;

  LeadsAnalytics({
    this.date,
    this.activeLeads,
    this.inactive,
    this.registeredLeads,
    this.totalLeads,
  });

  LeadsAnalytics copyWith({
    String? date,
    String? activeLeads,
    String? inactive,
    String? registeredLeads,
    String? totalLeads,
  }) =>
      LeadsAnalytics(
        date: date ?? this.date,
        activeLeads: activeLeads ?? this.activeLeads,
        inactive: inactive ?? this.inactive,
        registeredLeads: registeredLeads ?? this.registeredLeads,
        totalLeads: totalLeads ?? this.totalLeads,
      );

  factory LeadsAnalytics.fromJson(Map<String, dynamic> json) => LeadsAnalytics(
    date: json["date"],
    activeLeads: json["active_leads"],
    inactive: json["inactive"],
    registeredLeads: json["registered_leads"],
    totalLeads: json["total_leads"],
  );

  Map<String, dynamic> toJson() => {
    "date": date,
    "active_leads": activeLeads,
    "inactive": inactive,
    "registered_leads": registeredLeads,
    "total_leads": totalLeads,
  };
}