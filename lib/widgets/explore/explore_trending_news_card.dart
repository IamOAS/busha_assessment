import 'package:busha_assessment/core/utils/exports.dart';

class ExploreTrendingNewsCard extends ContraWidget<ExploreController> {
  const ExploreTrendingNewsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ExploreController controller) {
    return Padding(
      padding: 16.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Trending news title
          ExploreTitle(
            title: 'Trending news',
            onTapSeeAll: () {
              controller.navigateTo(Routes.allTrendingNewsView);
            },
          ),
          16.szbh,
          // Trending news
          ListView.separated(
            shrinkWrap: true,
            itemCount: 3,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => index == 0
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6.r),
                        child: Image.asset(
                          'news-image'.png,
                          height: 166.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      16.szbh,
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
                  )
                : const TrendingNewsContainer(),
            separatorBuilder: (context, index) => Column(
              children: [
                16.szbh,
                // Divider
                Divider(
                  thickness: 1.w,
                  color: const Color(0xffe3e5e6),
                ),
                16.szbh,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
