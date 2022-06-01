import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/settings/routes/routes.dart';
import 'package:riverpod_app/stores/riverpod_store/detail_store/detail_store.dart';

class FetchStates extends ConsumerStatefulWidget {
  const FetchStates({Key? key}) : super(key: key);

  @override
  ConsumerState<FetchStates> createState() => _FetchStatesState();
}

class _FetchStatesState extends ConsumerState<FetchStates> {
  Map<String, dynamic> arguments = {};
  bool isFirstRun = true;
  late DetailStore _detailStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstRun) {
      isFirstRun = false;
      _detailStore = ref.read(detailProvider);
      _detailStore.getStates();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch State"),
      ),
      body: ref.watch(detailProvider).statesList.isEmpty
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
            ..._detailStore.statesList
                .map(
                  (state) => _stateElement(
                    name: state.stateName,
                    onPress: () {
                      _detailStore.selectedState = state;
                      Navigator.pushNamed(
                        context,
                        Routes.fetchCity,
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
