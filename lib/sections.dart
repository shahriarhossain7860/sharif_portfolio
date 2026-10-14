import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'data.dart';
import 'links.dart';
import 'theme.dart';
import 'widgets.dart';

// ===========================================================================
// Navigation
// ===========================================================================
class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onNavigate,
    required this.onTop,
    required this.onMenu,
  });

  final void Function(SectionId) onNavigate;
  final VoidCallback onTop;
  final VoidCallback onMenu;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 1080;
    return Material(
      color: Palette.bg,
      child: Container(
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Palette.line)),
        ),
        child: Constrained(
          child: SizedBox(
            height: 68,
            child: Row(
              children: [
                InkWell(
                  onTap: onTop,
                  borderRadius: BorderRadius.circular(8),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                    child: Text(siteName, style: AppText.display(18, ls: -0.3)),
                  ),
                ),
                const Spacer(),
                if (wide) ...[
                  for (final s in SectionId.values)
                    TextButton(
                      onPressed: () => onNavigate(s),
                      child: Text(s.label),
                    ),
                  const SizedBox(width: 12),
                  FilledButton(
                    onPressed: downloadCv,
                    style: FilledButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 14),
                    ),
                    child: const Text('Download CV'),
                  ),
                ] else
                  IconButton(
                    tooltip: 'Open menu',
                    onPressed: onMenu,
                    icon: const Icon(Icons.menu),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key, required this.onSelect});

  final void Function(SectionId) onSelect;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Palette.bg,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            for (final s in SectionId.values)
              ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                title: Text(s.label, style: AppText.display(24, ls: -0.4)),
                onTap: () => onSelect(s),
              ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: downloadCv,
              child: const Text('Download CV'),
            ),
          ],
        ),
      ),
    );
  }
}

// ===========================================================================
// Hero
// ===========================================================================
class HeroSection extends StatelessWidget {
  const HeroSection({super.key, required this.onProjects});

  final VoidCallback onProjects;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    final wide = w >= 900;
    final nameSize =
        w >= 1100 ? 104.0 : (w >= 900 ? 84.0 : (w >= 600 ? 76.0 : 54.0));

    final text = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Semantics(
          header: true,
          child: Text(
            'Sharif\nShahriar\nHossain',
            style: AppText.display(nameSize, h: 0.95, ls: -nameSize * 0.03),
          ),
        ),
        const SizedBox(height: 24),
        Text(
          'Flutter mobile app developer in Dhaka',
          style: AppText.display(wide ? 26 : 20,
              w: FontWeight.w600, ls: -0.3, color: Palette.teal),
        ),
        const SizedBox(height: 16),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 520),
          child: Text(heroIntro, style: AppText.body(18)),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton(
              onPressed: onProjects,
              child: const Text('See my projects'),
            ),
            OutlinedButton(
              onPressed: downloadCv,
              child: const Text('Download CV'),
            ),
          ],
        ),
      ],
    );

    final phone = Entrance(child: PhoneFrame(width: wide ? 320 : 230));

    return Padding(
      padding: EdgeInsets.symmetric(vertical: wide ? 72 : 40),
      child: Constrained(
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 6, child: text),
                  const SizedBox(width: 48),
                  Expanded(flex: 4, child: Center(child: phone)),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text,
                  const SizedBox(height: 48),
                  Center(child: phone),
                ],
              ),
      ),
    );
  }
}

/// The one animated moment on the page: the phone settles into place on load.
class Entrance extends StatelessWidget {
  const Entrance({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).disableAnimations) return child;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      child: child,
      builder: (context, v, child) {
        return Opacity(
          opacity: v.clamp(0.0, 1.0).toDouble(),
          child: Transform.translate(
            offset: Offset(0, 48 * (1 - v)),
            child: Transform.rotate(angle: 0.08 * (1 - v), child: child),
          ),
        );
      },
    );
  }
}

