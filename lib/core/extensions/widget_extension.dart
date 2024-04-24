import 'package:busha_assessment/core/utils/exports.dart';

/// Extension on [num] to provide convenient methods for creating [SizedBox] widgets.
extension SizedBoxExtension on num {
  /// Returns a [SizedBox] widget with the height set to the value of the [num].
  SizedBox get szbh => SizedBox(
        height: toDouble().h,
      );

  /// Returns a [SizedBox] widget with the width set to the value of the [num].
  SizedBox get szbw => SizedBox(
        width: toDouble().w,
      );
}

/// Extension on [num] to provide convenient methods for creating symmetric padding.
extension SymmetricPadding on num {
  /// Returns an [EdgeInsets] object with horizontal padding equal to the current value in width units.
  EdgeInsets get hp => EdgeInsets.symmetric(
        horizontal: toDouble().w,
      );

  /// Returns an [EdgeInsets] object with vertical padding equal to the current value in height units.
  EdgeInsets get vp => EdgeInsets.symmetric(
        vertical: toDouble().h,
      );
}
