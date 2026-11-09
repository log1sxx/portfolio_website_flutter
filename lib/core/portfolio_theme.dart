import 'package:flutter/material.dart';

abstract final class PortfolioColors {
  static const background = Color(0xFF060713);
  static const surface = Color(0xFF0D1023);
  static const surfaceAlt = Color(0xFF141831);
  static const ink = Color(0xFFF4F7FF);
  static const muted = Color(0xFF9AA4C0);
  static const accent = Color(0xFF9B6DFF);
  static const cyan = Color(0xFF29F1FF);
  static const pale = Color(0xFF17132D);
  static const border = Color(0xFF282D50);
}

abstract final class PortfolioLinks {
  static const resume =
      'https://hh.ru/resume/e89c5507ff0f06ad400039ed1f703745366279?hhtmFrom=main';
}

abstract final class PortfolioTypography {
  static const bodyFamily = 'SF Pro Display';
  static const headingFamily = 'Montserrat';
}

extension PortfolioThemeX on BuildContext {
  bool get isDarkTheme => Theme.of(this).brightness == Brightness.dark;
  Color get portfolioBackground =>
      isDarkTheme ? PortfolioColors.background : const Color(0xFFF5F7FF);
  Color get portfolioSurface =>
      isDarkTheme ? PortfolioColors.surface : Colors.white;
  Color get portfolioSurfaceAlt =>
      isDarkTheme ? PortfolioColors.surfaceAlt : const Color(0xFFEEF1FA);
  Color get portfolioText =>
      isDarkTheme ? PortfolioColors.ink : const Color(0xFF111326);
  Color get portfolioMuted =>
      isDarkTheme ? PortfolioColors.muted : const Color(0xFF66708D);
  Color get portfolioBorder =>
      isDarkTheme ? PortfolioColors.border : const Color(0xFFD8DDEC);
}

ThemeData portfolioTheme({bool dark = true}) {
  final background = dark
      ? PortfolioColors.background
      : const Color(0xFFF5F7FF);
  final surface = dark ? PortfolioColors.surface : Colors.white;
  return ThemeData(
    useMaterial3: true,
    brightness: dark ? Brightness.dark : Brightness.light,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: PortfolioColors.accent,
      brightness: dark ? Brightness.dark : Brightness.light,
      surface: surface,
    ),
    fontFamily: PortfolioTypography.bodyFamily,
    textTheme: (dark ? ThemeData.dark() : ThemeData.light()).textTheme.copyWith(
      displayLarge: const TextStyle(
        fontFamily: PortfolioTypography.headingFamily,
      ),
      displayMedium: const TextStyle(
        fontFamily: PortfolioTypography.headingFamily,
      ),
      headlineLarge: const TextStyle(
        fontFamily: PortfolioTypography.headingFamily,
      ),
      headlineMedium: const TextStyle(
        fontFamily: PortfolioTypography.headingFamily,
      ),
      titleLarge: const TextStyle(
        fontFamily: PortfolioTypography.headingFamily,
      ),
    ),
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(PortfolioColors.accent),
      radius: const Radius.circular(20),
      thickness: WidgetStateProperty.all(6),
    ),
  );
}