/// Phone-shaped frame that shows the blazer photo as the "screen".
class PhoneFrame extends StatelessWidget {
  const PhoneFrame({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final height = width * 2.0;
    const offset = 28.0;
    return SizedBox(
      width: width + offset,
      height: height + offset,
      child: Stack(
        children: [
          Positioned(
            left: offset,
            top: offset,
            right: 0,
            bottom: 0,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Palette.tealSoft,
                borderRadius: BorderRadius.circular(48),
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            width: width,
            height: height,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Palette.night,
                borderRadius: BorderRadius.circular(46),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(36),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/sharif_blazer.jpg',
                      fit: BoxFit.cover,
                      alignment: const Alignment(0.19, 0),
                      semanticLabel: 'Portrait of Sharif Shahriar Hossain',
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10),
                        width: 74,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Palette.night,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// About
// ===========================================================================
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 860;

    final photo = ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: AspectRatio(
        aspectRatio: 472 / 591,
        child: Image.asset(
          'assets/images/sharif_formal.jpg',
          fit: BoxFit.cover,
          semanticLabel: 'Formal photo of Sharif Shahriar Hossain',
        ),
      ),
    );

    final copy = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final p in aboutParagraphs)
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 640),
              child: Text(p, style: AppText.body(18)),
            ),
          ),
        const SizedBox(height: 16),
        for (final f in aboutFacts) _FactRow(label: f.$1, value: f.$2),
      ],
    );

    return Container(
      color: Palette.surface,
      child: SectionShell(
        title: 'About',
        child: wide
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(width: 320, child: photo),
                  const SizedBox(width: 56),
                  Expanded(child: copy),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 280),
                    child: photo,
                  ),
                  const SizedBox(height: 32),
                  copy,
                ],
              ),
      ),
    );
  }
}

class _FactRow extends StatelessWidget {
  const _FactRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Palette.line)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 112, child: Text(label, style: AppText.ui(15))),
          Expanded(child: Text(value, style: AppText.body(16))),
        ],
      ),
    );
  }
}

// ===========================================================================
// Experience
// ===========================================================================
class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      title: 'Experience',
      child: Column(
        children: [
          for (var i = 0; i < jobs.length; i++)
            _JobEntry(
              job: jobs[i],
              first: i == 0,
              last: i == jobs.length - 1,
            ),
        ],
      ),
    );
  }
}

class _JobEntry extends StatelessWidget {
  const _JobEntry({required this.job, required this.first, required this.last});

  final Job job;
  final bool first;
  final bool last;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 7),
          padding: EdgeInsets.only(left: 28, bottom: last ? 0 : 48),
          decoration: BoxDecoration(
            border: Border(
              left: BorderSide(
                color: last ? Colors.transparent : Palette.line,
                width: 2,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(job.role, style: AppText.display(26, ls: -0.4)),
              const SizedBox(height: 6),
              Text(job.company, style: AppText.ui(17, color: Palette.teal)),
              const SizedBox(height: 2),
              Text('${job.period}, ${job.place}', style: AppText.body(15)),
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 700),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final p in job.points)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 10, right: 12),
                              child: Container(
                                width: 5,
                                height: 5,
                                decoration: const BoxDecoration(
                                  color: Palette.teal,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(p, style: AppText.body(16)),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 6,
          child: Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: first ? Palette.teal : Palette.bg,
              shape: BoxShape.circle,
              border: Border.all(color: Palette.teal, width: 3),
            ),
          ),
        ),
      ],
    );
  }
}

// ===========================================================================
// Projects
// ===========================================================================
class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cols = MediaQuery.sizeOf(context).width >= 820 ? 2 : 1;
    final rows = <Widget>[];

    for (var i = 0; i < projects.length; i += cols) {
      final slice = projects.sublist(i, math.min(i + cols, projects.length));
      final cells = <Widget>[];
      for (var j = 0; j < cols; j++) {
        if (j > 0) cells.add(const SizedBox(width: 24));
        cells.add(
          Expanded(
            child: j < slice.length
                ? ProjectCard(project: slice[j])
                : const SizedBox.shrink(),
          ),
        );
      }
      if (rows.isNotEmpty) rows.add(const SizedBox(height: 24));
      rows.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: cells,
        ),
      );
    }

    return SectionShell(
      title: 'Projects',
      intro:
          'Apps I have built or helped ship. Each one links to its store page.',
      child: Column(children: rows),
    );
  }
}

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Palette.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Palette.line),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: project.cover,
            alignment: Alignment.bottomLeft,
            constraints: const BoxConstraints(minHeight: 168),
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project.name,
                  style: AppText.display(32,
                      color: project.onCover, ls: -0.8, h: 1.05),
                ),
                const SizedBox(height: 8),
                Text(
                  project.tagline,
                  style: AppText.ui(15,
                      color: project.onCover, w: FontWeight.w500),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(project.description, style: AppText.body(16)),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [for (final t in project.tags) TagChip(t)],
                ),
                const SizedBox(height: 24),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    for (final l in project.links)
                      OutlinedButton.icon(
                        onPressed: () => openLink(l.url),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                        ),
                        icon: const Icon(Icons.open_in_new, size: 18),
                        label: Text(l.label),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// Skills
