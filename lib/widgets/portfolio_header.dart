import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';
import 'layout_widgets.dart';

enum HeaderAction { projects, skills, experience, resume }

class PortfolioHeader extends SliverPersistentHeaderDelegate {
  PortfolioHeader({
    required this.onProjects,
    required this.onSkills,
    required this.onExperience,
    required this.onResume,
    required this.dark,
    required this.english,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });

  final VoidCallback onProjects;
  final VoidCallback onSkills;
  final VoidCallback onExperience;
  final VoidCallback onResume;
  final bool dark;
  final bool english;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLanguage;

  @override
  double get minExtent => 76;

  @override
  double get maxExtent => 76;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final elevated = overlapsContent || shrinkOffset > 0;
    return Material(
      color: (dark ? PortfolioColors.background : const Color(0xFFF8F9FF))
          .withValues(alpha: .94),
      elevation: elevated ? 5 : 0,
      shadowColor: PortfolioColors.accent.withValues(alpha: .35),
      child: MaxWidth(
        child: LayoutBuilder(
          builder: (_, constraints) {
            final compact = constraints.maxWidth < 900;
            return Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [PortfolioColors.accent, PortfolioColors.cyan],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: PortfolioColors.accent.withValues(alpha: .35),
                        blurRadius: 18,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: const Text(
                    'F',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                      fontFamily: PortfolioTypography.headingFamily,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Flutter Developer',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: dark
                          ? PortfolioColors.ink
                          : const Color(0xFF101225),
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      fontFamily: PortfolioTypography.headingFamily,
                    ),
                  ),
                ),
                _HeaderControl(
                  tooltip: english ? 'Change language' : 'Сменить язык',
                  onPressed: onToggleLanguage,
                  child: Text(
                    english ? 'EN' : 'RU',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                ),
                const SizedBox(width: 4),
                _HeaderControl(
                  tooltip: dark
                      ? (english ? 'Light theme' : 'Светлая тема')
                      : (english ? 'Dark theme' : 'Тёмная тема'),
                  onPressed: onToggleTheme,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
                      key: ValueKey(dark),
                      size: 21,
                    ),
                  ),
                ),
                const SizedBox(width: 6),
                if (compact)
                  PopupMenuButton<HeaderAction>(
                    tooltip: english ? 'Open menu' : 'Открыть меню',
                    icon: const Icon(Icons.menu_rounded, size: 30),
                    color: PortfolioColors.surfaceAlt,
                    surfaceTintColor: PortfolioColors.surfaceAlt,
                    position: PopupMenuPosition.under,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    onSelected: _handleAction,
                    itemBuilder: (_) => [
                      PopupMenuItem(
                        value: HeaderAction.projects,
                        child: _MenuItem(
                          Icons.work_outline_rounded,
                          english ? 'Projects' : 'Проекты',
                        ),
                      ),
                      PopupMenuItem(
                        value: HeaderAction.skills,
                        child: _MenuItem(
                          Icons.code_rounded,
                          english ? 'Skills' : 'Навыки',
                        ),
                      ),
                      PopupMenuItem(
                        value: HeaderAction.experience,
                        child: _MenuItem(
                          Icons.timeline_rounded,
                          english ? 'Experience' : 'Опыт',
                        ),
                      ),
                      const PopupMenuDivider(),
                      PopupMenuItem(
                        value: HeaderAction.resume,
                        child: _MenuItem(
                          Icons.open_in_new_rounded,
                          english ? 'Resume' : 'Резюме',
                        ),
                      ),
                    ],
                  )
                else ...[
                  NavButton(english ? 'Projects' : 'Проекты', onProjects),
                  NavButton(english ? 'Skills' : 'Навыки', onSkills),
                  NavButton(english ? 'Experience' : 'Опыт', onExperience),
                  const SizedBox(width: 8),
                  FilledButton(
                    onPressed: onResume,
                    style: FilledButton.styleFrom(
                      backgroundColor: PortfolioColors.accent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 18,
                      ),
                    ),
                    child: Text(english ? 'Resume ↗' : 'Резюме ↗'),
                  ),
                ],
              ],
            );
          },
        ),
      ),
    );
  }

  void _handleAction(HeaderAction action) {
    switch (action) {
      case HeaderAction.projects:
        onProjects();
        return;
      case HeaderAction.skills:
        onSkills();
        return;
      case HeaderAction.experience:
        onExperience();
        return;
      case HeaderAction.resume:
        onResume();
        return;
    }
  }

  @override
  bool shouldRebuild(covariant PortfolioHeader oldDelegate) =>
      onProjects != oldDelegate.onProjects ||
      onSkills != oldDelegate.onSkills ||
      onExperience != oldDelegate.onExperience ||
      onResume != oldDelegate.onResume ||
      dark != oldDelegate.dark ||
      english != oldDelegate.english;
}

class _HeaderControl extends StatelessWidget {
  const _HeaderControl({
    required this.tooltip,
    required this.onPressed,
    required this.child,
  });
  final String tooltip;
  final VoidCallback onPressed;
  final Widget child;
  @override
  Widget build(BuildContext context) => Tooltip(
    message: tooltip,
    child: InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: SizedBox(width: 42, height: 42, child: Center(child: child)),
    ),
  );
}

class _MenuItem extends StatelessWidget {
  const _MenuItem(this.icon, this.label);

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Icon(icon, size: 20, color: PortfolioColors.accent),
      const SizedBox(width: 12),
      Text(label),
    ],
  );
}
