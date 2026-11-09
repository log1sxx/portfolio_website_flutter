import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';
import '../pages/portfolio_page.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  bool dark = true;
  bool english = false;

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter-разработчик — портфолио',
    theme: portfolioTheme(dark: false),
    darkTheme: portfolioTheme(),
    themeMode: dark ? ThemeMode.dark : ThemeMode.light,
    themeAnimationDuration: const Duration(milliseconds: 450),
    themeAnimationCurve: Curves.easeInOutCubic,
    home: PortfolioPage(
      dark: dark,
      english: english,
      onToggleTheme: () => setState(() => dark = !dark),
      onToggleLanguage: () => setState(() => english = !english),
    ),
  );
}
