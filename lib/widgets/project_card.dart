import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';
import '../models/portfolio_models.dart';

class ProjectCard extends StatefulWidget {
  const ProjectCard({super.key, required this.data, required this.onTap});
  final ProjectData data;
  final VoidCallback onTap;
  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool hovered = false;
  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => hovered = true),
    onExit: (_) => setState(() => hovered = false),
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(0, hovered ? -6 : 0, 0),
        padding: const EdgeInsets.all(28),
        decoration: BoxDecoration(
          color: context.isDarkTheme
              ? widget.data.background
              : context.portfolioSurface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: widget.data.accent.withValues(alpha: hovered ? .65 : .22),
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: widget.data.accent.withValues(alpha: .22),
                    blurRadius: 32,
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
                  width: 54,
                  height: 54,
                  decoration: BoxDecoration(
                    color: context.portfolioSurfaceAlt,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(widget.data.icon, color: widget.data.accent),
                ),
                const Spacer(),
                Icon(Icons.north_east_rounded, color: widget.data.accent),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              widget.data.category.toUpperCase(),
              style: TextStyle(
                color: widget.data.accent,
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 1.4,
                fontFamily: PortfolioTypography.headingFamily,
              ),
            ),
            const SizedBox(height: 9),
            Text(
              widget.data.name,
              style: TextStyle(
                color: context.portfolioText,
                fontSize: 22,
                fontWeight: FontWeight.w800,
                fontFamily: PortfolioTypography.headingFamily,
              ),
            ),
            const SizedBox(height: 11),
            Text(
              widget.data.description,
              style: TextStyle(
                color: context.portfolioMuted,
                fontSize: 15,
                height: 1.55,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
              decoration: BoxDecoration(
                color: context.portfolioSurfaceAlt.withValues(alpha: .9),
                borderRadius: BorderRadius.circular(9),
              ),
              child: Text(
                widget.data.metric,
                style: TextStyle(
                  color: widget.data.accent,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
