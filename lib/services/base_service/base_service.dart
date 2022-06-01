import 'package:riverpod_app/services/dio_setup/dio_client/dio_client.dart';
import 'package:riverpod_app/services/network_module/network_module.dart';

class BaseService {
  late DioClient dioClient;

  BaseService() {
    dioClient = DioClient(NetworkModule().provideDio());
  }
}
