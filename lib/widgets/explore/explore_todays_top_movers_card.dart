import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a list of today's top movers in the explore view.
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
          // Today's top movers
          SizedBox(
            height: 140.h,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.todaysTopMovers.length,
              separatorBuilder: (BuildContext context, int index) => 8.szbw,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    controller.setSelectedTransaction(controller.todaysTopMovers[index].symbol);
                    controller.navigateTo(Routes.transactionsView);
                  },
                  child: TodaysTopMoversContainer(
                    todaysTopMover: controller.todaysTopMovers[index],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
