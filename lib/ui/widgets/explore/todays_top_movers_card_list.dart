import 'package:busha_assessment/core/utils/exports.dart';

class TodaysTopMoversCardList extends StatelessWidget {
  const TodaysTopMoversCardList({
    super.key,
    required this.todaysTopMovers,
  });

  final List<Asset> todaysTopMovers;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      itemCount: todaysTopMovers.length,
      separatorBuilder: (BuildContext context, int index) {
        return 8.szbw;
      },
      itemBuilder: (BuildContext context, int index) {
        return TodaysTopMoversContainer(
          todaysTopMover: todaysTopMovers[index],
        );
      },
    );
  }
}
