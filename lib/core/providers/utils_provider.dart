import 'package:busha_assessment/core/utils/exports.dart';

/// Provider for the UrlService
final StateProvider<UrlService> urlServiceProvider = StateProvider((ref) => UrlService());

/// Provider for the UrlService
final StateProvider<UrlLaunchService> urlLaunchService = StateProvider((ref) => UrlLaunchService());

/// Provider for the NetworkService
final StateProvider<NetworkService> networkServiceProvider = StateProvider((ref) => NetworkService());

/// Provider for the NavigationService
final StateProvider<NavigationService> navigationServiceProvider = StateProvider((ref) => NavigationService());
