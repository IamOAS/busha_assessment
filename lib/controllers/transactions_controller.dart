import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for transactions.
class TransactionsController extends ContraController {
  TransactionsController() : super();

  List<Tx>? btcTransactionsList = [];
  List<Block>? tezosBlocksList = [];

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  Future replaceWith(String routeName) => ref.read(navigationServiceProvider).replaceWith(routeName);
  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();

  String? get selectedTransaction => ref.watch(selectedTransactionProvider);
  List<TransactionDetailTile> get transactionDetailsTiles => ref.watch(btcTransactionDetailsProvider);
  List<Block> get tezosBlocks => ref.watch(tezosBlocksFetchedProvider);
  int get tezosBlocksCount => ref.watch(tezosBlocksCountProvider);

  /// This method sets the selected transaction's details.
  void setTransactionDetailsTiles(List<TransactionDetailTile> tiles) {
    ref.read(btcTransactionDetailsProvider.notifier).state.clear();
    ref.read(btcTransactionDetailsProvider.notifier).state.addAll(tiles);
  }

  /// This method sets the Tezos blocks count.
  void setTezosBlocksCount(bool add) {
    if (!add) {
      ref.read(tezosBlocksCountProvider.notifier).state -= 10;
      return;
    }
    ref.read(tezosBlocksCountProvider.notifier).state += 10;
  }

  /// This method launches a URL.
  void launchURL({required String url, required BuildContext context}) async {
    try {
      await ref.read(urlLaunchService).launchURL(url: url);
    } catch (e) {
      void showAlertDialog() async {
        await customAlertDialog(
          context: context,
          title: 'Error',
          message: 'An error occurred while trying to open the link.',
        );
      }

      showAlertDialog();
    }
  }

  final Set<String> _addedTezosBlocks = {};

  /// This method fetches the latest Tezos blocks.
  Future<List<Block>?> getTezosBlocks() async {
    if (ref.read(tezosBlocksFetchedProvider.notifier).state.isNotEmpty) {
      await Future.delayed(
        const Duration(seconds: 3),
        () {},
      );
    }

    ResponseModel<TezosBlocksResponseModel> response =
        await ref.read(transactionsService).getTezosBlocks(ref.read(tezosBlocksCountProvider.notifier).state);

    if (response.valid == true) {
      if (response.data!.blocks != null) {
        if (ref.read(tezosBlocksFetchedProvider.notifier).state.isEmpty) {
          ref.read(tezosBlocksFetchedProvider.notifier).state.addAll(response.data!.blocks!);
        } else {
          List<Block>? newTezosBlocks = response.data!.blocks!.where((tezosBlock) => !_addedTezosBlocks.contains(tezosBlock.hash)).toList();
          ref.read(tezosBlocksFetchedProvider.notifier).state.addAll(newTezosBlocks);
          _addedTezosBlocks.addAll(
            newTezosBlocks.map((tezosBlock) => tezosBlock.hash!),
          );
        }

        return response.data!.blocks;
      }
    } else {
      setTezosBlocksCount(false);
    }

    return null;
  }

  /// This method fetches the latest block transactions for Bitcoin.
  Future<List<Tx>?> getBtcLatestBlockTransactions() async {
    String? latestBlockHash = await getBtcLatestBlock();

    if (latestBlockHash == null) {
      return null;
    }

    ResponseModel<BitcoinLatestBlockTransactionsResponseModel> response =
        await ref.read(transactionsService).getBtcLatestBlockTransactions(hash: latestBlockHash);
    if (response.valid == true) {
      btcTransactionsList?.clear();
      btcTransactionsList?.addAll(response.data?.tx ?? []);
      return response.data?.tx;
    }

    return null;
  }

  /// This method fetches the latest block hash for Bitcoin.
  Future<String?> getBtcLatestBlock() async {
    ResponseModel<BitcoinLatestBlockResponseModel> response = await ref.read(transactionsService).getBtcLatestBlock();
    if (response.valid == true) {
      return response.data?.hash;
    }
    return null;
  }
}
