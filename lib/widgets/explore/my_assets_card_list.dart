import 'package:busha_assessment/core/utils/exports.dart';

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
        onTap: () {
          controller.setSelectedTransaction(assets[index].symbol);
          controller.navigateTo(Routes.transactionsView);
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
