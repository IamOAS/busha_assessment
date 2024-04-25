import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays an SVG icon with a specified size.
class SizeXSVG extends StatelessWidget {
  final String icon;
  final Color? color;
  final double size;

  const SizeXSVG({
    super.key,
    required this.icon,
    required this.size,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.h,
      width: size.h,
      child: Center(
        child: SvgPicture.asset(
          icon.svg,
          colorFilter: color != null
              ? ColorFilter.mode(
                  color!,
                  BlendMode.srcIn,
                )
              : null,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
