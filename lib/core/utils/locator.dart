import 'package:busha_assessment/core/utils/exports.dart';

// Create an instance of GetIt, a service locator
GetIt locator = GetIt.instance;

// Function to setup the locator
Future<void> setupLocator() async {
  // Register NavigationService as a lazy singleton
  locator.registerLazySingleton<NavigationService>(
    () => NavigationService(),
  );

  // Register NetworkService as a lazy singleton
  locator.registerLazySingleton<NetworkService>(
    () => NetworkService(),
  );

  // Register ErrorService as a lazy singleton
  locator.registerLazySingleton<ErrorService>(
    () => ErrorService(),
  );
}

// Get an instance of NavigationService from the locator
final NavigationService navigationService = locator<NavigationService>();
// Get an instance of NetworkService from the locator
final NetworkService networkService = locator<NetworkService>();
// Get an instance of ErrorService from the locator
final ErrorService errorService = locator<ErrorService>();
