import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays a list of today's top movers.
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
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () => controller.navigateBack(),
              child: const CustomBackButton(),
            ),
            title: const CustomAppBarTitle(text: 'Today\'s top movers'),
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
                          return InkWell(
                            onTap: () {
                              controller.setSelectedTransaction(controller.todaysTopMovers[index].symbol);

                              if (controller.todaysTopMovers[index].symbol == 'BTC') {
                                controller.navigateTo(Routes.btcTransactionsView);
                              } else if (controller.todaysTopMovers[index].symbol == 'XTZ') {
                                controller.resetTezosBlocksFetchingData();
                                controller.navigateTo(Routes.tezosBlocksView);
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Coming soon!',
                                  toastLength: Toast.LENGTH_LONG,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: CustomColors.primary70,
                                  textColor: CustomColors.white,
                                  fontSize: 16.sp,
                                );
                              }
                            },
                            child: TodaysTopMoversContainer(
                              todaysTopMover: controller.todaysTopMovers[index],
                            ),
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
