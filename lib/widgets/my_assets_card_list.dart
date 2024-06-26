import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a list of assets owned by the user.
class MyAssetCardList extends StatelessWidget {
  const MyAssetCardList({
    super.key,
    required this.shouldScroll,
    required this.assets,
    required this.controller,
  });

  final bool shouldScroll;
  final List<Asset> assets;
  final dynamic controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: assets.length,
      physics: !shouldScroll ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
      itemBuilder: (context, index) => InkWell(
        key: ValueKey(assets[index].symbol),
        onTap: () {
          controller.setSelectedTransaction(assets[index].symbol);

          if (assets[index].symbol == 'BTC') {
            controller.navigateTo(Routes.btcTransactionsView);
          } else if (assets[index].symbol == 'XTZ') {
            controller.resetTezosBlocksFetchingData();
            controller.navigateTo(Routes.tezosBlocksView);
          } else {
            Fluttertoast.showToast(
              msg: 'Coming soon!',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: CustomColors.primary70,
              textColor: CustomColors.white,
              fontSize: 16.sp,
            );
          }
        },
        child: Row(
          children: [
            // Asset logo
            if (assets[index].name != 'Tezos') ...{
              SizeXSVG(
                icon: assets[index].logo,
                size: 40,
              ),
            } else ...{
              Image.asset(
                assets[index].logo.png,
                width: 40.h,
                height: 40.h,
              ),
            },
            16.szbw,
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Asset name and symbol
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          assets[index].name,
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.black,
                          ),
                        ),
                        2.szbh,
                        Text(
                          assets[index].symbol!,
                          style: GoogleFonts.inter(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xff9Ba0a5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  16.szbw,
                  // Asset value
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\u20A6${NumberFormat('#,###').format(assets[index].value)}',
                          style: GoogleFonts.inter(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: CustomColors.black,
                          ),
                        ),
                        2.szbh,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizeXSVG(
                              icon: assets[index].profit == true ? 'arrow-up-right' : 'arrow-down-right',
                              size: 16,
                            ),
                            Flexible(
                              child: Text(
                                '${assets[index].percentage}%',
                                style: GoogleFonts.inter(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: assets[index].profit == true ? CustomColors.primary70 : CustomColors.error70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      separatorBuilder: (context, index) => 16.szbh,
    );
  }
}
