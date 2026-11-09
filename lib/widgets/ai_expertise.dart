import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';

class AiExpertise extends StatelessWidget {
  const AiExpertise({super.key, required this.english});
  final bool english;

  @override
  Widget build(BuildContext context) {
    final items = english ? _englishItems : _russianItems;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
          decoration: BoxDecoration(
            color: PortfolioColors.cyan.withValues(alpha: .09),
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: PortfolioColors.cyan.withValues(alpha: .25),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.auto_awesome_rounded,
                color: PortfolioColors.cyan,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                english ? 'AI-ASSISTED DEVELOPMENT' : 'AI В РАЗРАБОТКЕ',
                style: const TextStyle(
                  color: PortfolioColors.cyan,
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                  fontFamily: PortfolioTypography.headingFamily,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        LayoutBuilder(
          builder: (_, constraints) {
            final columns = constraints.maxWidth > 900
                ? 4
                : constraints.maxWidth > 560
                ? 2
                : 1;
            final width = (constraints.maxWidth - (columns - 1) * 16) / columns;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: items
                  .map(
                    (item) => SizedBox(
                      width: width,
                      child: _AiCard(item: item),
                    ),
                  )
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}

class _AiCard extends StatefulWidget {
  const _AiCard({required this.item});
  final _AiItem item;

  @override
  State<_AiCard> createState() => _AiCardState();
}

class _AiCardState extends State<_AiCard> {
  bool hovered = false;

  @override
  Widget build(BuildContext context) => MouseRegion(
    onEnter: (_) => setState(() => hovered = true),
    onExit: (_) => setState(() => hovered = false),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 220),
      transform: Matrix4.translationValues(0, hovered ? -5 : 0, 0),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: context.portfolioSurface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: (hovered ? PortfolioColors.cyan : context.portfolioBorder)
              .withValues(alpha: hovered ? .65 : 1),
        ),
        boxShadow: hovered
            ? [
                BoxShadow(
                  color: PortfolioColors.cyan.withValues(alpha: .14),
                  blurRadius: 28,
                ),
              ]
            : [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [PortfolioColors.accent, PortfolioColors.cyan],
              ),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(widget.item.icon, color: Colors.white, size: 22),
          ),
          const SizedBox(height: 20),
          Text(
            widget.item.title,
            style: TextStyle(
              color: context.portfolioText,
              fontSize: 17,
              fontWeight: FontWeight.w800,
              fontFamily: PortfolioTypography.headingFamily,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            widget.item.description,
            style: TextStyle(
              color: context.portfolioMuted,
              fontSize: 14,
              height: 1.55,
            ),
          ),
        ],
      ),
    ),
  );
}

class _AiItem {
  const _AiItem(this.title, this.description, this.icon);
  final String title, description;
  final IconData icon;
}

const _russianItems = [
  _AiItem(
    'Codex и разработка',
    'Использую OpenAI Codex для поиска решений, работы с кодом, рефакторинга и автоматизации рутинных задач.',
    Icons.code_rounded,
  ),
  _AiItem(
    'Качество кода',
    'Применяю нейросети для анализа, рефакторинга, поиска ошибок и подготовки тестовых сценариев.',
    Icons.fact_check_outlined,
  ),
  _AiItem(
    'Прототипирование',
    'Быстро проверяю продуктовые гипотезы, структуру экранов и пользовательские сценарии.',
    Icons.draw_rounded,
  ),
  _AiItem(
    'AI-функции',
    'Могу интегрировать нейросетевые API и интеллектуальные сценарии в мобильные приложения.',
    Icons.psychology_alt_rounded,
  ),
];

const _englishItems = [
  _AiItem(
    'Codex and development',
    'I use OpenAI Codex to explore solutions, work with code, refactor and automate routine development tasks.',
    Icons.code_rounded,
  ),
  _AiItem(
    'Code quality',
    'I apply AI to code analysis, refactoring, error detection and test scenario preparation.',
    Icons.fact_check_outlined,
  ),
  _AiItem(
    'Prototyping',
    'I quickly validate product hypotheses, screen structures and user journeys.',
    Icons.draw_rounded,
  ),
  _AiItem(
    'AI features',
    'I can integrate neural network APIs and intelligent workflows into mobile applications.',
    Icons.psychology_alt_rounded,
  ),
];
