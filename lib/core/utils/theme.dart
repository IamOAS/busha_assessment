import 'exports.dart';
import 'dart:math';

/// Custom font family using GoogleFonts
String? customFontFamily = GoogleFonts.inter().fontFamily;

/// The app's theme data
final ThemeData appThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: CustomColors.primary70,
  colorScheme: ColorScheme.light(
    primary: CustomColors.primary70,
    background: CustomColors.backgroundOnLight,
  ),
  fontFamily: GoogleFonts.inter().fontFamily,
  textSelectionTheme: TextSelectionThemeData(cursorColor: CustomColors.primary70),
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: generateMaterialColor(CustomColors.primary70),
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: CustomColors.backgroundOnLight,
  ),
);

// Generate a MaterialColor based on a base color
MaterialColor generateMaterialColor(Color color) {
  return MaterialColor(color.value, {
    // Generate shades of the color using tintColor and shadeColor functions
    50: tintColor(color, 0.9),
    100: tintColor(color, 0.8),
    200: tintColor(color, 0.6),
    300: tintColor(color, 0.4),
    400: tintColor(color, 0.2),
    500: color,
    600: shadeColor(color, 0.1),
    700: shadeColor(color, 0.2),
    800: shadeColor(color, 0.3),
    900: shadeColor(color, 0.4),
  });
}

// Calculate the tint value of a color based on a factor
int tintValue(int value, double factor) => max(
      0,
      min((value + ((255 - value) * factor)).round(), 255),
    );

// Tint a color by applying a factor to its RGB values
Color tintColor(Color color, double factor) => Color.fromRGBO(
      tintValue(color.red, factor),
      tintValue(color.green, factor),
      tintValue(color.blue, factor),
      1,
    );

// Calculate the shade value of a color based on a factor
int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

// Shade a color by applying a factor to its RGB values
Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1,
    );
