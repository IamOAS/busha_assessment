import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a divider in the explore view.
class ExploreDivider extends StatelessWidget {
  const ExploreDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: 2.h,
      color: const Color(0xffF2F3F7),
    );
  }
}
