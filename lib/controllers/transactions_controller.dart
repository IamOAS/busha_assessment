import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for transactions.
class TransactionsController extends ContraController {
  TransactionsController() : super();

  String? get selectedTransaction => ref.watch(selectedTransactionProvider);

  List<TransactionDetailTile> get transactionDetailsTiles => ref.watch(transactionDetailsProvider);

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
}
