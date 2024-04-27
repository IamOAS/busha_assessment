import 'package:busha_assessment/core/utils/exports.dart';

class FutureErrorWidget extends StatelessWidget {
  final VoidCallback reloadPage;
  final String? message;

  const FutureErrorWidget({
    super.key,
    required this.reloadPage,
    this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message ?? 'Something went wrong. Please try again.',
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: CustomColors.black.withOpacity(0.95),
            ),
          ),
        ),
        10.szbh,
        InkWell(
          onTap: reloadPage,
          child: Icon(
            Icons.refresh_rounded,
            size: 40,
            color: CustomColors.primary70,
          ),
        ),
      ],
    );
  }
}
