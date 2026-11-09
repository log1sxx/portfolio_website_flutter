import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';
import '../models/portfolio_models.dart';

class SkillCard extends StatelessWidget {
  const SkillCard({super.key, required this.data});
  final SkillData data;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: context.portfolioSurface,
      borderRadius: BorderRadius.circular(22),
      border: Border.all(color: context.portfolioBorder),
      boxShadow: [
        BoxShadow(
          color: PortfolioColors.accent.withValues(alpha: .08),
          blurRadius: 24,
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(data.icon, color: PortfolioColors.cyan, size: 28),
        const SizedBox(height: 21),
        Text(
          data.title,
          style: TextStyle(
            color: context.portfolioText,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: PortfolioTypography.headingFamily,
          ),
        ),
        const SizedBox(height: 9),
        Text(
          data.description,
          style: TextStyle(
            color: context.portfolioMuted,
            fontSize: 14,
            height: 1.55,
          ),
        ),
      ],
    ),
  );
}
