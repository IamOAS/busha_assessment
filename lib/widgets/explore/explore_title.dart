import 'package:busha_assessment/core/utils/exports.dart';

class ExploreTitle extends StatelessWidget {
  const ExploreTitle({
    super.key,
    required this.title,
    required this.onTapSeeAll,
  });

  final String title;
  final VoidCallback onTapSeeAll;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Title
        Flexible(
          child: Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: CustomColors.black.withOpacity(0.95),
            ),
          ),
        ),
        16.szbw,
        // See all
        Flexible(
          child: InkWell(
            onTap: onTapSeeAll,
            child: Text(
              'See all',
              style: GoogleFonts.inter(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: CustomColors.primary70,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
