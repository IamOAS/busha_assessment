import 'package:busha_assessment/core/utils/exports.dart';

StateProvider<bool> _isBalanceShown = StateProvider<bool>((ref) => true);

/// Controller for the explore view.
class ExploreController extends ContraController {
  ExploreController() : super();

  String? get selectedTransaction => ref.watch(selectedTransactionProvider);
  
  // Function to set the selected transaction
  void setSelectedTransaction(String? transaction) => ref.read(selectedTransactionProvider.notifier).state = transaction;

  bool get isBalanceShown => ref.watch(_isBalanceShown);

  // Function to toggle the visibility of the user's balance
  void toggleShowBalance() => ref.read(_isBalanceShown.notifier).state = !isBalanceShown;

  List<Asset> get myAssets => ref.watch(assetsProvider);
  List<Asset> get todaysTopMovers => ref.watch(todayTopMoversProvider);

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
}
