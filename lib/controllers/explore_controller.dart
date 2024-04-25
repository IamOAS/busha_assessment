import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the explore view.
class ExploreController extends ContraController {
  ExploreController() : super();

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
}
