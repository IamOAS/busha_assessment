import 'package:busha_assessment/controllers/auth_controller.dart';
import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays the sign up screen.
class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
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
                            // Sign up for an account
                            Text(
                              'Sign up for an account',
                              style: GoogleFonts.inter(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                                color: CustomColors.black.withOpacity(0.95),
                              ),
                            ),
                            8.szbh,
                            // Create an account to get started
                            Text(
                              'Create an account to get started',
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
                                  message: !controller.isSignUpPasswordShown ? 'Show password' : 'Hide password',
                                  child: TextButton(
                                    onPressed: () => controller.toggleShowSignUpPassword(),
                                    child: Text(
                                      !controller.isSignUpPasswordShown ? 'SHOW' : 'HIDE',
                                      style: GoogleFonts.inter(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xff5a5a5a),
                                      ),
                                    ),
                                  ),
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: !controller.isSignUpPasswordShown,
                                enabled: !controller.isBusy,
                                onChanged: (value) {
                                  setState(() {
                                    _formKey.currentState!.validate();
                                  });
                                },
                                validator: controller.validatePassword(),
                              ),
                            ),
                            16.szbh,
                            // Already have an account? Sign in
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Already have an account? ',
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.black.withOpacity(0.60),
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Sign in',
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.primary70,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        controller.replaceWith(Routes.loginView);
                                      },
                                  ),
                                ],
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
