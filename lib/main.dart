import 'core/utils/exports.dart';

void main() async {
  // Ensuring that the Flutter bindings are initialized
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: BushaAssessmentApp(),
    ),
  );
}

class BushaAssessmentApp extends StatelessWidget {
  const BushaAssessmentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812), // Set the design size for screen adaptation
      fontSizeResolver: FontSizeResolvers.height, // Use height-based font size resolver
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        initialRoute: Routes.splashView,
        onGenerateRoute: Routers.onGenerateRoute,
        theme: appThemeData,
        title: 'Busha Assessment',
      ),
    );
  }
}