// ===========================================================================
class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cols = MediaQuery.sizeOf(context).width >= 820 ? 2 : 1;
    const gap = 48.0;
    final itemWidth = (contentWidth(context) - gap * (cols - 1)) / cols;

    return Container(
      color: Palette.surface,
      child: SectionShell(
        title: 'Skills',
        child: Wrap(
          spacing: gap,
          runSpacing: 40,
          children: [
            for (final g in skillGroups)
              SizedBox(width: itemWidth, child: _SkillGroupView(group: g)),
          ],
        ),
      ),
    );
  }
}

class _SkillGroupView extends StatelessWidget {
  const _SkillGroupView({required this.group});

  final SkillGroup group;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Palette.ink, width: 2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(group.title, style: AppText.display(22, ls: -0.3)),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [for (final s in group.items) TagChip(s)],
          ),
        ],
      ),
    );
  }
}

// ===========================================================================
// Education
// ===========================================================================
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 720;

    return SectionShell(
      title: 'Education',
      child: Column(
        children: [
          for (final e in education)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Palette.line)),
              ),
              child: wide
                  ? Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(child: _EducationText(item: e)),
                        const SizedBox(width: 24),
                        Text(e.period, style: AppText.body(16)),
                        if (e.linkUrl != null) ...[
                          const SizedBox(width: 24),
                          _CertificateButton(item: e),
                        ],
                      ],
                    )
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _EducationText(item: e),
                        const SizedBox(height: 6),
                        Text(e.period, style: AppText.body(15)),
                        if (e.linkUrl != null) ...[
                          const SizedBox(height: 12),
                          _CertificateButton(item: e),
                        ],
                      ],
                    ),
            ),
        ],
      ),
    );
  }
}

class _EducationText extends StatelessWidget {
  const _EducationText({required this.item});

  final EducationItem item;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.title, style: AppText.display(21, ls: -0.3)),
        const SizedBox(height: 4),
        Text(item.place, style: AppText.body(16)),
      ],
    );
  }
}

class _CertificateButton extends StatelessWidget {
  const _CertificateButton({required this.item});

  final EducationItem item;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: () => openLink(item.linkUrl!),
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      icon: const Icon(Icons.open_in_new, size: 18),
      label: Text(item.linkLabel ?? 'Open'),
    );
  }
}

// ===========================================================================
// Contact + footer
// ===========================================================================
class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SectionShell(
      title: 'Contact',
      intro:
          'Tell me what you are building. Email is the quickest way to reach me.',
      background: Palette.night,
      titleColor: Colors.white,
      introColor: Palette.onNightSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              FilledButton.icon(
                onPressed: () => openLink('mailto:$email'),
                style: FilledButton.styleFrom(
                  backgroundColor: Palette.marigold,
                  foregroundColor: Palette.ink,
                ),
                icon: const Icon(Icons.mail_outline, size: 20),
                label: const Text('Email me'),
              ),
              OutlinedButton(
                onPressed: downloadCv,
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Color(0x66FFFFFF)),
                ),
                child: const Text('Download CV'),
              ),
            ],
          ),
          const SizedBox(height: 48),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: const Column(
              children: [
                _ContactRow(
                  icon: Icons.mail_outline,
                  label: 'Email',
                  value: email,
                  url: 'mailto:$email',
                ),
                _ContactRow(
                  icon: Icons.phone_outlined,
                  label: 'Phone',
                  value: phoneDisplay,
                  url: phoneLink,
                ),
                _ContactRow(
                  icon: Icons.work_outline,
                  label: 'LinkedIn',
                  value: linkedinDisplay,
                  url: linkedinUrl,
                ),
                _ContactRow(
                  icon: Icons.code,
                  label: 'GitHub',
                  value: githubDisplay,
                  url: githubUrl,
                ),
                _ContactRow(
                  icon: Icons.location_on_outlined,
                  label: 'Address',
                  value: addressDisplay,
                ),
              ],
            ),
          ),
          const SizedBox(height: 72),
          Text(
            '© ${DateTime.now().year} $siteName. Built with Flutter.',
            style:
                AppText.ui(14, color: Palette.onNightSoft, w: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}

class _ContactRow extends StatelessWidget {
  const _ContactRow({
    required this.icon,
    required this.label,
    required this.value,
    this.url,
  });

  final IconData icon;
  final String label;
  final String value;
  final String? url;

  @override
  Widget build(BuildContext context) {
    final content = Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Palette.onNightLine)),
      ),
      child: Row(
        children: [
          Icon(icon, color: Palette.marigold, size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label,
                    style: AppText.ui(13,
                        color: Palette.onNightSoft, w: FontWeight.w500)),
                const SizedBox(height: 2),
                Text(value,
                    style: AppText.ui(18,
                        color: Colors.white, w: FontWeight.w500)),
              ],
            ),
          ),
        ],
      ),
    );

    if (url == null) return content;
    return InkWell(onTap: () => openLink(url!), child: content);
  }
}
