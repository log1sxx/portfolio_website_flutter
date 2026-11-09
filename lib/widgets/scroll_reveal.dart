import 'dart:async';

import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ScrollReveal extends StatefulWidget {
  const ScrollReveal({
    super.key,
    required this.child,
    this.delay = Duration.zero,
    this.offset = const Offset(0, .07),
  });

  final Widget child;
  final Duration delay;
  final Offset offset;

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  final detectorKey = UniqueKey();
  bool visible = false;
  Timer? timer;

  void reveal(VisibilityInfo info) {
    if (visible || timer != null || info.visibleFraction < .08) return;
    timer = Timer(widget.delay, () {
      if (mounted) setState(() => visible = true);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => VisibilityDetector(
    key: detectorKey,
    onVisibilityChanged: reveal,
    child: AnimatedSlide(
      offset: visible ? Offset.zero : widget.offset,
      duration: const Duration(milliseconds: 720),
      curve: Curves.easeOutCubic,
      child: AnimatedOpacity(
        opacity: visible ? 1 : 0,
        duration: const Duration(milliseconds: 620),
        curve: Curves.easeOutCubic,
        child: widget.child,
      ),
    ),
  );
}
