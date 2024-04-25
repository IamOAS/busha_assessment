import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<int> _selectedIndex = StateProvider<int>((ref) => 0);
StateProvider<GlobalKey<State<StatefulWidget>>> _bottomNavBarKey = StateProvider<GlobalKey<State<StatefulWidget>>>((ref) => GlobalKey());
StateProvider<List<String>> _labels = StateProvider<List<String>>((ref) => ['Explore', 'Portfolio', 'Earn', 'Spend', 'Connect']);

/// Controller for the dashboard.
class DashboardController extends ContraController {
  DashboardController() : super();

  List<String> get labels => ref.watch(_labels);
  int get selectedIndex => ref.watch(_selectedIndex);
  GlobalKey<State<StatefulWidget>> get bottomNavBarKey => ref.watch(_bottomNavBarKey);

  void onItemTapped(int index) => ref.read(_selectedIndex.notifier).state = index;

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
}
