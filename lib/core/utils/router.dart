import 'exports.dart';

// Routes class to store route names
abstract class Routes {
  static const welcomeView = '/welcomeView';
}

class Routers {
  // This method is called when a route is requested
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // WelcomeView
      case Routes.welcomeView:
        return pageRoute(
          const SizedBox(),
        );

      default:
        // If the requested route is not found, show an unknown route page
        return unknownRoutePage(settings.name!);
    }
  }
}

// Create a page route with a given widget
PageRoute pageRoute(Widget widget) {
  return CupertinoPageRoute<dynamic>(
    builder: (context) => widget,
  );
}

// Create a page for unknown routes
PageRoute unknownRoutePage(String routeName) => MaterialPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: const Color(0xffffffff),
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
                  style: TextStyle(fontSize: 16.sp),
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
