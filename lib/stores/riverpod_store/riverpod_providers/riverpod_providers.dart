import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/stores/riverpod_store/detail_store/detail_store.dart';

final detailProvider = ChangeNotifierProvider<DetailStore>((ref) {
  return DetailStore();
});
