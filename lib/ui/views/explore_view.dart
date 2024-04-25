import 'package:busha_assessment/core/utils/exports.dart';
import 'package:busha_assessment/ui/widgets/explore/explore_todays_top_movers_card.dart';
import '../widgets/explore/explore_balance_card.dart';

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
          appBar: AppBar(
            leading: const SizeXSVG(
              icon: 'scan',
              size: 24,
            ),
            title: Text(
              'Explore',
              style: GoogleFonts.rubik(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
            actions: [
              const SizeXSVG(
                icon: 'search',
                size: 24,
              ),
              16.szbw,
              const SizeXSVG(
                icon: 'notification',
                size: 24,
              ),
              10.szbw,
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  22.szbh,
                  // Balance card
                  const ExploreBalanceCard(),
                  controller.isBalanceShown ? 20.szbh : 1.szbh,
                  // Divider
                  const ExploreDivider(),
                  20.szbh,
                  // My assets card
                  const ExploreMyAssetsCard(),
                  20.szbh,
                  // Divider
                  const ExploreDivider(),
                  20.szbh,
                  // Today's top movers card
                  const ExploreTodaysTopMoversCard(),
                ],
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => ExploreController(),
    );
  }
}
