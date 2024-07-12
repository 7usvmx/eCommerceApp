// class CartModel {
//   String? amount;
//   String? quantity;
//   String? productID;
//   String? enProductName;
//   String? arProductName;
//   String? enProductDesc;
//   String? arProductDesc;
//   String? productImage;
//   String? productAvailability;
//   String? productActive;
//   String? productPrice;
//   String? productDiscount;
//   String? productAddTime;
//   String? productCat;
//   String? cartID;
//   String? cartUsersID;
//   String? cartProductID;

//   CartModel(
//       {this.amount,
//         this.quantity,
//         this.productID,
//         this.enProductName,
//         this.arProductName,
//         this.enProductDesc,
//         this.arProductDesc,
//         this.productImage,
//         this.productAvailability,
//         this.productActive,
//         this.productPrice,
//         this.productDiscount,
//         this.productAddTime,
//         this.productCat,
//         this.cartID,
//         this.cartUsersID,
//         this.cartProductID});

//   CartModel.fromJson(Map<String, dynamic> json) {
//     amount = json['amount'];
//     quantity = json['quantity'];
//     productID = json['productID'];
//     enProductName = json['enProductName'];
//     arProductName = json['arProductName'];
//     enProductDesc = json['enProductDesc'];
//     arProductDesc = json['arProductDesc'];
//     productImage = json['productImage'];
//     productAvailability = json['productAvailability'];
//     productActive = json['productActive'];
//     productPrice = json['productPrice'];
//     productDiscount = json['productDiscount'];
//     productAddTime = json['productAddTime'];
//     productCat = json['productCat'];
//     cartID = json['cartID'];
//     cartUsersID = json['cartUsersID'];
//     cartProductID = json['cartProductID'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['amount'] = amount;
//     data['quantity'] = quantity;
//     data['productID'] = productID;
//     data['enProductName'] = enProductName;
//     data['arProductName'] = arProductName;
//     data['enProductDesc'] = enProductDesc;
//     data['arProductDesc'] = arProductDesc;
//     data['productImage'] = productImage;
//     data['productAvailability'] = productAvailability;
//     data['productActive'] = productActive;
//     data['productPrice'] = productPrice;
//     data['productDiscount'] = productDiscount;
//     data['productAddTime'] = productAddTime;
//     data['productCat'] = productCat;
//     data['cartID'] = cartID;
//     data['cartUsersID'] = cartUsersID;
//     data['cartProductID'] = cartProductID;
//     return data;
//   }
// }

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['amount'] = amount;
    data['quantity'] = quantity;
    data['productID'] = productID;
    data['enProductName'] = enProductName;
    data['arProductName'] = arProductName;
    data['enProductDesc'] = enProductDesc;
    data['arProductDesc'] = arProductDesc;
    data['productImage'] = productImage;
    data['productAvailability'] = productAvailability;
    data['productActive'] = productActive;
    data['productPrice'] = productPrice;
    data['productDiscount'] = productDiscount;
    data['productAddTime'] = productAddTime;
    data['productCat'] = productCat;
    data['cartID'] = cartID;
    data['cartUsersID'] = cartUsersID;
    data['cartProductID'] = cartProductID;
    return data;
  }
}
