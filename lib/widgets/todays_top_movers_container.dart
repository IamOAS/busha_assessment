import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a container for today's top movers.
class TodaysTopMoversContainer extends StatelessWidget {
  const TodaysTopMoversContainer({
    super.key,
    required this.todaysTopMover,
  });

  final Asset todaysTopMover;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: CustomColors.white,
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(
          width: 1.h,
          color: CustomColors.black.withOpacity(0.12),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomColors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 16.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Asset logo
          SizeXSVG(
            icon: todaysTopMover.logo,
            size: 40,
          ),
          8.szbh,
          // Asset name
          Text(
            todaysTopMover.name,
            style: GoogleFonts.inter(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: CustomColors.black,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          8.szbh,
          // Asset increase/decrease
          Row(
            children: [
              SizeXSVG(
                icon: todaysTopMover.profit == true ? 'arrow-up-right' : 'arrow-down-right',
                size: 16,
              ),
              Flexible(
                child: Text(
                  '${todaysTopMover.percentage}%',
                  style: GoogleFonts.inter(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: todaysTopMover.profit == true ? CustomColors.primary70 : CustomColors.error70,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
