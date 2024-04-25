import 'package:busha_assessment/core/utils/exports.dart';

class AllMyAssetsView extends StatefulWidget {
  const AllMyAssetsView({super.key});

  @override
  State<AllMyAssetsView> createState() => _AllMyAssetsViewState();
}

class _AllMyAssetsViewState extends State<AllMyAssetsView> {
  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (BuildContext context, MyAssetsController controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'My assets',
              style: GoogleFonts.rubik(
                fontSize: 18.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Padding(
              padding: 16.hp,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  16.szbh,
                  // My assets
                  Expanded(
                    child: MyAssetCardList(
                      shouldScroll: true,
                      assets: controller.allMyAssets,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => MyAssetsController(),
    );
  }
}