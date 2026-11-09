import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';
import 'scroll_reveal.dart';

class MaxWidth extends StatelessWidget {
  const MaxWidth({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) => Center(
    child: ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1180),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: child,
      ),
    ),
  );
}

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({
    super.key,
    required this.eyebrow,
    required this.title,
    required this.subtitle,
    required this.child,
    this.dark = false,
  });
  final String eyebrow, title, subtitle;
  final Widget child;
  final bool dark;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final light = theme.brightness == Brightness.light;
    return ScrollReveal(
      child: Container(
        color: dark && !light
            ? const Color(0xFF090B19)
            : theme.scaffoldBackgroundColor,
        child: MaxWidth(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  eyebrow,
                  style: const TextStyle(
                    color: PortfolioColors.accent,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.8,
                    fontFamily: PortfolioTypography.headingFamily,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  title,
                  style: TextStyle(
                    color: dark && !light
                        ? PortfolioColors.ink
                        : context.portfolioText,
                    fontSize: 41,
                    height: 1.1,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -1.4,
                    fontFamily: PortfolioTypography.headingFamily,
                  ),
                ),
                const SizedBox(height: 17),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 720),
                  child: Text(
                    subtitle,
                    style: TextStyle(
                      color: context.portfolioMuted,
                      fontSize: 18,
                      height: 1.55,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  const NavButton(this.text, this.onPressed, {super.key});
  final String text;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) => TextButton(
    onPressed: onPressed,
    style: TextButton.styleFrom(
      foregroundColor: PortfolioColors.muted,
      padding: const EdgeInsets.all(16),
    ),
    child: Text(text),
  );
}

class StatItem extends StatelessWidget {
  const StatItem(this.value, this.label, {super.key});
  final String value, label;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 210,
    child: Column(
      children: [
        Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onSurface,
            fontSize: 27,
            fontWeight: FontWeight.w800,
            fontFamily: PortfolioTypography.headingFamily,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(color: context.portfolioMuted, fontSize: 13),
        ),
      ],
    ),
  );
}
