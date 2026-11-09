import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';

class ArchitectureDiagram extends StatelessWidget {
  const ArchitectureDiagram({super.key});

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, constraints) {
      final vertical = constraints.maxWidth < 760;
      final layers = const [
        _Layer(
          'Presentation',
          'UI · BLoC · Navigation',
          Icons.widgets_rounded,
          PortfolioColors.accent,
        ),
        _Layer(
          'Domain',
          'Entities · Use Cases · Contracts',
          Icons.account_tree_rounded,
          PortfolioColors.cyan,
        ),
        _Layer(
          'Data',
          'Repository · Retrofit · Floor',
          Icons.storage_rounded,
          Color(0xFFFFB86B),
        ),
      ];
      final children = <Widget>[];
      for (var i = 0; i < layers.length; i++) {
        final card = _LayerCard(layer: layers[i]);
        children.add(vertical ? card : Expanded(child: card));
        if (i != layers.length - 1) children.add(_Arrow(vertical: vertical));
      }
      return Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: context.portfolioSurface,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(color: context.portfolioBorder),
        ),
        child: vertical
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: children,
              )
            : Row(children: children),
      );
    },
  );
}

class _Layer {
  const _Layer(this.title, this.subtitle, this.icon, this.color);
  final String title, subtitle;
  final IconData icon;
  final Color color;
}

class _LayerCard extends StatelessWidget {
  const _LayerCard({required this.layer});
  final _Layer layer;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: layer.color.withValues(alpha: .07),
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: layer.color.withValues(alpha: .35)),
      boxShadow: [
        BoxShadow(color: layer.color.withValues(alpha: .08), blurRadius: 24),
      ],
    ),
    child: Column(
      children: [
        Icon(layer.icon, color: layer.color, size: 30),
        const SizedBox(height: 14),
        Text(
          layer.title,
          style: TextStyle(
            color: context.portfolioText,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            fontFamily: PortfolioTypography.headingFamily,
          ),
        ),
        const SizedBox(height: 7),
        Text(
          layer.subtitle,
          textAlign: TextAlign.center,
          style: TextStyle(color: context.portfolioMuted, height: 1.45),
        ),
      ],
    ),
  );
}

class _Arrow extends StatelessWidget {
  const _Arrow({required this.vertical});
  final bool vertical;
  @override
  Widget build(BuildContext context) => Padding(
    padding: vertical
        ? const EdgeInsets.symmetric(vertical: 12)
        : const EdgeInsets.symmetric(horizontal: 12),
    child: Icon(
      vertical ? Icons.arrow_downward_rounded : Icons.arrow_forward_rounded,
      color: PortfolioColors.cyan,
    ),
  );
}
