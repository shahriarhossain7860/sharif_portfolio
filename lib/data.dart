import 'package:flutter/material.dart';

import 'theme.dart';

// ---------------------------------------------------------------------------
// Contact details (from the CV)
// ---------------------------------------------------------------------------
const siteName = 'Sharif Shahriar Hossain';
const email = 'shahriarhossain7860@gmail.com';
const phoneDisplay = '01689-937331';
const phoneLink = 'tel:+8801689937331';
const linkedinDisplay = 'linkedin.com/in/sharif-shahriar-hossain';
const linkedinUrl = 'https://linkedin.com/in/sharif-shahriar-hossain';
const githubDisplay = 'github.com/shahriarhossain7860';
const githubUrl = 'https://github.com/shahriarhossain7860';
const addressDisplay = 'Merul Badda, Dhaka, Bangladesh';

const heroIntro =
    'I build clean, responsive Flutter apps and connect them to REST APIs. '
    'Four of my apps have public store pages on Google Play and the App Store.';

const aboutParagraphs = <String>[
  'I\'m a Flutter-focused mobile app developer based in Dhaka, Bangladesh. '
      'I build clean, responsive interfaces, integrate REST APIs, and handle '
      'state management, authentication and basic payment integration.',
  'I\'ve taken apps from the first screen to the store, including build '
      'preparation, store configuration, testing and release deployment. '
      'I\'m comfortable working on my own or in a team, and I care about '
      'meeting deadlines and delivering reliable, user-friendly apps.',
];

const aboutFacts = <(String, String)>[
  ('Based in', 'Merul Badda, Dhaka, Bangladesh'),
  ('Works with', 'Remote teams, including Anirix Studio in South Korea'),
  ('Focus', 'Flutter, Riverpod, REST APIs and store releases'),
  ('Studied', 'BSc in Computer Science & Engineering, East West University'),
];

// ---------------------------------------------------------------------------
// Experience
// ---------------------------------------------------------------------------
class Job {
  const Job({
    required this.role,
    required this.company,
    required this.place,
    required this.period,
    required this.points,
  });

  final String role;
  final String company;
  final String place;
  final String period;
  final List<String> points;
}

const jobs = <Job>[
  Job(
    role: 'Software Engineer',
    company: 'Anirix Studio',
    place: 'South Korea, remote',
    period: 'May 2026 – September 2026',
    points: [
      'Developed and published YL Seoul, a production-ready app for Android and iOS.',
      'Designed and built responsive, user-friendly interfaces with clean and consistent UI/UX.',
      'Integrated REST APIs, handling data fetching, API responses, authentication and application-level data flow.',
      'Implemented scalable state management with Riverpod for application state and asynchronous data.',
      'Worked with the team to build features, resolve bugs and improve overall app stability.',
      'Contributed to the full publishing process: build preparation, store configuration, testing and release deployment.',
      'Worked closely with backend and API requirements so the app and server-side services fit together smoothly.',
    ],
  ),
  Job(
    role: 'Junior Software Engineer',
    company: 'Softvence Agency',
    place: 'Dhaka, Bangladesh',
    period: 'January 2025 – March 2026',
    points: [
      'Designed and developed responsive Flutter UI components for multiple screen sizes.',
      'Improved app performance by optimizing widgets and refactoring existing code.',
      'Integrated multiple RESTful APIs to handle dynamic data.',
      'Implemented social login and helped with payment gateway integration.',
      'Worked closely with designers and backend developers to improve the user experience.',
    ],
  ),
];

// ---------------------------------------------------------------------------
// Projects
// ---------------------------------------------------------------------------
class StoreLink {
  const StoreLink(this.label, this.url);
  final String label;
  final String url;
}

class Project {
  const Project({
    required this.name,
    required this.tagline,
    required this.description,
    required this.tags,
    required this.links,
    required this.cover,
    required this.onCover,
  });

  final String name;
  final String tagline;
  final String description;
  final List<String> tags;
  final List<StoreLink> links;
  final Color cover;
  final Color onCover;
}

