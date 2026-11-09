import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';
import '../models/portfolio_models.dart';

class JobCard extends StatelessWidget {
  const JobCard({super.key, required this.data, required this.last});
  final JobData data;
  final bool last;
  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 16,
              height: 16,
              decoration: BoxDecoration(
                color: PortfolioColors.accent,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: PortfolioColors.accent.withValues(alpha: .55),
                    blurRadius: 14,
                  ),
                ],
                border: Border.all(color: PortfolioColors.cyan, width: 3),
              ),
            ),
            if (!last)
              Expanded(
                child: Container(width: 2, color: PortfolioColors.border),
              ),
          ],
        ),
        const SizedBox(width: 24),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(bottom: last ? 0 : 48),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.period,
                  style: TextStyle(
                    color: PortfolioColors.accent,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                    fontFamily: PortfolioTypography.headingFamily,
                  ),
                ),
                const SizedBox(height: 9),
                Text(
                  data.role,
                  style: TextStyle(
                    color: context.portfolioText,
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    fontFamily: PortfolioTypography.headingFamily,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.company,
                  style: TextStyle(
                    color: context.portfolioMuted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 13),
                Text(
                  data.description,
                  style: TextStyle(
                    color: context.portfolioMuted,
                    fontSize: 15,
                    height: 1.55,
                  ),
                ),
                const SizedBox(height: 15),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: data.tags
                      .map(
                        (tag) => Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: context.portfolioSurfaceAlt,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            tag,
                            style: const TextStyle(
                              color: PortfolioColors.cyan,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
