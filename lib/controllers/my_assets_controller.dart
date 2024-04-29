import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the assets view.
class MyAssetsController extends ContraController {
  MyAssetsController() : super();

  List<Asset> get allMyAssets => [
        ...ref.watch(assetsProvider),
        ...ref.watch(assetsProvider),
        ...ref.watch(assetsProvider),
        ...ref.watch(assetsProvider),
      ];

  /// This method is to set the selected transaction
  void setSelectedTransaction(String? transaction) => ref.read(selectedTransactionProvider.notifier).state = transaction;

  /// This method resets the Tezos blocks fetching data.
  void resetTezosBlocksFetchingData() {
    ref.read(tezosBlocksFetchedProvider.notifier).state.clear();
    ref.read(tezosBlocksCountProvider.notifier).state = 10;
  }

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
}
