class AmountModel {
  String? totalAmount;
  String? allProductsQuantity;

  AmountModel({this.totalAmount, this.allProductsQuantity});

  AmountModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    allProductsQuantity = json['allProductsQuantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalAmount'] = this.totalAmount;
    data['allProductsQuantity'] = this.allProductsQuantity;
    return data;
  }
}
