class CategoriesModel {
  String? catID;
  String? enCatName;
  String? arCatName;
  String? catImage;
  String? catCreationTime;

  CategoriesModel(
      {this.catID,
      this.enCatName,
      this.arCatName,
      this.catImage,
      this.catCreationTime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    catID = json['catID'];
    enCatName = json['enCatName'];
    arCatName = json['arCatName'];
    catImage = json['catImage'];
    catCreationTime = json['catCreationTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['catID'] = catID;
    data['enCatName'] = enCatName;
    data['arCatName'] = arCatName;
    data['catImage'] = catImage;
    data['catCreationTime'] = catCreationTime;
    return data;
  }
}
