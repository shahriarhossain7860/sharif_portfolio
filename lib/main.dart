import 'package:flutter/material.dart';

import 'sections.dart';
import 'theme.dart';
import 'widgets.dart';

void main() => runApp(const PortfolioApp());

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sharif Shahriar Hossain | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _scroll = ScrollController();
  final Map<SectionId, GlobalKey> _keys = {
    for (final s in SectionId.values) s: GlobalKey(),
  };

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Duration get _duration => MediaQuery.of(context).disableAnimations
      ? Duration.zero
      : const Duration(milliseconds: 550);

  void _go(SectionId id) {
    final ctx = _keys[id]?.currentContext;
    if (ctx == null) return;
    Scrollable.ensureVisible(
      ctx,
      duration: _duration,
      curve: Curves.easeInOutCubic,
    );
  }

  void _top() {
    _scroll.animateTo(0, duration: _duration, curve: Curves.easeInOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      endDrawer: MenuDrawer(
        onSelect: (id) {
          Navigator.of(context).pop();
          _go(id);
        },
      ),
      body: SelectionArea(
        child: Column(
          children: [
            NavBar(
              onNavigate: _go,
              onTop: _top,
              onMenu: () => _scaffoldKey.currentState?.openEndDrawer(),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scroll,
                child: Column(
                  children: [
                    HeroSection(onProjects: () => _go(SectionId.projects)),
                    AboutSection(key: _keys[SectionId.about]),
                    ExperienceSection(key: _keys[SectionId.experience]),
                    ProjectsSection(key: _keys[SectionId.projects]),
                    SkillsSection(key: _keys[SectionId.skills]),
                    EducationSection(key: _keys[SectionId.education]),
                    ContactSection(key: _keys[SectionId.contact]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
