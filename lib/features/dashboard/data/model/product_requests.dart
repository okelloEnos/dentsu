class ProductRequests{
  final String? id;
  final String? productName;
  final String? productCategoryType;

  ProductRequests({
    this.id,
    this.productName,
    this.productCategoryType,
  });

  ProductRequests copyWith({
    String? id,
    String? productName,
    String? productCategoryType,
  }) =>
      ProductRequests(
        id: id ?? this.id,
        productName: productName ?? this.productName,
        productCategoryType: productCategoryType ?? this.productCategoryType,
      );

  factory ProductRequests.fromJson(Map<String, dynamic> json) => ProductRequests(
    id: json["id"],
    productName: json["product_name"],
    productCategoryType: json["product_category_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_name": productName,
    "product_category_type": productCategoryType,
  };
}