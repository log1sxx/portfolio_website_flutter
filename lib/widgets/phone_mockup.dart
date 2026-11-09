import 'package:flutter/material.dart';

import '../core/portfolio_theme.dart';

class PhoneMockup extends StatefulWidget {
  const PhoneMockup({super.key, required this.english});
  final bool english;
  @override
  State<PhoneMockup> createState() => _PhoneMockupState();
}

class _PhoneMockupState extends State<PhoneMockup> {
  int selected = 0;

  @override
  Widget build(BuildContext context) => Transform.rotate(
    angle: .05,
    child: Container(
      height: 480,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: PortfolioColors.surfaceAlt,
        borderRadius: BorderRadius.circular(44),
        border: Border.all(color: PortfolioColors.accent.withValues(alpha: .7)),
        boxShadow: [
          BoxShadow(
            color: PortfolioColors.accent.withValues(alpha: .38),
            blurRadius: 50,
            offset: const Offset(0, 24),
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
        decoration: BoxDecoration(
          color: PortfolioColors.pale,
          borderRadius: BorderRadius.circular(34),
        ),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 6,
              decoration: BoxDecoration(
                color: PortfolioColors.cyan,
                borderRadius: BorderRadius.circular(9),
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 420),
                switchInCurve: Curves.easeOutCubic,
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween(
                      begin: const Offset(.08, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: KeyedSubtree(
                  key: ValueKey(selected),
                  child: _screen(selected),
                ),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => GestureDetector(
                  onTap: () => setState(() => selected = index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: selected == index ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: selected == index
                          ? PortfolioColors.cyan
                          : PortfolioColors.border,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _screen(int index) => switch (index) {
    0 => _PortfolioScreen(english: widget.english),
    1 => _PropertyScreen(english: widget.english),
    _ => _NotificationScreen(english: widget.english),
  };
}

class _PortfolioScreen extends StatelessWidget {
  const _PortfolioScreen({required this.english});
  final bool english;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        english ? 'Portfolio' : 'Портфель',
        style: const TextStyle(color: PortfolioColors.muted),
      ),
      const SizedBox(height: 7),
      const Text(
        '₽ 1 284 500',
        style: TextStyle(
          color: PortfolioColors.ink,
          fontSize: 27,
          fontWeight: FontWeight.w800,
          fontFamily: PortfolioTypography.headingFamily,
        ),
      ),
      const SizedBox(height: 22),
      const Expanded(
        child: CustomPaint(
          painter: PortfolioChartPainter(),
          child: SizedBox.expand(),
        ),
      ),
      const SizedBox(height: 18),
      Row(
        children: [
          Expanded(
            child: _Metric(
              english ? 'Return' : 'Доходность',
              '+18,4%',
              const Color(0xFF12B76A),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: _Metric(
              english ? 'Assets' : 'Активы',
              '12',
              PortfolioColors.accent,
            ),
          ),
        ],
      ),
    ],
  );
}

class _PropertyScreen extends StatelessWidget {
  const _PropertyScreen({required this.english});
  final bool english;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        english ? 'Find a property' : 'Найти квартиру',
        style: TextStyle(
          color: PortfolioColors.ink,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          fontFamily: PortfolioTypography.headingFamily,
        ),
      ),
      const SizedBox(height: 16),
      Container(
        height: 46,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: PortfolioColors.surface,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: PortfolioColors.border),
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              color: PortfolioColors.cyan,
              size: 20,
            ),
            const SizedBox(width: 9),
            Text(
              english ? 'Area or address' : 'Район или адрес',
              style: TextStyle(color: PortfolioColors.muted),
            ),
          ],
        ),
      ),
      const SizedBox(height: 14),
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF222D55), Color(0xFF10172E)],
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              const Center(
                child: Icon(
                  Icons.apartment_rounded,
                  size: 72,
                  color: PortfolioColors.accent,
                ),
              ),
              Positioned(
                left: 14,
                right: 14,
                bottom: 14,
                child: Container(
                  padding: const EdgeInsets.all(13),
                  decoration: BoxDecoration(
                    color: PortfolioColors.background.withValues(alpha: .88),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        english
                            ? '2-bedroom apartment'
                            : '2-комнатная квартира',
                        style: TextStyle(
                          color: PortfolioColors.ink,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        english ? 'from ₽12.4M' : 'от 12,4 млн ₽',
                        style: const TextStyle(
                          color: PortfolioColors.cyan,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}

class _NotificationScreen extends StatelessWidget {
  const _NotificationScreen({required this.english});
  final bool english;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        english ? 'Notifications' : 'Уведомления',
        style: TextStyle(
          color: PortfolioColors.ink,
          fontSize: 22,
          fontWeight: FontWeight.w800,
          fontFamily: PortfolioTypography.headingFamily,
        ),
      ),
      const SizedBox(height: 18),
      _Notice(
        Icons.home_work_rounded,
        english ? 'New listing' : 'Новое предложение',
        english
            ? 'A property matches your filters'
            : 'Появился объект по вашим фильтрам',
        PortfolioColors.accent,
      ),
      const SizedBox(height: 12),
      _Notice(
        Icons.trending_down_rounded,
        english ? 'Price dropped' : 'Цена снизилась',
        english
            ? 'A saved property is now cheaper'
            : 'Избранный объект стал дешевле',
        PortfolioColors.cyan,
      ),
      const SizedBox(height: 12),
      _Notice(
        Icons.check_circle_outline_rounded,
        english ? 'Selection ready' : 'Подборка готова',
        english ? 'We found 8 more options' : 'Мы нашли ещё 8 вариантов',
        Color(0xFFFFB86B),
      ),
    ],
  );
}

class _Notice extends StatelessWidget {
  const _Notice(this.icon, this.title, this.text, this.color);
  final IconData icon;
  final String title, text;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: PortfolioColors.surface,
      borderRadius: BorderRadius.circular(16),
      border: Border.all(color: color.withValues(alpha: .22)),
    ),
    child: Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: color.withValues(alpha: .12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: PortfolioColors.ink,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                text,
                style: const TextStyle(
                  color: PortfolioColors.muted,
                  fontSize: 11,
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _Metric extends StatelessWidget {
  const _Metric(this.label, this.value, this.color);
  final String label, value;
  final Color color;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(13),
    decoration: BoxDecoration(
      color: PortfolioColors.surface,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: PortfolioColors.muted, fontSize: 10),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}

class PortfolioChartPainter extends CustomPainter {
  const PortfolioChartPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final line = Path()
      ..moveTo(0, size.height * .78)
      ..cubicTo(
        size.width * .2,
        size.height * .7,
        size.width * .2,
        size.height * .35,
        size.width * .4,
        size.height * .5,
      )
      ..cubicTo(
        size.width * .58,
        size.height * .62,
        size.width * .62,
        size.height * .14,
        size.width * .75,
        size.height * .32,
      )
      ..cubicTo(
        size.width * .86,
        size.height * .45,
        size.width * .9,
        size.height * .08,
        size.width,
        size.height * .12,
      );
    final fill = Path.from(line)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    canvas.drawPath(
      fill,
      Paint()
        ..shader = const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0x5529F1FF), Color(0x0029F1FF)],
        ).createShader(Offset.zero & size),
    );
    canvas.drawPath(
      line,
      Paint()
        ..color = PortfolioColors.cyan
        ..strokeWidth = 4
        ..style = PaintingStyle.stroke
        ..strokeCap = StrokeCap.round,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
