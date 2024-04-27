import 'package:busha_assessment/core/utils/exports.dart';

/// A custom progress indicator.
class CustomProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? iosIndicatorRadius;
  const CustomProgressIndicator({super.key, this.color, this.iosIndicatorRadius});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb || Platform.isAndroid) {
      return CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(CustomColors.primary70),
      );
    } else {
      return CupertinoActivityIndicator(
        color: CustomColors.primary70,
        radius: iosIndicatorRadius ?? 10.0,
      );
    }
  }
}
