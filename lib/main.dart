import 'core/utils/exports.dart';

void main() async {
  // Ensuring that the Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Setup the service locator for dependency injection
  await setupLocator();

  runApp(
    const BushaAssessmentApp(),
  );
}

class BushaAssessmentApp extends StatelessWidget {
  const BushaAssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844), // Set the design size for screen adaptation
      fontSizeResolver: FontSizeResolvers.height, // Use height-based font size resolver
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: true,
        navigatorKey: StackedService.navigatorKey, // Setting the navigator key for Stacked services
        onGenerateRoute: Routers().onGenerateRoute, // Setting the route generator for the app
        theme: appThemeData, // Setting the app theme
        title: 'Taski Connect', // Setting the app title
        home: const SizedBox(), // Set the home widget
      ),
    );
  }
}
