import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/stores/riverpod_store/detail_store/detail_store.dart';

class ShowFinalResult extends ConsumerStatefulWidget {
  const ShowFinalResult({Key? key}) : super(key: key);

  @override
  ConsumerState<ShowFinalResult> createState() => _ShowFinalResultState();
}

class _ShowFinalResultState extends ConsumerState<ShowFinalResult> {
  Map<String, dynamic> arguments = {};
  bool isFirstRun = true;
  late DetailStore _detailStore;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isFirstRun) {
      isFirstRun = false;
      _detailStore = ref.watch(detailProvider);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: const Text("Show Final Result"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 35,
        ),
        child: Text(
          "Your Name is ${_detailStore.name}\nYour Age is ${_detailStore.age} \nand ur from\n\n${_detailStore.selectedState?.stateName ?? "null"} \nin\n ${_detailStore.selectedCity?.cityName ?? "null"}",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
