import 'package:busha_assessment/core/utils/exports.dart';

class TodaysTopMoversCardList extends ContraWidget<ExploreController> {
  const TodaysTopMoversCardList({
    super.key,
    required this.todaysTopMovers,
  });

  final List<Asset> todaysTopMovers;

  @override
  Widget build(BuildContext context, ExploreController controller) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: todaysTopMovers.length,
      separatorBuilder: (BuildContext context, int index) => 8.szbw,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            controller.setSelectedTransaction(todaysTopMovers[index].symbol);
            controller.navigateTo(Routes.transactionsView);
          },
          child: TodaysTopMoversContainer(
            todaysTopMover: todaysTopMovers[index],
          ),
        );
      },
    );
  }
}
