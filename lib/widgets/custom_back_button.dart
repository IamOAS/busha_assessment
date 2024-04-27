import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a custom back button.
class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 16.h,
      width: 11.2.w,
      child: Center(
        child: SvgPicture.asset(
          'back'.svg,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
