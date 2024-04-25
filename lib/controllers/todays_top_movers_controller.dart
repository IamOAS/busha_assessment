import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the today's top movers view.
class TodaysTopMoversController extends ContraController {
  TodaysTopMoversController() : super();

  List<Asset> get todaysTopMovers => [
        ...ref.watch(todayTopMoversProvider),
        ...ref.watch(todayTopMoversProvider),
        ...ref.watch(todayTopMoversProvider),
        ...ref.watch(todayTopMoversProvider),
      ];

  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
}
