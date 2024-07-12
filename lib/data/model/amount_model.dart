class AmountModel {
  String? totalAmount;
  String? allProductsQuantity;

  AmountModel({this.totalAmount, this.allProductsQuantity});

  AmountModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    allProductsQuantity = json['allProductsQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalAmount'] = totalAmount;
    data['allProductsQuantity'] = allProductsQuantity;
    return data;
  }
}
