import 'package:animation/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

class Localprovider with ChangeNotifier {
  Locale? _locale;
  Locale? get locale => _locale;

  void setLocal(Locale locale) {
    if (!L10n.all.contains(locale)) return;
    _locale = locale;
    notifyListeners();
  }
}
