import 'package:busha_assessment/core/utils/exports.dart';

/// This is the key that will be used to access the navigator.
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

/// This class is responsible for handling navigation in the app.
class NavigationService {
  /// This method is used to navigate to a new screen.
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  /// This method is used to replace the current screen with a new screen.
  Future<dynamic> replaceWith(String routeName) {
    return navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  /// This method is used to clear the current stack and navigate to a new screen.
  Future<dynamic> clearStackAndNavigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
    );
  }

  /// This method is used to navigate back to the previous screen.
  void navigateBack() {
    return navigatorKey.currentState!.pop();
  }
}
