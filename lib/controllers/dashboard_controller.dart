import 'package:busha_assessment/core/providers/dashboard_providers.dart';
import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the dashboard.
class DashboardController extends ContraController {
  DashboardController() : super();

  List<String> get labels_ => ref.watch(labels);
  int get selectedIndex => ref.watch(selectedBottomTabIndex);
  GlobalKey<State<StatefulWidget>> get bottomNavBarKey_ => ref.watch(bottomNavBarKey);

  /// This method is to set the selected bottom tab index
  void onItemTapped(int index) => ref.read(selectedBottomTabIndex.notifier).state = index;

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
}
