import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays the details of a transaction.
class TransactionDetailsView extends StatefulWidget {
  const TransactionDetailsView({super.key});

  @override
  State<TransactionDetailsView> createState() => _TransactionDetailsViewState();
}

class _TransactionDetailsViewState extends State<TransactionDetailsView> {
  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (BuildContext context, TransactionsController controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () => controller.navigateBack(),
              child: const CustomBackButton(),
            ),
            title: CustomAppBarTitle(
              text: controller.selectedTransaction == 'BTC' ? 'Transaction details' : 'Block details',
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: 16.hp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    24.szbh,
                    // Transaction details
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.transactionDetailsTiles.length,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Flexible(
                            child: Text(
                              controller.transactionDetailsTiles[index].title,
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.black.withOpacity(0.60),
                              ),
                            ),
                          ),
                          16.szbw,
                          // Value
                          Flexible(
                            flex: index == 0 ? 3 : 1,
                            child: Text(
                              controller.transactionDetailsTiles[index].value,
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.black.withOpacity(0.95),
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) => SeparatorDivider(padding: 8.h),
                    ),
                    67.szbh,
                    // View on blockchain explorer
                    InkWell(
                      onTap: () => controller.launchURL(
                        context: context,
                        url: controller.selectedTransaction == 'BTC'
                            ? 'https://www.blockchain.com/explorer/transactions/btc/${controller.transactionDetailsTiles[0].value}'
                            : 'https://tzkt.io/${controller.transactionDetailsTiles[0].value}',
                      ),
                      child: Row(
                        children: [
                          const SizeXSVG(icon: 'external-link', size: 24),
                          16.szbw,
                          Expanded(
                            child: Text(
                              'View on blockchain explorer',
                              style: GoogleFonts.inter(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w400,
                                color: CustomColors.black.withOpacity(0.95),
                              ),
                            ),
                          ),
                          16.szbw,
                          const SizeXSVG(icon: 'chevron-right', size: 36),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => TransactionsController(),
    );
  }
}
