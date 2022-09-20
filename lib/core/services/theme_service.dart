import 'package:building_ui/core/exports/exports.dart';

class MyThemingService {
  ThemeData? _darkTheming;
  ThemeData? _lightTheming;
  ThemeData? get darkTheming => _darkTheming;
  ThemeData? get lightTheming => _lightTheming;
  void light() {
    _lightTheming = ThemeData(brightness: Brightness.light);
  }

  void dark() {
    _darkTheming = ThemeData(brightness: Brightness.dark);
  }
}
