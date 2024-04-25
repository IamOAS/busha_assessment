import 'package:busha_assessment/controllers/todays_top_movers_controller.dart';
import 'package:busha_assessment/core/utils/exports.dart';

class AllTodaysTopMoversView extends StatefulWidget {
  const AllTodaysTopMoversView({super.key});

  @override
  State<AllTodaysTopMoversView> createState() => _AllTodaysTopMoversViewState();
}

class _AllTodaysTopMoversViewState extends State<AllTodaysTopMoversView> {
  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (BuildContext context, TodaysTopMoversController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Today\'s top movers',
              style: GoogleFonts.rubik(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: 16.hp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.szbh,
                  // Top movers
                  Expanded(
                    child: ResponsiveGridList(
                      horizontalGridSpacing: 8.w,
                      verticalGridSpacing: 16.h,
                      horizontalGridMargin: 0.0,
                      verticalGridMargin: 0.0,
                      minItemWidth: 150.w,
                      minItemsPerRow: 2,
                      maxItemsPerRow: 2,
                      listViewBuilderOptions: ListViewBuilderOptions(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                      ),
                      children: List<Widget>.generate(
                        controller.todaysTopMovers.length,
                        (index) {
                          return TodaysTopMoversContainer(
                            todaysTopMover: controller.todaysTopMovers[index],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => TodaysTopMoversController(),
    );
  }
}
