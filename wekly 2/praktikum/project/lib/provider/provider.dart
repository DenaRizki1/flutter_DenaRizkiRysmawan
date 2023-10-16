import 'package:flutter/cupertino.dart';
import 'package:project/utils/helper.dart';

class MainProvider with ChangeNotifier {
  String _timeString = "";

  String get timeString => _timeString;

  void getTimeJam() {
    _timeString = parseDateInd(DateTime.now().toString(), "HH:mm:ss");
    notifyListeners();
  }
}
