import 'package:busha_assessment/core/utils/exports.dart';

class TransactionsService {
  final StateProviderRef ref;

  TransactionsService(this.ref);

  Future<ResponseModel<BitcoinLatestBlockTransactionsResponseModel>> getBtcLatestBlockTransactions({required String hash}) async {
    try {
      Response<dynamic>? response = await ref.read(networkServiceProvider).get(
            url: '${ref.read(urlServiceProvider).btcBlockTransactions}$hash',
          );

      final int? statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        BitcoinLatestBlockTransactionsResponseModel notificationsResponseModel = BitcoinLatestBlockTransactionsResponseModel.fromJson(response.data);

        return ResponseModel<BitcoinLatestBlockTransactionsResponseModel>(
          valid: true,
          statusCode: statusCode,
          message: response.statusMessage,
          data: notificationsResponseModel,
        );
      }

      return ResponseModel<BitcoinLatestBlockTransactionsResponseModel>(
        errorModel: ErrorModel.fromJson(response.data),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<ResponseModel<BitcoinLatestBlockResponseModel>> getBtcLatestBlock() async {
    try {
      Response<dynamic>? response = await ref.read(networkServiceProvider).get(
            url: ref.read(urlServiceProvider).btcLatestBlock,
          );

      final int? statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        BitcoinLatestBlockResponseModel notificationsResponseModel = BitcoinLatestBlockResponseModel.fromJson(response.data);

        return ResponseModel<BitcoinLatestBlockResponseModel>(
          valid: true,
          statusCode: statusCode,
          message: response.statusMessage,
          data: notificationsResponseModel,
        );
      }

      return ResponseModel<BitcoinLatestBlockResponseModel>(
        errorModel: ErrorModel.fromJson(response.data),
      );
    } catch (e) {
      rethrow;
    }
  }
}
