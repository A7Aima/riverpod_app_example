import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/settings/routes/routes.dart';
import 'package:riverpod_app/stores/riverpod_store/detail_store/detail_store.dart';

class FetchCities extends ConsumerStatefulWidget {
  FetchCities({Key? key}) : super(key: key);

  @override
  ConsumerState<FetchCities> createState() => _FetchCitiesState();
}

class _FetchCitiesState extends ConsumerState<FetchCities> {
  Map<String, dynamic> arguments = {};
  bool isFirstRun = true;
  late DetailStore _detailStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstRun) {
      isFirstRun = false;
      _detailStore = ref.watch(detailProvider);
      _detailStore.getCities();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Cities"),
      ),
      body: ref.watch(detailProvider).citysList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ..._detailStore.citysList
                .map(
                  (city) => _stateElement(
                    name: city.cityName,
                    onPress: () {
                      _detailStore.selectedCity = city;
                      Navigator.pushNamed(
                        context,
                        Routes.showFinalResults,
                      );
                    },
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _stateElement({
    String name = "",
    required void Function() onPress,
  }) {
    return ListTile(
      title: Text(name),
      onTap: onPress,
    );
  }
}
