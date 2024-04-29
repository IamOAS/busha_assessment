import 'package:busha_assessment/controllers/auth_controller.dart';
import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays an empty page.
class EmptyPageView extends StatefulWidget {
  const EmptyPageView({super.key});

  @override
  State<EmptyPageView> createState() => _EmptyPageViewState();
}

class _EmptyPageViewState extends State<EmptyPageView> {
  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (BuildContext context, AuthController controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: 16.hp,
              child: Column(
                children: [
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Empty Page
                          Text(
                            'Empty Page',
                            style: GoogleFonts.inter(
                              fontSize: 24.sp,
                              fontWeight: FontWeight.w700,
                              color: CustomColors.primary70,
                            ),
                          ),
                          16.szbh,
                          // This page is empty for now. Please check back later.
                          Text(
                            'This page is empty for now. Please check back later.',
                            style: GoogleFonts.inter(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              color: CustomColors.black.withOpacity(0.95),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Sign out
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
                    child: CustomButton(
                      key: const Key('signOutButton'),
                      onTap: () => controller.signOut(),
                      text: 'Sign out',
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => AuthController(),
    );
  }
}
