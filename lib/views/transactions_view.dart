import 'package:busha_assessment/core/utils/exports.dart';

class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
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
            title: Text(
              '${controller.selectedTransaction!.toUpperCase()} transactions',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: CustomColors.black.withOpacity(0.95),
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
                  // Transactions
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () => controller.navigateTo(Routes.transactionDetailsView),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Hash
                                  Text(
                                    '0000000000000bae09a7a393a8acded75aa67e46cb81f7acaa5ad94f9eacd103',
                                    style: GoogleFonts.inter(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.black.withOpacity(0.95),
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  8.szbh,
                                  // Date and time
                                  Text(
                                    '2019-08-24 • 15:43',
                                    style: GoogleFonts.inter(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w400,
                                      color: CustomColors.black.withOpacity(0.56),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            16.szbw,
                            const SizeXSVG(icon: 'chevron-right', size: 36),
                          ],
                        ),
                      ),
                      separatorBuilder: (context, index) => const SeparatorDivider(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      controllerBuilder: () => TransactionsController(),
    );
  }
}
