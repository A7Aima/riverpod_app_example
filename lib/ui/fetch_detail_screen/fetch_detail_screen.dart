import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/settings/routes/routes.dart';
import 'package:riverpod_app/stores/riverpod_store/detail_store/detail_store.dart';

class FetchDetailScreen extends ConsumerStatefulWidget {
  const FetchDetailScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<FetchDetailScreen> createState() => _FetchDetailScreenState();
}

class _FetchDetailScreenState extends ConsumerState<FetchDetailScreen> {
  TextEditingController _controllersName = TextEditingController();
  TextEditingController _controllersAge = TextEditingController();
  bool _onFirstRun = true;
  late DetailStore _detailStore;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_onFirstRun) {
      _onFirstRun = false;
      _detailStore = ref.read(detailProvider);
      _controllersName.addListener(() {
        ref.watch(detailProvider).setName(_controllersName.text);
      });
      _controllersAge.addListener(() {
        ref.watch(detailProvider).setAge(_controllersAge.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fetch Details Screen"),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 35,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _provideText(
            _detailStore.name,
          ),
          _provideText(
            _detailStore.age,
          ),
          _buildTextField(
            controllers: _controllersName,
            hintText: "Name",
          ),
          _buildTextField(
            controllers: _controllersAge,
            hintText: "Age",
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(
                const Size(100, 50),
              ),
            ),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.fetchState,
              );
            },
            child: const Text("Submit"),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    TextEditingController? controllers,
    String hintText = "Type here",
  }) {
    return TextField(
      controller: controllers,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }

  Widget _provideText(String value) {
    return Text(
      "$value",
      style: TextStyle(fontSize: 20),
    );
  }
}
