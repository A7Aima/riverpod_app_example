import 'package:dio/dio.dart';
import 'package:riverpod_app/constants/configs/config.dart';
import 'package:riverpod_app/services/base_service/base_service.dart';

class StateServices extends BaseService {
  Future<Response?> getStates() async {
    final url = Configs.baseUrlV1 + "/states";
    final _response = await dioClient.get(url);
    return _response;
  }
}
