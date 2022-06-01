class Configs {
  Configs._();

  static const String baseUrl = "https://api.minebrat.com/";
  // api context
  static const String apiContext = "/api/v1";
  // receiveTimeout
  static const int receiveTimeout = 250000;
  // connectTimeout
  static const int connectionTimeout = 230000;

  static const String baseUrlV1 = baseUrl + apiContext;
}
