import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<bool> _isBalanceShown = StateProvider<bool>((ref) => true);

/// Controller for the explore view.
class ExploreController extends ContraController {
  ExploreController() : super();

  String? get selectedTransaction => ref.watch(selectedTransactionProvider);

  // This method is to set the selected transaction
  void setSelectedTransaction(String? transaction) => ref.read(selectedTransactionProvider.notifier).state = transaction;

  bool get isBalanceShown => ref.watch(_isBalanceShown);

  /// This method is to toggle the visibility of the user's balance
  void toggleShowBalance() => ref.read(_isBalanceShown.notifier).state = !isBalanceShown;

  /// This method resets the Tezos blocks fetching data.
  void resetTezosBlocksFetchingData() {
    ref.read(tezosBlocksFetchedProvider.notifier).state.clear();
    ref.read(tezosBlocksCountProvider.notifier).state = 10;
  }

  List<Asset> get myAssets => ref.watch(assetsProvider);
  List<Asset> get todaysTopMovers => ref.watch(todayTopMoversProvider);

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
}
