import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Increassizeprovider extends ChangeNotifier {
  double _fontSize = 15.0;
  bool _isFontIncreased = false;

  double get fontSize => _fontSize;
  bool get isFontIncreased => _isFontIncreased;

  void toggleFontSize() {
    _fontSize = _isFontIncreased ? 15.0 : 20.0;
    _isFontIncreased = !_isFontIncreased;
    notifyListeners();
  }
}
