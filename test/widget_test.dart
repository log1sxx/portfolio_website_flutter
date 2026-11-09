import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_website_flutter/app/portfolio_app.dart';

void main() {
  testWidgets('portfolio renders core sections', (tester) async {
    await tester.pumpWidget(const PortfolioApp());

    expect(find.text('Flutter Developer'), findsOneWidget);
    expect(find.textContaining('Создаю мобильные'), findsOneWidget);
    expect(find.text('Смотреть проекты'), findsOneWidget);
  });
}
