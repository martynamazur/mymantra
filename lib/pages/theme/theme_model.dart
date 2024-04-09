import 'package:flutter/cupertino.dart';
import 'package:mymantra/models/background_model.dart';

class ThemeModel extends ChangeNotifier {
  bool isDarkModeOn = false;
  int backgroundChoice = 1;
  String currentBackgroundPath = 'assets/backgrounds/background1.png';

  List<Background> backgrounds = [
    Background('assets/backgrounds/background0.png', 0),
    Background('assets/backgrounds/background1.png', 1),
    Background('assets/backgrounds/background2.png', 2),
    Background('assets/backgrounds/background3.png', 3),
    Background('assets/backgrounds/background4.png', 4),
    Background('assets/backgrounds/background1.png', 1),
    Background('assets/backgrounds/background2.png', 2),
    Background('assets/backgrounds/background3.png', 3),
    Background('assets/backgrounds/background4.png', 4),
  ];

  void updateBackgroundChoice(newValue, newPath) {
    backgroundChoice = newValue;
    setCurrentBackgroundPath(newPath);
    notifyListeners();
  }

  void updateDarkMode() {
    isDarkModeOn = !isDarkModeOn;
    notifyListeners();
  }

  void setCurrentBackgroundPath(String path) {
    currentBackgroundPath = path;
    notifyListeners();
  }
}
