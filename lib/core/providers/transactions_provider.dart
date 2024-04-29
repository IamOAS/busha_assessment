import 'package:busha_assessment/core/services/transactions_service.dart';
import 'package:busha_assessment/core/utils/exports.dart';

/// Provider for the TransactionsService
final StateProvider<TransactionsService> transactionsService = StateProvider((ref) => TransactionsService(ref));

/// Provider for selected transaction.
StateProvider<String?> selectedTransactionProvider = StateProvider((ref) => null);

/// Provider for the transaction details.
StateProvider<List<TransactionDetailTile>> btcTransactionDetailsProvider = StateProvider(
  (ref) => [],
);

/// Provider for the number of Tezos blocks to fetch.
StateProvider<int> tezosBlocksCountProvider = StateProvider((ref) => 10);

StateProvider<List<Block>> tezosBlocksFetchedProvider = StateProvider((ref) => []);
