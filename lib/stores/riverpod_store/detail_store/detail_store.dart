import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/models/city_model/city_model.dart';
import 'package:riverpod_app/models/state_model/state_model.dart';
import 'package:riverpod_app/services/request_services/city_services/city_services.dart';
import 'package:riverpod_app/services/request_services/state_services/state_service.dart';
import 'package:riverpod_app/stores/base_store/base_store.dart';
// import 'package:riverpod_app/stores/base_store/base_store.dart';

final detailProvider = ChangeNotifierProvider<DetailStore>((ref) {
  return DetailStore();
});

class DetailStore extends BaseStore {
  StateServices _stateServices = StateServices();
  CityServices _cityServices = CityServices();

  String name = "";
  String age = "";

  void setName(String value) {
    name = value;
    notifyListeners();
  }

  void setAge(String value) {
    age = value;
    notifyListeners();
  }

  List<StateModel> statesList = [];
  StateModel? selectedState;

  List<CityModel> citysList = [];
  CityModel? selectedCity;

  Future<void> getStates() async {
    // loading = true;
    statesList.clear();
    final response = await _stateServices.getStates();
    if (response != null) {
      if (response.statusCode == 200) {
        response.data.forEach((state) {
          statesList.add(StateModel.fromJson(state));
        });
      }
    }
    // loading = false;
    notifyListeners();
  }

  Future<void> getCities() async {
    if (selectedState != null) {
      citysList.clear();
      final response = await _cityServices.getCities(selectedState!.stateId);
      if (response != null) {
        if (response.statusCode == 200) {
          response.data.forEach((city) {
            citysList.add(CityModel.fromJson(city));
          });
        }
      }
    }
    notifyListeners();
  }
}
