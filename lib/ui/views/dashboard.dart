import 'package:busha_assessment/core/utils/exports.dart';
import 'package:busha_assessment/ui/views/empty_page.dart';
import 'package:busha_assessment/ui/views/explore_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  final List<Widget> widgetOptions = [
    const ExploreView(),
    const EmptyPageView(),
    const EmptyPageView(),
    const EmptyPageView(),
    const EmptyPageView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContraViewBuilder(
        builder: (BuildContext context, DashboardController controller) {
          return IndexedStack(
            index: controller.selectedIndex,
            children: widgetOptions,
          );
        },
        controllerBuilder: () => DashboardController(),
      ),
      bottomNavigationBar: ContraViewBuilder(
        builder: (BuildContext context, DashboardController controller) {
          return BottomNavigationBar(
            key: controller.bottomNavBarKey,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: controller.labels
                .map(
                  (e) => BottomNavigationBarItem(
                    icon: controller.selectedIndex == controller.labels.indexOf(e)
                        ? SizeXSVG(
                            icon: e.toLowerCase(),
                            size: 24,
                            color: CustomColors.black.withOpacity(0.95),
                          )
                        : SizeXSVG(
                            icon: e.toLowerCase(),
                            size: 24,
                            color: CustomColors.black.withOpacity(0.32),
                          ),
                    label: e,
                  ),
                )
                .toList(),
            currentIndex: controller.selectedIndex,
            elevation: 1.0,
            backgroundColor: CustomColors.backgroundOnLight,
            selectedItemColor: CustomColors.black.withOpacity(0.95),
            unselectedItemColor: CustomColors.black.withOpacity(0.32),
            onTap: controller.onItemTapped,
          );
        },
        controllerBuilder: () => DashboardController(),
      ),
    );
  }
}
