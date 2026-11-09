import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../core/portfolio_theme.dart';
import '../data/portfolio_data.dart';
import '../widgets/architecture_diagram.dart';
import '../widgets/ai_expertise.dart';
import '../widgets/case_study.dart';
import '../widgets/contact_section.dart';
import '../widgets/github_projects.dart';
import '../widgets/job_card.dart';
import '../widgets/layout_widgets.dart';
import '../widgets/phone_mockup.dart';
import '../widgets/portfolio_header.dart';
import '../widgets/project_card.dart';
import '../widgets/skill_card.dart';

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    super.key,
    required this.dark,
    required this.english,
    required this.onToggleTheme,
    required this.onToggleLanguage,
  });
  final bool dark, english;
  final VoidCallback onToggleTheme, onToggleLanguage;
  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final projectsKey = GlobalKey(),
      skillsKey = GlobalKey(),
      experienceKey = GlobalKey();
  void _scrollTo(GlobalKey key) => Scrollable.ensureVisible(
    key.currentContext!,
    duration: const Duration(milliseconds: 950),
    curve: Curves.easeInOutCubic,
    alignment: .04,
  );
  Future<void> _open(String url) =>
      launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
  String t(String ru, String en) => widget.english ? en : ru;

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SelectionArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: PortfolioHeader(
              onProjects: () => _scrollTo(projectsKey),
              onSkills: () => _scrollTo(skillsKey),
              onExperience: () => _scrollTo(experienceKey),
              onResume: () => _open(PortfolioLinks.resume),
              dark: widget.dark,
              english: widget.english,
              onToggleTheme: widget.onToggleTheme,
              onToggleLanguage: widget.onToggleLanguage,
            ),
          ),
          SliverToBoxAdapter(child: _hero()),
          SliverToBoxAdapter(child: _stats()),
          SliverToBoxAdapter(
            child: PortfolioSection(
              eyebrow: t('РАЗБОР КЕЙСА', 'CASE STUDY'),
              title: t(
                'Продуктовый подход в деталях',
                'Product thinking in detail',
              ),
              subtitle: t(
                'Не просто набор экранов, а цельный пользовательский сценарий с измеримым результатом.',
                'Not just a set of screens, but a complete user journey with a measurable outcome.',
              ),
              child: CaseStudy(
                english: widget.english,
                onOpenProject: () => _open(
                  'https://play.google.com/store/apps/details?id=ru.domproclick',
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              key: projectsKey,
              eyebrow: t('ИЗБРАННЫЕ ПРОЕКТЫ', 'FEATURED PROJECTS'),
              title: t(
                'Приложения, которыми пользуются',
                'Apps people actually use',
              ),
              subtitle: t(
                'Продукты из недвижимости, финансов, спорта и криптовалют — от архитектуры до публикации.',
                'Products across real estate, finance, sports and crypto — from architecture to release.',
              ),
              child: _projects(),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              dark: true,
              eyebrow: t('ПОД КАПОТОМ', 'UNDER THE HOOD'),
              title: t(
                'Архитектура, которая масштабируется',
                'Architecture that scales',
              ),
              subtitle: t(
                'Разделение ответственности между слоями упрощает тестирование, поддержку и развитие продукта.',
                'Clear separation of concerns makes testing, maintenance and growth easier.',
              ),
              child: const ArchitectureDiagram(),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              key: skillsKey,
              dark: true,
              eyebrow: t('ЭКСПЕРТИЗА', 'EXPERTISE'),
              title: t(
                'Надёжная разработка\nбез лишней сложности',
                'Reliable engineering\nwithout needless complexity',
              ),
              subtitle: t(
                'Продуманная архитектура, предсказуемое состояние и инфраструктура для быстрого развития продукта.',
                'Thoughtful architecture, predictable state and infrastructure for rapid product growth.',
              ),
              child: _skills(),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              eyebrow: t('НЕЙРОСЕТИ', 'ARTIFICIAL INTELLIGENCE'),
              title: t(
                'Использую AI как инженерный инструмент',
                'AI as an engineering tool',
              ),
              subtitle: t(
                'Нейросети помогают быстрее проверять идеи, повышать качество кода и создавать интеллектуальные функции для приложений.',
                'AI helps me validate ideas faster, improve code quality and build intelligent application features.',
              ),
              child: AiExpertise(english: widget.english),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              key: experienceKey,
              eyebrow: t('ОПЫТ', 'EXPERIENCE'),
              title: t('Путь разработчика', 'Developer journey'),
              subtitle: t(
                'Коммерческая Flutter-разработка с 2022 года: продуктовые команды, публикации и поддержка приложений.',
                'Commercial Flutter development since 2022: product teams, releases and app maintenance.',
              ),
              child: _timeline(),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              dark: true,
              eyebrow: 'OPEN SOURCE',
              title: t(
                'Код можно посмотреть на GitHub',
                'Explore the code on GitHub',
              ),
              subtitle: t(
                'Этот сайт также разработан на Flutter. Репозитории открыты для просмотра реализации и архитектурных решений.',
                'This website is also built with Flutter. The repositories are open for reviewing the implementation and architecture.',
              ),
              child: GithubProjects(
                english: widget.english,
                onPortfolio: () => _open(
                  'https://github.com/log1sxx/portfolio_website_flutter',
                ),
                onMarketProject: () =>
                    _open('https://github.com/log1sxx/market_test_project'),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: PortfolioSection(
              dark: true,
              eyebrow: t('КОНТАКТЫ', 'CONTACTS'),
              title: t('Будем на связи', 'Let’s stay in touch'),
              subtitle: t(
                'Выберите удобный способ связи — отвечу на вопросы и обсудим ваш проект.',
                'Choose the most convenient way to reach me and discuss your project.',
              ),
              child: ContactSection(
                english: widget.english,
                onPhone: () => _open('tel:+79881382564'),
                onTelegram: () => _open('https://t.me/logisxxx'),
                onEmail: () => _open('mailto:i@logisx.ru'),
              ),
            ),
          ),
          SliverToBoxAdapter(child: _footer()),
        ],
      ),
    ),
  );

  Widget _hero() => MaxWidth(
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 86),
      child: LayoutBuilder(
        builder: (_, constraints) {
          final narrow = constraints.maxWidth < 850;
          final copy = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 13,
                  vertical: 9,
                ),
                decoration: BoxDecoration(
                  color: PortfolioColors.cyan.withValues(alpha: .09),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  t('●  ОТКРЫТ К НОВЫМ ПРОЕКТАМ', '●  OPEN TO NEW PROJECTS'),
                  style: TextStyle(
                    color: PortfolioColors.cyan,
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: .6,
                    fontFamily: PortfolioTypography.headingFamily,
                  ),
                ),
              ),
              const SizedBox(height: 28),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: t(
                        'Создаю мобильные\nприложения на ',
                        'I build mobile\napps with ',
                      ),
                    ),
                    const TextSpan(
                      text: 'Flutter',
                      style: TextStyle(color: PortfolioColors.accent),
                    ),
                  ],
                ),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: narrow ? 45 : 63,
                  height: 1.03,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -2.3,
                  fontFamily: PortfolioTypography.headingFamily,
                ),
              ),
              const SizedBox(height: 27),
              Text(
                t(
                  'Проектирую архитектуру, интегрирую сложные сервисы и довожу продукты до публикации. Более 15 приложений в Google Play.',
                  'I design architecture, integrate complex services and ship products. More than 15 apps published on Google Play.',
                ),
                style: const TextStyle(
                  color: PortfolioColors.muted,
                  fontSize: 18,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 35),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  FilledButton.icon(
                    onPressed: () => _scrollTo(projectsKey),
                    icon: const Icon(Icons.arrow_downward_rounded, size: 18),
                    label: Text(t('Смотреть проекты', 'View projects')),
                    style: FilledButton.styleFrom(
                      backgroundColor: PortfolioColors.accent,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 20,
                      ),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () => _open(PortfolioLinks.resume),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: PortfolioColors.cyan,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 20,
                      ),
                    ),
                    child: Text(t('Открыть резюме', 'Open resume')),
                  ),
                ],
              ),
            ],
          );
          return narrow
              ? copy
              : Row(
                  children: [
                    Expanded(flex: 3, child: copy),
                    const SizedBox(width: 60),
                    Expanded(
                      flex: 2,
                      child: PhoneMockup(english: widget.english),
                    ),
                  ],
                );
        },
      ),
    ),
  );

  Widget _stats() => Container(
    color: context.portfolioSurface,
    child: MaxWidth(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 40),
        child: Wrap(
          alignment: WrapAlignment.spaceAround,
          spacing: 38,
          runSpacing: 28,
          children: [
            StatItem(
              t('4+ года', '4+ years'),
              t('коммерческой разработки', 'commercial development'),
            ),
            StatItem('15+', t('приложений опубликовано', 'apps published')),
            StatItem(
              '50 000+',
              t('установок одного продукта', 'installs for one product'),
            ),
            StatItem(
              'Android · iOS',
              t('единая кодовая база', 'single codebase'),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _projects() => LayoutBuilder(
    builder: (_, constraints) {
      final columns = constraints.maxWidth > 900 ? 2 : 1;
      final width = (constraints.maxWidth - (columns - 1) * 22) / columns;
      return Wrap(
        spacing: 22,
        runSpacing: 22,
        children: (widget.english ? projectsDataEn : projectsData)
            .map(
              (project) => SizedBox(
                width: width,
                child: ProjectCard(
                  data: project,
                  onTap: () => _open(project.url),
                ),
              ),
            )
            .toList(),
      );
    },
  );
  Widget _skills() => LayoutBuilder(
    builder: (_, constraints) {
      final columns = constraints.maxWidth > 900
          ? 3
          : constraints.maxWidth > 600
          ? 2
          : 1;
      final width = (constraints.maxWidth - (columns - 1) * 18) / columns;
      return Wrap(
        spacing: 18,
        runSpacing: 18,
        children: (widget.english ? skillsDataEn : skillsData)
            .map(
              (skill) => SizedBox(
                width: width,
                child: SkillCard(data: skill),
              ),
            )
            .toList(),
      );
    },
  );
  Widget _timeline() => Column(
    children: [
      for (var i = 0; i < (widget.english ? jobsDataEn : jobsData).length; i++)
        JobCard(
          data: (widget.english ? jobsDataEn : jobsData)[i],
          last: i == (widget.english ? jobsDataEn : jobsData).length - 1,
        ),
    ],
  );

  Widget _footer() => Container(
    color: context.isDarkTheme
        ? const Color(0xFF03040B)
        : const Color(0xFFE9ECF7),
    child: MaxWidth(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 70),
        child: LayoutBuilder(
          builder: (_, constraints) {
            final copy = Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  t(
                    'Давайте создадим\nсильный продукт.',
                    'Let’s build a\ngreat product.',
                  ),
                  style: TextStyle(
                    color: context.portfolioText,
                    fontSize: 38,
                    height: 1.12,
                    fontWeight: FontWeight.w800,
                    fontFamily: PortfolioTypography.headingFamily,
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  t(
                    'Подробные контакты и актуальный статус — в резюме на hh.ru.',
                    'Contact details and current availability are in my resume.',
                  ),
                  style: TextStyle(color: context.portfolioMuted, fontSize: 17),
                ),
              ],
            );
            final button = FilledButton.icon(
              onPressed: () => _open(PortfolioLinks.resume),
              icon: const Icon(Icons.open_in_new_rounded, size: 18),
              label: Text(t('Открыть резюме', 'Open resume')),
              style: FilledButton.styleFrom(
                backgroundColor: PortfolioColors.accent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 20,
                ),
              ),
            );
            return constraints.maxWidth < 650
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [copy, const SizedBox(height: 28), button],
                  )
                : Row(
                    children: [
                      Expanded(child: copy),
                      button,
                    ],
                  );
          },
        ),
      ),
    ),
  );
}
