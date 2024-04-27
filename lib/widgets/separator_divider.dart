import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a divider used as a separator in [ListView] builders.
class SeparatorDivider extends StatelessWidget {
  const SeparatorDivider({
    super.key,
    this.padding,
    this.dividerColor,
  });

  final double? padding;
  final Color? dividerColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Divider
        Padding(
          padding: EdgeInsets.symmetric(vertical: padding ?? 16.h),
          child: Divider(
            thickness: 1.h,
            color: dividerColor ?? CustomColors.black.withOpacity(0.08),
          ),
        ),
      ],
    );
  }
}
