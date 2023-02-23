import 'package:flutter/material.dart';

class OrientationNotifier with ChangeNotifier {
  Orientation _orientation = Orientation.portrait;

  Orientation get orientation => _orientation;

  void setOrientation(Orientation orientation) {
    if (orientation != _orientation) {
      _orientation = orientation;
      notifyListeners();
    }
  }
}