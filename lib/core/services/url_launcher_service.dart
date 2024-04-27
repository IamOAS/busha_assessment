import 'package:busha_assessment/core/utils/exports.dart';

/// This class handles launching of URLs.
class UrlLaunchService {
  Future<void> launchURL({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(
        Uri.parse(url),
        mode: LaunchMode.externalApplication,
      );
    } else if (await canLaunchUrl(Uri.parse(url)) == false) {
      throw 'Could not launch $url';
    }
  }
}
