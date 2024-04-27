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

  void setSelectedTransaction(String? transaction) => ref.read(selectedTransactionProvider.notifier).state = transaction;

  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
}
