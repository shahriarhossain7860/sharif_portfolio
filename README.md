# Sharif Shahriar Hossain - Flutter Web Portfolio

## Run it

```bash
# 1. Generate the web scaffolding (index.html, icons, manifest). Your lib/, assets/ and pubspec.yaml stay as they are.
flutter create . --platforms=web --project-name sharif_portfolio

# 2. Install packages
flutter pub get

# 3. Run in Chrome
flutter run -d chrome

# 4. Build for hosting (Firebase Hosting, GitHub Pages, Netlify, Vercel ...)
flutter build web --release
```

Output goes to `build/web`.

## Where to edit things

| What | File |
|------|------|
| Text, projects, skills, links | `lib/data.dart` |
| Colours and fonts | `lib/theme.dart` |
| Page sections | `lib/sections.dart` |
| Photos | `assets/images/` (`sharif_blazer.jpg` in the hero, `sharif_formal.jpg` in About) |
| CV PDF (Download CV button) | `assets/cv/Sharif_Shahriar_Hossain_CV.pdf` |

Fonts (Bricolage Grotesque, Source Serif 4) load from Google Fonts at runtime through the `google_fonts` package.

After `flutter create`, you can also edit `web/index.html` to add a meta description and favicon.
