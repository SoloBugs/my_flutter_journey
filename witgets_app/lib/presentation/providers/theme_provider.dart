import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:witgets_app/config/theme/app_theme.dart';

final isDarkMode = StateProvider<bool>((ref) => false);

//listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//seleccion de color
final selectedColorProvider = StateProvider((ref) => 0);

//Objeto custom AppTheme
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

class ThemeNotifier extends StateNotifier<AppTheme> {
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
    state = state.copyWith(isDarkModeOn: !state.isDarkModeOn);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
