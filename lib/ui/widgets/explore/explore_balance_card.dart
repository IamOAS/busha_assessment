import 'package:busha_assessment/core/utils/exports.dart';

class ExploreBalanceCard extends ContraWidget<ExploreController> {
  const ExploreBalanceCard({
    super.key,
  });

  @override
  Widget build(BuildContext context, ExploreController controller) {
    return Padding(
      padding: 16.hp,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // My balance title and visibility icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  'My balance',
                  style: GoogleFonts.rubik(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: CustomColors.black.withOpacity(0.6),
                  ),
                ),
              ),
              4.szbw,
              InkWell(
                onTap: controller.toggleShowBalance,
                child: Icon(
                  controller.isBalanceShown ? Icons.visibility : Icons.visibility_off,
                  color: CustomColors.black.withOpacity(0.6),
                ),
              ),
            ],
          ),
          8.szbh,
          // Balance amount
          if (controller.isBalanceShown) ...{
            RichText(
              text: TextSpan(
                text: '\u20A6',
                style: GoogleFonts.rubik(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700,
                  color: CustomColors.black.withOpacity(0.95),
                ),
                children: [
                  TextSpan(
                    text: '5,000.00',
                    style: GoogleFonts.rubik(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                      color: CustomColors.black.withOpacity(0.95),
                    ),
                  ),
                ],
              ),
            ),
          } else ...{
            Text(
              '****',
              style: GoogleFonts.rubik(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
                color: CustomColors.black.withOpacity(0.95),
              ),
            ),
          },
        ],
      ),
    );
  }
}
