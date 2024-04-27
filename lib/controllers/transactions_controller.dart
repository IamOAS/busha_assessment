import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for transactions.
class TransactionsController extends ContraController {
  TransactionsController() : super();

  String? get selectedTransaction => ref.watch(selectedTransactionProvider);
  List<TransactionDetailTile> get transactionDetailsTiles => ref.watch(btcTransactionDetailsProvider);

  void setTransactionDetailsTiles(List<TransactionDetailTile> tiles) {
    ref.read(btcTransactionDetailsProvider.notifier).state.clear();
    ref.read(btcTransactionDetailsProvider.notifier).state.addAll(tiles);
  }

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();

  void launchURL({required String url, required BuildContext context}) async {
    try {
      await ref.read(urlLaunchService).launchURL(url: url);
    } catch (e) {
      void showAlertDialog() async {
        await customAlertDialog(
          context: context,
          title: 'Error',
          message: e.toString(),
        );
      }

      showAlertDialog();
    }
  }

  // This method fetches the latest block transactions for Bitcoin.
  Future<List<Tx>?> getBtcLatestBlockTransactions() async {
    bool? latestBlock = await getBtcLatestBlock();

    if (latestBlock == null) {
      return null;
    }

    ResponseModel<BitcoinLatestBlockTransactionsResponseModel> response =
        await ref.read(transactionsService).getBtcLatestBlockTransactions(hash: ref.read(latestBlockHashProvider.notifier).state!);
    if (response.valid == true) {
      return response.data?.tx;
    }

    return null;
  }

  // This method fetches the latest block hash for Bitcoin.
  Future<bool?> getBtcLatestBlock() async {
    ResponseModel<BitcoinLatestBlockResponseModel> response = await ref.read(transactionsService).getBtcLatestBlock();
    if (response.valid == true) {
      ref.read(latestBlockHashProvider.notifier).state = response.data?.hash;
      return true;
    }
    return null;
  }
}
