class CartModel {
  String? amount;
  String? quantity;
  String? productID;
  String? enProductName;
  String? arProductName;
  String? enProductDesc;
  String? arProductDesc;
  String? productImage;
  String? productAvailability;
  String? productActive;
  String? productPrice;
  String? productDiscount;
  String? productAddTime;
  String? productCat;
  String? cartID;
  String? cartUsersID;
  String? cartProductID;

  CartModel(
      {this.amount,
      this.quantity,
      this.productID,
      this.enProductName,
      this.arProductName,
      this.enProductDesc,
      this.arProductDesc,
      this.productImage,
      this.productAvailability,
      this.productActive,
      this.productPrice,
      this.productDiscount,
      this.productAddTime,
      this.productCat,
      this.cartID,
      this.cartUsersID,
      this.cartProductID});

  CartModel.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    quantity = json['quantity'];
    productID = json['productID'];
    enProductName = json['enProductName'];
    arProductName = json['arProductName'];
    enProductDesc = json['enProductDesc'];
    arProductDesc = json['arProductDesc'];
    productImage = json['productImage'];
    productAvailability = json['productAvailability'];
    productActive = json['productActive'];
    productPrice = json['productPrice'];
    productDiscount = json['productDiscount'];
    productAddTime = json['productAddTime'];
    productCat = json['productCat'];
    cartID = json['cartID'];
    cartUsersID = json['cartUsersID'];
    cartProductID = json['cartProductID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['quantity'] = this.quantity;
    data['productID'] = this.productID;
    data['enProductName'] = this.enProductName;
    data['arProductName'] = this.arProductName;
    data['enProductDesc'] = this.enProductDesc;
    data['arProductDesc'] = this.arProductDesc;
    data['productImage'] = this.productImage;
    data['productAvailability'] = this.productAvailability;
    data['productActive'] = this.productActive;
    data['productPrice'] = this.productPrice;
    data['productDiscount'] = this.productDiscount;
    data['productAddTime'] = this.productAddTime;
    data['productCat'] = this.productCat;
    data['cartID'] = this.cartID;
    data['cartUsersID'] = this.cartUsersID;
    data['cartProductID'] = this.cartProductID;
    return data;
  }
}
