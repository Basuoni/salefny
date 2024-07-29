import 'package:url_launcher/url_launcher.dart';

Future<void> callLaunchUrl({required String url, LaunchMode? mode}) async {
  final Uri uri = Uri.parse(url);
  await launchUrl(uri, mode: mode ?? LaunchMode.externalApplication);
}
