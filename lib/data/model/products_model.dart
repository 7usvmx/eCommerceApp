class ProductsModel {
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
  String? catID;
  String? enCatName;
  String? arCatName;
  String? catImage;
  String? catCreationTime;
  String? isFavorite;
  String? discount;

  ProductsModel({
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
    this.catID,
    this.enCatName,
    this.arCatName,
    this.catImage,
    this.catCreationTime,
    this.isFavorite,
    this.discount,
  });

  ProductsModel.fromJson(Map<String, dynamic> json) {
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
    catID = json['catID'];
    enCatName = json['enCatName'];
    arCatName = json['arCatName'];
    catImage = json['catImage'];
    catCreationTime = json['catCreationTime'];
    isFavorite = json['favorite'];
    discount = json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['catID'] = catID;
    data['enCatName'] = enCatName;
    data['arCatName'] = arCatName;
    data['catImage'] = catImage;
    data['catCreationTime'] = catCreationTime;
    data['favorite'] = isFavorite;
    data['discount'] = discount;
    return data;
  }
}
