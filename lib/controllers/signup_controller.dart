import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<bool> _showPassword = StateProvider<bool>((ref) => false);

class SignUpController extends ContraController {
  SignUpController() : super();

  bool get isPasswordShown => ref.watch(_showPassword);

  // Function to toggle password visibility
  void toggleShowPassword() => ref.read(_showPassword.notifier).state = !isPasswordShown;

  /// Function to validate password
  String? Function(String?)? validatePassword() => (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        if (value.length < 6) {
          return 'Password must be at least 6 characters';
        }
        return null;
      };

  /// Function to validate email address
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

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
}
