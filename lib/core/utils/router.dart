import 'package:busha_assessment/ui/views/login_view.dart';
import 'package:busha_assessment/ui/views/signup_view.dart';
import 'package:busha_assessment/ui/views/splash_view.dart';
import 'exports.dart';

/// Routes class to store route names
abstract class Routes {
  static const splashView = '/splashView';
  static const loginView = '/loginView';
  static const signupView = '/signupView';
}

class Routers {
  /// This method is called when a route is requested
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // SplashView
      case Routes.splashView:
        return _pageRoute(
          const SplashView(),
        );

      // LoginView
      case Routes.loginView:
        return _pageRoute(
          const LoginView(),
        );

      // SignupView
      case Routes.signupView:
        return _pageRoute(
          const SignUpView(),
        );

      default:
        // If the requested route is not found, show an unknown route page
        return _unknownRoutePage(settings.name!);
    }
  }
}

// Create a page route with a given widget
PageRoute _pageRoute(Widget widget) {
  return CupertinoPageRoute<dynamic>(
    builder: (context) => widget,
  );
}

// Create a page for unknown routes
PageRoute _unknownRoutePage(String routeName) => MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: CustomColors.backgroundOnLight,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == "/"
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(fontSize: 16.sp),
                ),
              ),
              OutlinedButton.icon(
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
