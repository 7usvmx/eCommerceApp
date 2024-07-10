class MyFavoritesModel {
  String? favID;
  String? userID;
  String? favProductID;
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
  String? usersID;

  MyFavoritesModel(
      {this.favID,
      this.userID,
      this.favProductID,
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
      this.usersID});

  MyFavoritesModel.fromJson(Map<String, dynamic> json) {
    favID = json['favID'];
    userID = json['userID'];
    favProductID = json['favProduct_ID'];
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
    usersID = json['usersID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['favID'] = favID;
    data['userID'] = userID;
    data['favProduct_ID'] = favProductID;
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
    data['usersID'] = usersID;
    return data;
  }
}
