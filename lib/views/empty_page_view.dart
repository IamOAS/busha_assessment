import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays an empty page.
class EmptyPageView extends StatefulWidget {
  const EmptyPageView({super.key});

  @override
  State<EmptyPageView> createState() => _EmptyPageViewState();
}

class _EmptyPageViewState extends State<EmptyPageView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: 16.hp,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Empty Page
                FadeTransition(
                  opacity: _animation,
                  child: Text(
                    'Empty Page',
                    style: GoogleFonts.inter(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.primary70,
                    ),
                  ),
                ),
                16.szbh,
                // This page is empty for now. Please check back later.
                Text(
                  'This page is empty for now. Please check back later.',
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.black.withOpacity(0.95),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
