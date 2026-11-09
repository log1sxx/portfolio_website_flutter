import 'package:flutter/material.dart';

import '../models/portfolio_models.dart';

const projectsData = [
  ProjectData(
    name: 'Дом Ключ',
    category: 'Недвижимость',
    description: 'Поиск, фильтры, сравнение объектов, избранное и персональные уведомления.',
    metric: '50 000+ установок',
    background: Color(0xFF15112B),
    accent: Color(0xFFB388FF),
    url: 'https://play.google.com/store/apps/details?id=ru.domproclick',
    icon: Icons.apartment_rounded,
  ),
  ProjectData(
    name: 'ФинОпора',
    category: 'Финансы',
    description: 'Анализ кредитной нагрузки, персональные рекомендации и сценарии рефинансирования.',
    metric: 'Финансовый помощник',
    background: Color(0xFF09252A),
    accent: Color(0xFF29F1FF),
    url: 'https://play.google.com/store/apps/details?id=ru.fingidapp.fingid',
    icon: Icons.account_balance_wallet_rounded,
  ),
  ProjectData(
    name: 'Фрибет',
    category: 'Спорт',
    description: 'Матчи, результаты, статистика команд, коэффициенты, прогнозы и аналитика.',
    metric: '4 вида спорта',
    background: Color(0xFF261B16),
    accent: Color(0xFFFFB86B),
    url: 'https://play.google.com/store/apps/details?id=ru.sportapiappbom',
    icon: Icons.sports_soccer_rounded,
  ),
  ProjectData(
    name: 'Hodler',
    category: 'Crypto tracker',
    description:
        'Курсы, портфель, интерактивные графики и offline-история транзакций.',
    metric: 'Offline-first',
    background: Color(0xFF0B1C32),
    accent: Color(0xFF4DA3FF),
    url: 'https://play.google.com/store/search?q=hodler&c=apps&gl=DE',
    icon: Icons.show_chart_rounded,
  ),
];

const skillsData = [
  SkillData(
    'Архитектура',
    'Clean Architecture, SOLID, Feature-Sliced, модульность и dependency injection.',
    Icons.account_tree_rounded,
  ),
  SkillData(
    'State management',
    'BLoC и GetX: прозрачные состояния и предсказуемые потоки.',
    Icons.hub_rounded,
  ),
  SkillData(
    'API и данные',
    'Dio, Retrofit, code generation, interceptors, SQLite и Floor.',
    Icons.sync_alt_rounded,
  ),
  SkillData(
    'Интеграции',
    'Firebase, push, Deep Links, Google Maps, графики и offline-кэш.',
    Icons.extension_rounded,
  ),
  SkillData(
    'Интерфейсы',
    'Адаптивная вёрстка, кастомные виджеты, анимации и навигация.',
    Icons.auto_awesome_rounded,
  ),
  SkillData(
    'Delivery',
    'Fastlane, GitHub Actions, Google Play, Git и code review.',
    Icons.rocket_launch_rounded,
  ),
];

const jobsData = [
  JobData(
    'ЯНВАРЬ 2024 — СЕЙЧАС',
    'Flutter-разработчик',
    'Продуктовая разработка',
    'Разработка и поддержка 15+ приложений: архитектура, API, Firebase, Deep Links, offline-режим, CI/CD и публикация.',
    ['Clean Architecture', 'BLoC', 'Dio', 'Firebase', 'Fastlane'],
  ),
  JobData(
    'АВГУСТ 2023 — ЯНВАРЬ 2024',
    'Программист-разработчик',
    'ООО «Нейросигнал»',
    'Hodler — трекер криптовалют и портфеля с графиками, push-уведомлениями и активным offline-кэшированием.',
    ['Flutter', 'Floor', 'SQLite', 'Analytics', 'FCM'],
  ),
  JobData(
    'ФЕВРАЛЬ 2022 — АВГУСТ 2023',
    'Программист-разработчик',
    'ITTAB',
    'Android- и iOS-приложения: Nedvex, социальный сервис NikahTime и образовательное приложение Cambridge Junior.',
    ['Flutter', 'GetX', 'AutoRoute', 'Firestore', 'Animations'],
  ),
];

