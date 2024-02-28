// data_provider.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class DataProvider extends ChangeNotifier {
  String output = '';
  TextEditingController urlController = TextEditingController();
  TextEditingController yearController = TextEditingController();
  List<Map<String, dynamic>> details = [];

  void updateOutput(String newOutput) {
    output = newOutput;
    notifyListeners();
  }

  void clearDetails() {
    details.clear();
    notifyListeners();
  }
}
