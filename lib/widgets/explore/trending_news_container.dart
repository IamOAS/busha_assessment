import 'package:busha_assessment/core/utils/exports.dart';

class TrendingNewsContainer extends StatelessWidget {
  const TrendingNewsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Image
        ClipRRect(
          borderRadius: BorderRadius.circular(6.r),
          child: Image.asset(
            'news-image'.png,
            height: 73.h,
            width: 55.w,
            fit: BoxFit.cover,
          ),
        ),
        16.szbw,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Headline
              Text(
                'Ethereum Co-founder opposes El-salvador Bitcoin Adoption policy',
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.black,
                ),
              ),
              8.szbh,
              // Source and time
              Text(
                'CoinDesk • 2h',
                style: GoogleFonts.inter(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xff9ba0a5),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
