import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays all the assets owned by the user.
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
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () => controller.navigateBack(),
              child: const CustomBackButton(),
            ),
            title: Text(
              'My assets',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
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
                      controller: controller,
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
