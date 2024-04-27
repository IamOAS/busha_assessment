import 'package:busha_assessment/controllers/auth_controller.dart';
import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays the login screen.
class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      onDispose: (controller) {
        _emailController.dispose();
        _passwordController.dispose();
        _emailFocusNode.dispose();
        _passwordFocusNode.dispose();
        controller.dispose();
      },
      builder: (BuildContext context, AuthController controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: 16.hp,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            60.szbh,
                            // Log in to your account
                            Text(
                              'Log in to your account',
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.black.withOpacity(0.95),
                              ),
                            ),
                            8.szbh,
                            // Welcome back! Please enter your registered email address to continue
                            Text(
                              'Welcome back! Please enter your registered email address to continue.',
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.black.withOpacity(0.60),
                              ),
                            ),
                            24.szbh,
                            // Email address
                            CustomTextFormField(
                              label: 'Email address',
                              textFormField: TextFormFieldWidget(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                nextFocusNode: _passwordFocusNode,
                                hintText: 'hello@busha.co',
                                keyboardType: TextInputType.emailAddress,
                                enabled: !controller.isBusy,
                                onChanged: (value) {
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                },
                                validator: controller.validateEmail(),
                              ),
                            ),
                            16.szbh,
                            // Password
                            CustomTextFormField(
                              label: 'Password',
                              textFormField: TextFormFieldWidget(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                hintText: 'Enter password',
                                suffixIcon: Tooltip(
                                  message: !controller.isLoginPasswordShown ? 'Show password' : 'Hide password',
                                  child: TextButton(
                                    onPressed: () => controller.toggleShowLoginPassword(),
                                    child: Text(
                                      !controller.isLoginPasswordShown ? 'SHOW' : 'HIDE',
                                      style: GoogleFonts.inter(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff5a5a5a),
                                      ),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !controller.isLoginPasswordShown,
                                enabled: !controller.isBusy,
                                onChanged: (value) {
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                },
                                validator: controller.validatePassword(),
                              ),
                            ),
                            8.szbh,
                            // Forgot password?
                            Align(
                              alignment: Alignment.centerRight,
                              child: Tooltip(
                                message: 'Forgot password?',
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot password?',
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.primary70,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    30.szbh,
                    // Continue button
                    Tooltip(
                      message: 'Continue',
                      child: CustomListenableButton(
                        textEditingControllers: [_emailController, _passwordController],
                        formKey: _formKey,
                        isLoading: controller.isBusy,
                        text: 'Continue',
                        onTap: () async {
                          await controller.delayForThreeSeconds();
                          controller.navigateTo(Routes.dashboardView);
                        },
                      ),
                    ),
                    16.szbh,
                    // Don't have an account? Sign up
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.black.withOpacity(0.60),
                            ),
                          ),
                          TextSpan(
                            text: 'Sign up',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.primary70,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                controller.replaceWith(Routes.signupView);
                              },
                          ),
                        ],
                      ),
                    ),
                    30.szbh,
                  ],
                ),
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => AuthController(),
    );
  }
}
