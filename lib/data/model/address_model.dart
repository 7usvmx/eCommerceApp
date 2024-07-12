class AddressModel {
  String? addressID;
  String? addressUserID;
  String? addressName;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;

  AddressModel(
      {this.addressID,
      this.addressUserID,
      this.addressName,
      this.addressCity,
      this.addressStreet,
      this.addressLat,
      this.addressLong});

  AddressModel.fromJson(Map<String, dynamic> json) {
    addressID = json['addressID'];
    addressUserID = json['addressUserID'];
    addressName = json['addressName'];
    addressCity = json['addressCity'];
    addressStreet = json['addressStreet'];
    addressLat = json['addressLat'];
    addressLong = json['addressLong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['addressID'] = addressID;
    data['addressUserID'] = addressUserID;
    data['addressName'] = addressName;
    data['addressCity'] = addressCity;
    data['addressStreet'] = addressStreet;
    data['addressLat'] = addressLat;
    data['addressLong'] = addressLong;
    return data;
  }
}
