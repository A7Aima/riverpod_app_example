import 'package:dio/dio.dart';
import 'package:riverpod_app/constants/configs/config.dart';
import 'package:riverpod_app/services/base_service/base_service.dart';

class CityServices extends BaseService {
  Future<Response?> getCities(String stateId) async {
    final url = Configs.baseUrlV1 + "/states/cities/$stateId";
    final _response = await dioClient.get(url);
    return _response;
  }
}
