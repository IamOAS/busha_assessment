import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays the splash screen.
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  String _firstText = '';
  String _secondText = '';
  String firstText = 'Busha';
  String secondText = ' Assessment';

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      onViewReady: (SplashController controller) {
        _animationController = AnimationController(
          vsync: this,
          duration: const Duration(milliseconds: 1500),
        );

        _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
        );

        _animation.addListener(() {
          setState(() {
            int length = firstText.length;
            int length2 = ' $secondText'.length;
            int currentLength = (_animation.value * length).toInt();
            int currentLength2 = ((_animation.value - 0.5) * length2 * 2).toInt();

            if (_animation.value < 0.5) {
              _firstText = firstText.substring(0, currentLength);
              _secondText = '';
            } else {
              _firstText = firstText;
              _secondText = ' $secondText'.substring(0, currentLength2);
            }
          });
        });

        _animationController.forward();

        Timer(
          const Duration(seconds: 3),
          () async {
            controller.clearStackAndNavigateTo(Routes.dashboardView);
          },
        );
      },
      onDispose: (controller) {
        if (mounted) {
          _animationController.dispose();
          controller.dispose();
        }
      },
      builder: (BuildContext context, SplashController controller) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: 20.hp,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: _firstText,
                            style: GoogleFonts.inter(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w800,
                              color: CustomColors.primary70,
                            ),
                          ),
                          TextSpan(
                            text: _secondText,
                            style: GoogleFonts.inter(
                              fontSize: 32.sp,
                              fontWeight: FontWeight.w800,
                              color: CustomColors.primary70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
      controllerBuilder: () => SplashController(),
    );
  }
}
