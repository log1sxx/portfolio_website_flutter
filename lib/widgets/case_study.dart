import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';

class CaseStudy extends StatelessWidget {
  const CaseStudy({
    super.key,
    required this.onOpenProject,
    required this.english,
  });
  final VoidCallback onOpenProject;
  final bool english;
  String t(String ru, String en) => english ? en : ru;

  @override
  Widget build(BuildContext context) {
    final dark = context.isDarkTheme;
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: dark
              ? const [Color(0xFF17122F), Color(0xFF081D2A)]
              : const [Color(0xFFFFFFFF), Color(0xFFEAFBFF)],
        ),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: PortfolioColors.accent.withValues(alpha: .38),
        ),
        boxShadow: [
          BoxShadow(
            color: PortfolioColors.accent.withValues(alpha: dark ? .12 : .08),
            blurRadius: 40,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final narrow = constraints.maxWidth < 760;
          final intro = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t('ДОМ КЛЮЧ · НЕДВИЖИМОСТЬ', 'DOM KLYUCH · REAL ESTATE'),
                style: const TextStyle(
                  color: PortfolioColors.cyan,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.4,
                ),
              ),
              const SizedBox(height: 14),
              Text(
                t(
                  'От поиска объекта до связи с продавцом',
                  'From property search to contacting the seller',
                ),
                style: TextStyle(
                  color: context.portfolioText,
                  fontSize: 28,
                  height: 1.15,
                  fontWeight: FontWeight.w800,
                  fontFamily: PortfolioTypography.headingFamily,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                t(
                  'Приложение объединяет поиск, фильтрацию, подробные карточки, сравнение предложений, избранное и персональные уведомления.',
                  'The app combines search, filters, detailed listings, offer comparison, favorites and personalized notifications.',
                ),
                style: TextStyle(
                  color: context.portfolioMuted,
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: onOpenProject,
                icon: const Icon(Icons.open_in_new_rounded, size: 18),
                label: const Text('Google Play'),
                style: FilledButton.styleFrom(
                  backgroundColor: PortfolioColors.accent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 17,
                  ),
                ),
              ),
            ],
          );
          final facts = Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _Fact(
                t('Задача', 'Challenge'),
                t(
                  'Упростить поиск и сравнение недвижимости',
                  'Simplify property search and comparison',
                ),
                Icons.search_rounded,
              ),
              _Fact(
                t('Роль', 'Role'),
                t(
                  'Flutter-разработка и интеграции',
                  'Flutter development and integrations',
                ),
                Icons.code_rounded,
              ),
              _Fact(
                t('Результат', 'Result'),
                t('Более 50 000 установок', 'More than 50,000 installs'),
                Icons.trending_up_rounded,
              ),
              _Fact(
                t('Фокус', 'Focus'),
                t('Скорость, UX и стабильность', 'Speed, UX and stability'),
                Icons.bolt_rounded,
              ),
            ],
          );
          return narrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [intro, const SizedBox(height: 32), facts],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: intro),
                    const SizedBox(width: 42),
                    Expanded(child: facts),
                  ],
                );
        },
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  const _Fact(this.title, this.value, this.icon);
  final String title, value;
  final IconData icon;
  @override
  Widget build(BuildContext context) => SizedBox(
    width: 210,
    child: Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: context.portfolioSurface.withValues(alpha: .82),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: context.portfolioBorder),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: PortfolioColors.cyan, size: 22),
          const SizedBox(height: 13),
          Text(
            title,
            style: TextStyle(color: context.portfolioMuted, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              color: context.portfolioText,
              fontWeight: FontWeight.w700,
              height: 1.4,
            ),
          ),
        ],
      ),
    ),
  );
}
