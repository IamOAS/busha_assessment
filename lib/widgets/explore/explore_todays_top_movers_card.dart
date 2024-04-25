import 'package:busha_assessment/core/utils/exports.dart';

class ExploreTodaysTopMoversCard extends ContraWidget<ExploreController> {
  const ExploreTodaysTopMoversCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ExploreController controller) {
    return Padding(
      padding: 16.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Today's top movers title
          ExploreTitle(
            title: 'Today\'s Top Movers',
            onTapSeeAll: () {
              controller.navigateTo(Routes.allTodaysTopMoversView);
            },
          ),
          16.szbh,
          // Top movers
          SizedBox(
            height: 140.h,
            child: TodaysTopMoversCardList(
              todaysTopMovers: controller.todaysTopMovers,
            ),
          ),
        ],
      ),
    );
  }
}
