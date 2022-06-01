class CityModel {
  final cityId;
  final cityName;

  CityModel({
    this.cityId,
    this.cityName,
  });

  factory CityModel.fromJson(Map<String, dynamic> parseJson) {
    return CityModel(
      cityId: parseJson['cityId'],
      cityName: parseJson['cityName'],
    );
  }
}
