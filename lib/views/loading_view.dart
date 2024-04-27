import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays a loading screen.
class CustomLoadingView extends StatefulWidget {
  const CustomLoadingView({
    super.key,
    required this.loadingText,
  });

  final String loadingText;

  @override
  State<CustomLoadingView> createState() => _CustomLoadingViewState();
}

class _CustomLoadingViewState extends State<CustomLoadingView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _rotationAnimation = Tween<double>(begin: 0.0, end: 360.0).animate(_animationController);
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
                // Spinning block
                AnimatedBuilder(
                  animation: _rotationAnimation,
                  builder: (_, child) => Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateZ(
                        _rotationAnimation.value * (pi / 180),
                      ),
                    child: Image.asset(
                      'spinning-block'.png,
                      width: 80.h,
                      height: 80.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                40.szbh,
                // Loading text
                Text(
                  widget.loadingText,
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
