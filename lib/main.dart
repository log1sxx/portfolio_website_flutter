import 'package:flutter/material.dart';
import 'package:flutter_smooth_wheel_scroll/flutter_smooth_wheel_scroll.dart';
import 'package:visibility_detector/visibility_detector.dart';

import 'app/portfolio_app.dart';

void main() {
  SmoothWheelBinding.ensureInitialized(scale: .72);
  VisibilityDetectorController.instance.updateInterval = Duration.zero;
  runApp(const PortfolioApp());
}
