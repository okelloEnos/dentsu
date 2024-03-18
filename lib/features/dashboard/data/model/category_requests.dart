class CategoryRequests{
  final String? numberOfAccountRequests;
  final String? numberOfInsuranceRequests;
  final String? numberOfCreditRequests;

  CategoryRequests({
    this.numberOfAccountRequests,
    this.numberOfInsuranceRequests,
    this.numberOfCreditRequests,
  });

  CategoryRequests copyWith({
    String? numberOfAccountRequests,
    String? numberOfInsuranceRequests,
    String? numberOfCreditRequests,
  }) =>
      CategoryRequests(
        numberOfAccountRequests: numberOfAccountRequests ?? this.numberOfAccountRequests,
        numberOfInsuranceRequests: numberOfInsuranceRequests ?? this.numberOfInsuranceRequests,
        numberOfCreditRequests: numberOfCreditRequests ?? this.numberOfCreditRequests,
      );

  factory CategoryRequests.fromJson(Map<String, dynamic> json) => CategoryRequests(
    numberOfAccountRequests: json["number_of_account_requests"],
    numberOfInsuranceRequests: json["number_of_insurance_requests"],
    numberOfCreditRequests: json["number_of_credit_requests"],
  );

  Map<String, dynamic> toJson() => {
    "number_of_account_requests": numberOfAccountRequests,
    "number_of_insurance_requests": numberOfInsuranceRequests,
    "number_of_credit_requests": numberOfCreditRequests,
  };
}