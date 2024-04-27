import 'package:busha_assessment/views/transaction_details.dart';
import 'package:busha_assessment/views/transactions_view.dart';

import 'exports.dart';

/// Routes class to store route names
abstract class Routes {
  static const splashView = '/splashView';
  static const loginView = '/loginView';
  static const signupView = '/signupView';
  static const dashboardView = '/dashboardView';
  static const allAssetsView = '/allAssetsView';
  static const allTodaysTopMoversView = '/allTodaysTopMoversView';
  static const allTrendingNewsView = '/allTrendingNewsView';
  static const transactionsView = '/transactionsView';
  static const transactionDetailsView = '/transactionDetailsView';
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

      // DashboardView
      case Routes.dashboardView:
        return _pageRoute(
          const DashboardView(),
        );

      // AllAssetsView
      case Routes.allAssetsView:
        return _pageRoute(
          const AllMyAssetsView(),
        );

      // AllTodaysTopMoversView
      case Routes.allTodaysTopMoversView:
        return _pageRoute(
          const AllTodaysTopMoversView(),
        );

      // AllTrendingNewsView
      case Routes.allTrendingNewsView:
        return _pageRoute(
          const AllTrendingNewsView(),
        );

      // TransactionsView
      case Routes.transactionsView:
        return _pageRoute(
          const TransactionsView(),
        );

      // TransactionDetailsView
      case Routes.transactionDetailsView:
        return _pageRoute(
          const TransactionDetailsView(),
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
          color: CustomColors.white,
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
