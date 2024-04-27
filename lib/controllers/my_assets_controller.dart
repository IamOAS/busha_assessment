import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the assets view.
class MyAssetsController extends ContraController {
  MyAssetsController() : super();

  List<Asset> get allMyAssets => [
        ...ref.watch(assetsProvider),
        ...ref.watch(assetsProvider),
        ...ref.watch(assetsProvider),
        ...ref.watch(assetsProvider),
      ];

  void setSelectedTransaction(String? transaction) => ref.read(selectedTransactionProvider.notifier).state = transaction;

  Future navigateTo(String routeName) => ref.read(navigationServiceProvider).navigateTo(routeName);
  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
}
