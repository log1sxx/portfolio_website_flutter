import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';

class GithubProjects extends StatelessWidget {
  const GithubProjects({
    super.key,
    required this.english,
    required this.onPortfolio,
    required this.onMarketProject,
  });

  final bool english;
  final VoidCallback onPortfolio;
  final VoidCallback onMarketProject;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, constraints) {
      final columns = constraints.maxWidth > 760 ? 2 : 1;
      final width = (constraints.maxWidth - (columns - 1) * 18) / columns;
      return Wrap(
        spacing: 18,
        runSpacing: 18,
        children: [
          SizedBox(
            width: width,
            child: _RepositoryCard(
              title: 'portfolio_website_flutter',
              description: english
                  ? 'The source code of this portfolio. The website is built entirely with Flutter Web.'
                  : 'Исходный код этого портфолио. Сайт полностью написан на Flutter Web.',
              tags: const ['Flutter', 'Web', 'Responsive UI'],
              featuredLabel: english ? 'THIS WEBSITE' : 'ЭТОТ САЙТ',
              color: PortfolioColors.cyan,
              onTap: onPortfolio,
            ),
          ),
          SizedBox(
            width: width,
            child: _RepositoryCard(
              title: 'market_test_project',
              description: english
                  ? 'A public Flutter test project available for code and architecture review.'
                  : 'Публичный тестовый Flutter-проект, доступный для просмотра кода и архитектуры.',
              tags: const ['Flutter', 'Dart', 'GitHub'],
              featuredLabel: english ? 'PUBLIC PROJECT' : 'ПУБЛИЧНЫЙ ПРОЕКТ',
              color: PortfolioColors.accent,
              onTap: onMarketProject,
            ),
          ),
        ],
      );
    },
  );
}

class _RepositoryCard extends StatefulWidget {
  const _RepositoryCard({
    required this.title,
    required this.description,
    required this.tags,
    required this.featuredLabel,
    required this.color,
    required this.onTap,
  });

  final String title, description, featuredLabel;
  final List<String> tags;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_RepositoryCard> createState() => _RepositoryCardState();
}

class _RepositoryCardState extends State<_RepositoryCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    cursor: SystemMouseCursors.click,
    onEnter: (_) => setState(() => hovered = true),
    onExit: (_) => setState(() => hovered = false),
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        transform: Matrix4.translationValues(0, hovered ? -5 : 0, 0),
        padding: const EdgeInsets.all(26),
        decoration: BoxDecoration(
          color: context.portfolioSurface,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(
            color: widget.color.withValues(alpha: hovered ? .7 : .28),
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: .15),
                    blurRadius: 30,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: widget.color.withValues(alpha: .12),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Icon(Icons.account_tree_rounded, color: widget.color),
                ),
                const Spacer(),
                Icon(Icons.north_east_rounded, color: widget.color, size: 22),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              widget.featuredLabel,
              style: TextStyle(
                color: widget.color,
                fontSize: 10,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.3,
                fontFamily: PortfolioTypography.headingFamily,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              widget.title,
              style: TextStyle(
                color: context.portfolioText,
                fontSize: 21,
                fontWeight: FontWeight.w800,
                fontFamily: PortfolioTypography.headingFamily,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              widget.description,
              style: TextStyle(
                color: context.portfolioMuted,
                fontSize: 15,
                height: 1.55,
              ),
            ),
            const SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: widget.tags
                  .map(
                    (tag) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: widget.color.withValues(alpha: .08),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        tag,
                        style: TextStyle(
                          color: widget.color,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
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
  );
}
