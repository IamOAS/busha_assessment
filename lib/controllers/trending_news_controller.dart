import 'package:busha_assessment/core/utils/exports.dart';

/// Controller for the trending news view.
class TrendingNewsController extends ContraController {
  TrendingNewsController() : super();

  void navigateBack() => ref.read(navigationServiceProvider).navigateBack();
}
