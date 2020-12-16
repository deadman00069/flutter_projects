class AddAddress {
  String house;
  String landmark;
  String area;
  String city;
  String pinCode;
  String id;
  AddAddress(
      {this.house, this.area, this.landmark, this.city, this.pinCode, this.id});
  Map<String, String> addData() => {
        'house': house,
        'landmark': landmark,
        'city': city,
        'pinCode': pinCode,
        'area': area,
        'id': id,
      };
}
