import 'package:flutter/material.dart';

import 'theme.dart';

enum SectionId { about, experience, projects, skills, education, contact }

extension SectionLabel on SectionId {
  String get label => switch (this) {
        SectionId.about => 'About',
        SectionId.experience => 'Experience',
        SectionId.projects => 'Projects',
        SectionId.skills => 'Skills',
        SectionId.education => 'Education',
        SectionId.contact => 'Contact',
      };
}

const double maxPageWidth = 1200;

double pagePadding(double width) =>
    width < 720 ? 20 : (width < 1100 ? 40 : 64);

/// Width available to content inside [Constrained].
double contentWidth(BuildContext context) {
  final w = MediaQuery.sizeOf(context).width;
  final capped = w < maxPageWidth ? w : maxPageWidth;
  return capped - 2 * pagePadding(w);
}

/// Centres content, caps its width and applies responsive side padding.
class Constrained extends StatelessWidget {
  const Constrained({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.sizeOf(context).width;
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: maxPageWidth),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: pagePadding(w)),
          child: child,
        ),
      ),
    );
  }
}

/// Title + optional intro + content, with consistent vertical rhythm.
class SectionShell extends StatelessWidget {
  const SectionShell({
    super.key,
    required this.title,
    required this.child,
    this.intro,
    this.background,
    this.titleColor = Palette.ink,
    this.introColor = Palette.inkSoft,
  });

  final String title;
  final String? intro;
  final Widget child;
  final Color? background;
  final Color titleColor;
  final Color introColor;

  @override
  Widget build(BuildContext context) {
    final wide = MediaQuery.sizeOf(context).width >= 720;
    return Container(
      width: double.infinity,
      color: background,
      padding: EdgeInsets.symmetric(vertical: wide ? 96 : 64),
      child: Constrained(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Semantics(
              header: true,
              child: Text(
                title,
                style: AppText.display(wide ? 48 : 36,
                    color: titleColor, ls: -1.2, h: 1.05),
              ),
            ),
            if (intro != null) ...[
              const SizedBox(height: 16),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 620),
                child: Text(intro!, style: AppText.body(18, color: introColor)),
              ),
            ],
            SizedBox(height: wide ? 48 : 32),
            child,
          ],
        ),
      ),
    );
  }
}

/// Small bordered label used for skills and project tags.
class TagChip extends StatelessWidget {
  const TagChip(this.label, {super.key});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Palette.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Palette.line),
      ),
      child: Text(label, style: AppText.ui(14.5, w: FontWeight.w500)),
    );
  }
}
