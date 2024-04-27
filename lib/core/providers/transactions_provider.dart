import 'package:busha_assessment/core/utils/exports.dart';

/// Provider for selected transaction.
StateProvider<String?> selectedTransactionProvider = StateProvider((ref) => null);

StateProvider<List<TransactionDetailTile>> transactionDetailsProvider = StateProvider(
  (ref) => [
    TransactionDetailTile(
      title: 'Hash',
      value: '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103',
    ),
    TransactionDetailTile(
      title: 'Time',
      value: '2019-08-24 • 15:43',
    ),
    TransactionDetailTile(
      title: 'Size',
      value: '9195',
    ),
    TransactionDetailTile(
      title: 'Block index',
      value: '818044',
    ),
    TransactionDetailTile(
      title: 'Height',
      value: '154595',
    ),
    TransactionDetailTile(
      title: 'Received time',
      value: '2019-08-24 • 15:43',
    ),
  ],
);
