class TLocation {
  String? _latitude;
  String? _longitude;

  TLocation(this._latitude, this._longitude);
  TLocation.withId(this._latitude, this._longitude);

  // getters
  String get latitude => _latitude!;
  String get longitude => _longitude!;

  @override
  String toString() {
    return "Locations:{latitude:$_latitude,longitude:$_longitude}";
  }

  // setters
  set latitude(String newLatitude) => this._latitude = newLatitude;
  set longitude(String newLongitude) => this._longitude = newLongitude;

// convert a Location object to a Map object
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();

    map['latitude'] = this._latitude;
    map['longitude'] = this._longitude;

    return map;
  }

  TLocation.fromMapObject(Map<String, dynamic> map) {
    this._latitude = map['latitude'];
    this._longitude = map['longitude'];
  }
}
