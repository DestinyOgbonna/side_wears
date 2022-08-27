import 'package:building_ui/exports/exports.dart';

class AppThemeProvider extends ChangeNotifier {
  Brightness? _brightness;
  Brightness? get brightness => _brightness;
  set brightnessMode(Brightness value) {
    _brightness = value;
    notifyListeners();
  }

  void switchBrightness() {
    _brightness =
        _brightness == Brightness.light ? Brightness.dark : Brightness.light;
    notifyListeners();
  }
}
