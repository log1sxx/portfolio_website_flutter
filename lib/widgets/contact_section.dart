import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({
    super.key,
    required this.english,
    required this.onPhone,
    required this.onTelegram,
    required this.onEmail,
  });

  final bool english;
  final VoidCallback onPhone;
  final VoidCallback onTelegram;
  final VoidCallback onEmail;

  @override
  Widget build(BuildContext context) => LayoutBuilder(
    builder: (_, constraints) {
      final columns = constraints.maxWidth > 820 ? 3 : 1;
      final width = (constraints.maxWidth - (columns - 1) * 16) / columns;
      return Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          SizedBox(
            width: width,
            child: _ContactCard(
              icon: Icons.phone_rounded,
              label: english ? 'Phone' : 'Телефон',
              value: '+7 988 138-25-64',
              color: PortfolioColors.cyan,
              onTap: onPhone,
            ),
          ),
          SizedBox(
            width: width,
            child: _ContactCard(
              icon: Icons.send_rounded,
              label: 'Telegram',
              value: '@logisxxx',
              color: const Color(0xFF55A9FF),
              onTap: onTelegram,
            ),
          ),
          SizedBox(
            width: width,
            child: _ContactCard(
              icon: Icons.alternate_email_rounded,
              label: english ? 'Email' : 'Почта',
              value: 'i@logisx.ru',
              color: PortfolioColors.accent,
              onTap: onEmail,
            ),
          ),
        ],
      );
    },
  );
}

class _ContactCard extends StatefulWidget {
  const _ContactCard({
    required this.icon,
    required this.label,
    required this.value,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label, value;
  final Color color;
  final VoidCallback onTap;

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
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
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: context.portfolioSurface,
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: widget.color.withValues(alpha: hovered ? .7 : .25),
          ),
          boxShadow: hovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: .18),
                    blurRadius: 28,
                  ),
                ]
              : [],
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: widget.color.withValues(alpha: .12),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(widget.icon, color: widget.color),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.label,
                    style: TextStyle(
                      color: context.portfolioMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    widget.value,
                    style: TextStyle(
                      color: context.portfolioText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.north_east_rounded, color: widget.color, size: 19),
          ],
        ),
      ),
    ),
  );
}
