import 'package:busha_assessment/core/providers/dashboard_providers.dart';
import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<bool> _showSignUpPassword = StateProvider<bool>((ref) => false);
StateProvider<bool> _showLoginPassword = StateProvider<bool>((ref) => false);

/// Controller for the authentication flow.
class AuthController extends ContraController {
  AuthController() : super();

  bool get isSignUpPasswordShown => ref.watch(_showSignUpPassword);
  bool get isLoginPasswordShown => ref.watch(_showLoginPassword);

  /// This method is to toggle password visibility in the sign up view
  void toggleShowSignUpPassword() => ref.read(_showSignUpPassword.notifier).state = !isSignUpPasswordShown;

  /// This method is to toggle password visibility in the login view
  void toggleShowLoginPassword() => ref.read(_showLoginPassword.notifier).state = !isLoginPasswordShown;

  /// This method is to delay for three seconds
  Future<void> delayForThreeSeconds() async {
    await runBusyFuture(
      Future.delayed(
        const Duration(seconds: 3),
      ),
    );
  }

  String? Function(String?)? validatePassword() => (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      };

  /// This method is to validate email address
  String? Function(String?)? validateEmail() => (value) {
        bool isEmailValid(String email) {
          final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
          return emailRegex.hasMatch(email);
        }

        if (value == null || value.isEmpty) {
          return 'Email address is required';
        } else if (isEmailValid(value.trim()) == false) {
          return 'Please input a valid email';
        }
        return null;
      };

  /// This method is to set the selected bottom tab index
  void setSelectedBottomTabIndex(int index) => ref.read(selectedBottomTabIndex.notifier).state = index;

  /// Sign up function
  Future signOut() {
    setSelectedBottomTabIndex(0);
    return ref.read(navigationServiceProvider).clearStackAndNavigateTo(Routes.loginView);
  }

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
}
