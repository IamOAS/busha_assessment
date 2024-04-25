import 'package:busha_assessment/core/utils/exports.dart';

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (BuildContext context, ExploreController controller) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: 16.hp,
              child: const Column(
                children: [],
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => ExploreController(),
    );
  }
}
