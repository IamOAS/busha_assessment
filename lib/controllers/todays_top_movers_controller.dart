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

  /// This method is to set the selected transaction
  void setSelectedTransaction(String? transaction) => ref.read(selectedTransactionProvider.notifier).state = transaction;

  /// This method resets the Tezos blocks fetching data.
  void resetTezosBlocksFetchingData() {
    ref.read(tezosBlocksFetchedProvider.notifier).state.clear();
    ref.read(tezosBlocksCountProvider.notifier).state = 10;
  }

  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
}
