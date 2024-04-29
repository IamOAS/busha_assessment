import 'package:busha_assessment/core/utils/exports.dart';

/// This class handles transactions.
class TransactionsService {
  final StateProviderRef ref;

  TransactionsService(this.ref);

  /// This method fetches the latest Tezos blocks.
  Future<ResponseModel<TezosBlocksResponseModel>> getTezosBlocks(int limit) async {
    try {
      Response<dynamic>? response = await ref.read(networkServiceProvider).get(
            url: '${ref.read(urlServiceProvider).tezosBlocks}?limit=$limit&sort.desc=level',
          );

      final int? statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        TezosBlocksResponseModel tezosBlocksResponseModel = TezosBlocksResponseModel.fromJson(
          {"blocks": response.data},
        );

        return ResponseModel<TezosBlocksResponseModel>(
          valid: true,
          statusCode: statusCode,
          message: response.statusMessage,
          data: tezosBlocksResponseModel,
        );
      }

      return ResponseModel<TezosBlocksResponseModel>(
        errorModel: ErrorModel.fromJson(response.data),
      );
    } catch (e) {
      Logger().e(
        e.toString(),
      );
      rethrow;
    }
  }

  /// This method fetches the latest block transactions for Bitcoin.
  Future<ResponseModel<BitcoinLatestBlockTransactionsResponseModel>> getBtcLatestBlockTransactions({required String hash}) async {
    try {
      Response<dynamic>? response = await ref.read(networkServiceProvider).get(
            url: '${ref.read(urlServiceProvider).btcBlockTransactions}$hash',
          );

      final int? statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        BitcoinLatestBlockTransactionsResponseModel bitcoinLatestBlockTransactionsResponseModel =
            BitcoinLatestBlockTransactionsResponseModel.fromJson(response.data);

        return ResponseModel<BitcoinLatestBlockTransactionsResponseModel>(
          valid: true,
          statusCode: statusCode,
          message: response.statusMessage,
          data: bitcoinLatestBlockTransactionsResponseModel,
        );
      }

      return ResponseModel<BitcoinLatestBlockTransactionsResponseModel>(
        errorModel: ErrorModel.fromJson(response.data),
      );
    } catch (e) {
      Logger().e(
        e.toString(),
      );
      rethrow;
    }
  }

  /// This method fetches the latest block hash for Bitcoin.
  Future<ResponseModel<BitcoinLatestBlockResponseModel>> getBtcLatestBlock() async {
    try {
      Response<dynamic>? response = await ref.read(networkServiceProvider).get(
            url: ref.read(urlServiceProvider).btcLatestBlock,
          );

      final int? statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        BitcoinLatestBlockResponseModel bitcoinLatestBlockResponseModel = BitcoinLatestBlockResponseModel.fromJson(response.data);

        return ResponseModel<BitcoinLatestBlockResponseModel>(
          valid: true,
          statusCode: statusCode,
          message: response.statusMessage,
          data: bitcoinLatestBlockResponseModel,
        );
      }

      return ResponseModel<BitcoinLatestBlockResponseModel>(
        errorModel: ErrorModel.fromJson(response.data),
      );
    } catch (e) {
      Logger().e(
        e.toString(),
      );
      rethrow;
    }
  }
}
