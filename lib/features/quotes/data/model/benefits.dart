class Benefits{
  final String? id;
  final String? benefitName;
  final String? benefitCharges;

  Benefits({
    this.id,
    this.benefitName,
    this.benefitCharges,
  });

  Benefits copyWith({
    String? id,
    String? benefitName,
    String? benefitCharges,
  }) =>
      Benefits(
        id: id ?? this.id,
        benefitName: benefitName ?? this.benefitName,
        benefitCharges: benefitCharges ?? this.benefitCharges,
      );

  factory Benefits.fromJson(Map<Object, Object> json) => Benefits(
    id: "${json["id"]}",
    benefitName: "${json["benefit_name"]}",
    benefitCharges: "${json["benefit_charges"]}",
  );
}