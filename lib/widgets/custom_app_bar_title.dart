import 'package:busha_assessment/core/utils/exports.dart';

/// A custom app bar title widget.
class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.inter(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: CustomColors.black.withOpacity(0.95),
      ),
    );
  }
}
