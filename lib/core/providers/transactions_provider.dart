import 'package:busha_assessment/core/services/transactions_service.dart';
import 'package:busha_assessment/core/utils/exports.dart';

/// Provider for the TransactionsService
final StateProvider<TransactionsService> transactionsService = StateProvider((ref) => TransactionsService(ref));

/// Provider for selected transaction.
StateProvider<String?> selectedTransactionProvider = StateProvider((ref) => null);

/// Provider for the latest block hash.
StateProvider<String?> latestBlockHashProvider = StateProvider((ref) => null);

/// Provider for the transaction details.
StateProvider<List<TransactionDetailTile>> btcTransactionDetailsProvider = StateProvider(
  (ref) => [],
);
