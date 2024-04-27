import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays a list of transactions.
class TransactionsView extends StatefulWidget {
  const TransactionsView({super.key});

  @override
  State<TransactionsView> createState() => _TransactionsViewState();
}

class _TransactionsViewState extends State<TransactionsView> {
  late Future<List<Tx>?> _future;

  void _reloadPage(TransactionsController controller) {
    setState(() {
      _future = controller.getBtcLatestBlockTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      onViewReady: (TransactionsController controller) {
        _future = controller.getBtcLatestBlockTransactions();
      },
      builder: (BuildContext context, TransactionsController controller) {
        return FutureBuilder<List<Tx>?>(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<List<Tx>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CustomLoadingView(
                  loadingText: 'Fetching your {${controller.selectedTransaction!.toUpperCase()}} transactions',
                );
              default:
                if (snapshot.hasError || snapshot.hasData == false || snapshot.data == null) {
                  return Scaffold(
                    body: FutureErrorWidget(
                      reloadPage: () {
                        _reloadPage(controller);
                      },
                    ),
                  );
                } else {
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
                              child: snapshot.data!.isNotEmpty
                                  ? ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: snapshot.data!.length,
                                      itemBuilder: (context, index) {
                                        DateTime date = DateTime.fromMillisecondsSinceEpoch(snapshot.data![index].time! * 1000);

                                        return InkWell(
                                          onTap: () {
                                            controller.setTransactionDetailsTiles(
                                              [
                                                TransactionDetailTile(
                                                  title: 'Hash',
                                                  value: snapshot.data![index].hash ?? '--',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Time',
                                                  value: snapshot.data![index].time != null
                                                      ? '${DateFormat('yyyy-MM-dd').format(date)} • ${DateFormat.Hm().format(date)}'
                                                      : '--',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Size',
                                                  value: snapshot.data![index].size?.toString() ?? '-',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Block index',
                                                  value: snapshot.data![index].blockIndex?.toString() ?? '-',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Height',
                                                  value: snapshot.data![index].blockHeight?.toString() ?? '-',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Received time',
                                                  value: snapshot.data![index].time != null
                                                      ? '${DateFormat('yyyy-MM-dd').format(date)} • ${DateFormat.Hm().format(date)}'
                                                      : '--',
                                                ),
                                              ],
                                            );
                                            controller.navigateTo(Routes.transactionDetailsView);
                                          },
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    // Hash
                                                    Text(
                                                      snapshot.data![index].hash ?? '--',
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
                                                      snapshot.data![index].time != null
                                                          ? '${DateFormat('yyyy-MM-dd').format(date)} • ${DateFormat.Hm().format(date)}'
                                                          : '--',
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
                                        );
                                      },
                                      separatorBuilder: (context, index) => const SeparatorDivider(),
                                    )
                                  : Center(
                                      child: Text(
                                        'No transaction to show here yet',
                                        style: GoogleFonts.inter(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.black.withOpacity(0.56),
                                        ),
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            }
          },
        );
      },
      controllerBuilder: () => TransactionsController(),
    );
  }
}
