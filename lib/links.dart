import 'package:url_launcher/url_launcher.dart';

/// Path of the CV inside the Flutter assets (see pubspec.yaml).
const cvAsset = 'assets/cv/Sharif_Shahriar_Hossain_CV.pdf';

/// Opens web links in a new tab, and mailto: / tel: links in the same tab.
Future<void> openLink(String url) async {
  final uri = Uri.parse(url);
  final isWeb = uri.scheme == 'http' || uri.scheme == 'https';
  await launchUrl(uri, webOnlyWindowName: isWeb ? '_blank' : '_self');
}

/// On Flutter web, assets are served under `assets/`, so the CV lives at
/// `assets/assets/cv/...` next to index.html.
Future<void> downloadCv() async {
  final uri = Uri.base.resolve('assets/$cvAsset');
  await launchUrl(uri, webOnlyWindowName: '_blank');
}
