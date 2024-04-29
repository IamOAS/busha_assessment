import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the splash screen.
class SplashController extends ContraController {
  SplashController() : super();

  Future clearStackAndNavigateTo(String routeName) => ref.read(navigationServiceProvider).clearStackAndNavigateTo(routeName);
}