const projectsDataEn = [
  ProjectData(
    name: 'Dom Klyuch',
    category: 'Real estate',
    description: 'Property search, filters, comparison, favorites and personalized notifications.',
    metric: '50,000+ installs',
    background: Color(0xFF15112B),
    accent: Color(0xFFB388FF),
    url: 'https://play.google.com/store/apps/details?id=ru.domproclick',
    icon: Icons.apartment_rounded,
  ),
  ProjectData(
    name: 'FinOpora',
    category: 'Finance',
    description: 'Credit load analysis, personalized recommendations and refinancing scenarios.',
    metric: 'Financial assistant',
    background: Color(0xFF09252A),
    accent: Color(0xFF29F1FF),
    url: 'https://play.google.com/store/apps/details?id=ru.fingidapp.fingid',
    icon: Icons.account_balance_wallet_rounded,
  ),
  ProjectData(
    name: 'Freebet',
    category: 'Sports',
    description:
        'Matches, results, team statistics, odds, predictions and analytics.',
    metric: '4 sports',
    background: Color(0xFF261B16),
    accent: Color(0xFFFFB86B),
    url: 'https://play.google.com/store/apps/details?id=ru.sportapiappbom',
    icon: Icons.sports_soccer_rounded,
  ),
  ProjectData(
    name: 'Hodler',
    category: 'Crypto tracker',
    description:
        'Rates, portfolio, interactive charts and offline transaction history.',
    metric: 'Offline-first',
    background: Color(0xFF0B1C32),
    accent: Color(0xFF4DA3FF),
    url: 'https://play.google.com/store/search?q=hodler&c=apps&gl=DE',
    icon: Icons.show_chart_rounded,
  ),
];

const skillsDataEn = [
  SkillData(
    'Architecture',
    'Clean Architecture, SOLID, Feature-Sliced, modularity and dependency injection.',
    Icons.account_tree_rounded,
  ),
  SkillData(
    'State management',
    'BLoC and GetX: transparent states and predictable data flows.',
    Icons.hub_rounded,
  ),
  SkillData(
    'API and data',
    'Dio, Retrofit, code generation, interceptors, SQLite and Floor.',
    Icons.sync_alt_rounded,
  ),
  SkillData(
    'Integrations',
    'Firebase, push, Deep Links, Google Maps, charts and offline cache.',
    Icons.extension_rounded,
  ),
  SkillData(
    'Interfaces',
    'Responsive layouts, custom widgets, animation and navigation.',
    Icons.auto_awesome_rounded,
  ),
  SkillData(
    'Delivery',
    'Fastlane, GitHub Actions, Google Play, Git and code review.',
    Icons.rocket_launch_rounded,
  ),
];

const jobsDataEn = [
  JobData(
    'JANUARY 2024 — PRESENT',
    'Flutter Developer',
    'Product development',
    'Development and maintenance of 15+ apps: architecture, API, Firebase, Deep Links, offline mode, CI/CD and releases.',
    ['Clean Architecture', 'BLoC', 'Dio', 'Firebase', 'Fastlane'],
  ),
  JobData(
    'AUGUST 2023 — JANUARY 2024',
    'Software Developer',
    'Neurosignal LLC',
    'Hodler — a crypto and portfolio tracker with charts, push notifications and active offline caching.',
    ['Flutter', 'Floor', 'SQLite', 'Analytics', 'FCM'],
  ),
  JobData(
    'FEBRUARY 2022 — AUGUST 2023',
    'Software Developer',
    'ITTAB',
    'Android and iOS apps: Nedvex, the NikahTime social service and Cambridge Junior education app.',
    ['Flutter', 'GetX', 'AutoRoute', 'Firestore', 'Animations'],
  ),
];
