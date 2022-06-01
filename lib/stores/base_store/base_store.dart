import 'package:flutter/material.dart';

class BaseStore extends ChangeNotifier {
  Map<String, dynamic> navArguments = {};
  bool loading = false;
}
