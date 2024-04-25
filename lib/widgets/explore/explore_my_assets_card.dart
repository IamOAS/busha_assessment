import 'package:busha_assessment/core/utils/exports.dart';

class ExploreMyAssetsCard extends ContraWidget<ExploreController> {
  const ExploreMyAssetsCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ExploreController controller) {
    return Padding(
      padding: 16.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // My assets title
          ExploreTitle(
            title: 'My assets',
            onTapSeeAll: () {
              controller.navigateTo(Routes.allAssetsView);
            },
          ),
          16.szbh,
          // My assets
          MyAssetCardList(
            shouldScroll: false,
            assets: controller.myAssets,
          ),
        ],
      ),
    );
  }
}