const projects = <Project>[
  Project(
    name: 'YL Seoul',
    tagline: 'K-pop events, ticketing, travel and lifestyle',
    description:
        'A global lifestyle and entertainment app. I designed the screens for '
        'event discovery, booking and service management, used Riverpod for '
        'state management and dynamic data, and helped take the app through '
        'testing, production builds and publishing.',
    tags: ['Flutter', 'Riverpod', 'REST APIs'],
    links: [
      StoreLink('View on Google Play',
          'https://play.google.com/store/apps/details?id=com.ylseoul.app'),
    ],
    cover: Palette.teal,
    onCover: Colors.white,
  ),
  Project(
    name: 'The Focus Club',
    tagline: 'Routines, focus and consistency',
    description:
        'A calm, supportive productivity app. It has task breakdown, habit '
        'tracking, journaling and progress monitoring, plus features for '
        'community interaction and shared experiences.',
    tags: ['Flutter', 'Habit tracking', 'Journaling'],
    links: [
      StoreLink('View on the App Store',
          'https://apps.apple.com/us/app/focus-club/id6754791692'),
    ],
    cover: Palette.tealSoft,
    onCover: Palette.ink,
  ),
  Project(
    name: 'Prevailing Wage Timekeeper',
    tagline: 'Work-hour tracking and compliance',
    description:
        'I designed and built the complete interface, then connected backend '
        'APIs for time tracking, job and location management, expense '
        'logging and reporting, keeping data flow and UI consistent across '
        'the app.',
    tags: ['Flutter', 'REST APIs', 'Reporting'],
    links: [
      StoreLink('View on the App Store',
          'https://apps.apple.com/us/app/prevailing-wage-timekeeper/id6748244266'),
    ],
    cover: Palette.night,
    onCover: Colors.white,
  ),
  Project(
    name: 'HRlynx',
    tagline: 'An AI-powered HR companion',
    description:
        'An app that gives HR professionals and businesses real-time HR news, '
        'expert insights and practical guidance. I built AI-powered HR '
        'personas, HR specialty insights, compliance updates and chat-based '
        'experiences.',
    tags: ['Flutter', 'AI chat', 'REST APIs'],
    links: [
      StoreLink('View on the App Store',
          'https://apps.apple.com/us/app/hrlynx/id6752120098'),
    ],
    cover: Palette.marigold,
    onCover: Palette.ink,
  ),
];

// ---------------------------------------------------------------------------
// Skills
// ---------------------------------------------------------------------------
class SkillGroup {
  const SkillGroup(this.title, this.items);
  final String title;
  final List<String> items;
}

const skillGroups = <SkillGroup>[
  SkillGroup('Languages', ['Dart', 'C++', 'JavaScript', 'Python']),
  SkillGroup('Frameworks and technologies',
      ['Flutter', 'Riverpod', 'Firebase', 'RESTful APIs']),
  SkillGroup('Tools and practices',
      ['Git', 'Postman', 'SQL', 'Unit testing', 'OOP']),
  SkillGroup('Working style', [
    'Teamwork',
    'Analytical thinking',
    'Clear communication',
    'Time management',
  ]),
];

// ---------------------------------------------------------------------------
// Education
// ---------------------------------------------------------------------------
class EducationItem {
  const EducationItem({
    required this.title,
    required this.place,
    required this.period,
    this.linkLabel,
    this.linkUrl,
  });

  final String title;
  final String place;
  final String period;
  final String? linkLabel;
  final String? linkUrl;
}

const education = <EducationItem>[
  EducationItem(
    title: 'BSc in Computer Science & Engineering',
    place: 'East West University',
    period: 'May 2017 – December 2022',
  ),
  EducationItem(
    title: 'Higher Secondary Certificate (HSC), Science',
    place: 'Govt. B. L. College, Khulna',
    period: '2014 – 2015',
  ),
  EducationItem(
    title: 'App Development with Flutter (certification)',
    place: 'Ostad (ostad.app)',
    period: 'February 2025',
    linkLabel: 'View certificate',
    linkUrl: 'https://ostad.app/share/certificate/c24184-sharif-shahriar-hossain',
  ),
];
