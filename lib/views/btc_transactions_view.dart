import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays a list of BTC transactions.
class BtcTransactionsView extends StatefulWidget {
  const BtcTransactionsView({super.key});

  @override
  State<BtcTransactionsView> createState() => _BtcTransactionsViewState();
}

class _BtcTransactionsViewState extends State<BtcTransactionsView> {
  bool _isSearching = false;
  late Future<List<Tx>?> _future;

  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  final List<Tx> _searchedTransactions = [];
  final List<Tx> _allTransactions = [];

  List<Tx> _btcTransactions() {
    if (_isSearching) {
      return _searchedTransactions;
    } else {
      return _allTransactions;
    }
  }

  void onSearch(value) {
    if (value.isEmpty) {
      setState(() {
        _isSearching = false;
        _searchedTransactions.clear();
      });
    } else {
      final List<Tx> filteredTransactions = _allTransactions
          .where(
            (element) => element.hash != null && element.hash!.toLowerCase().contains(value.toLowerCase()),
          )
          .toList();

      setState(() {
        _isSearching = true;
        _searchedTransactions.clear();
        _searchedTransactions.addAll(filteredTransactions);
      });
    }
  }

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
      onDispose: (TransactionsController controller) {
        _searchController.dispose();
        _searchFocusNode.dispose();
      },
      builder: (BuildContext context, TransactionsController controller) {
        return FutureBuilder<List<Tx>?>(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<List<Tx>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CustomLoadingView(
                  loadingText: 'Fetching {${controller.selectedTransaction!.toUpperCase()}} transactions',
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
                  for (Tx txn in snapshot.data!) {
                    if (_allTransactions.isEmpty || _allTransactions.every((element) => element.hash != txn.hash)) {
                      _allTransactions.add(txn);
                    }
                  }

                  return Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,
                      leading: InkWell(
                        onTap: () => controller.navigateBack(),
                        child: const CustomBackButton(),
                      ),
                      title: CustomAppBarTitle(
                        text: '${controller.selectedTransaction!.toUpperCase()} transactions',
                      ),
                      centerTitle: true,
                    ),
                    body: SafeArea(
                      child: Padding(
                        padding: 16.hp,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            10.szbh,
                            // Search bar
                            CustomTextFormField(
                              textFormField: TextFormFieldWidget(
                                controller: _searchController,
                                focusNode: _searchFocusNode,
                                hintText: 'Search transactions',
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? InkWell(
                                        onTap: () {
                                          _searchController.clear();
                                          _searchFocusNode.unfocus();
                                          onSearch('');
                                        },
                                        child: const Icon(
                                          Icons.clear_rounded,
                                        ),
                                      )
                                    : const SizedBox(),
                                onChanged: onSearch,
                                onFieldSubmitted: onSearch,
                              ),
                            ),
                            20.szbh,
                            // Transactions
                            Expanded(
                              child: _btcTransactions().isNotEmpty
                                  ? ListView.separated(
                                      shrinkWrap: true,
                                      itemCount: _btcTransactions().length,
                                      itemBuilder: (context, index) {
                                        DateTime date = DateTime.fromMillisecondsSinceEpoch(_btcTransactions()[index].time! * 1000);

                                        return InkWell(
                                          onTap: () {
                                            controller.setTransactionDetailsTiles(
                                              [
                                                TransactionDetailTile(
                                                  title: 'Hash',
                                                  value: _btcTransactions()[index].hash ?? '--',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Time',
                                                  value: _btcTransactions()[index].time != null
                                                      ? '${DateFormat('yyyy-MM-dd').format(date)} • ${DateFormat.Hm().format(date)}'
                                                      : '--',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Size',
                                                  value: _btcTransactions()[index].size?.toString() ?? '-',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Block index',
                                                  value: _btcTransactions()[index].blockIndex?.toString() ?? '-',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Height',
                                                  value: _btcTransactions()[index].blockHeight?.toString() ?? '-',
                                                ),
                                                TransactionDetailTile(
                                                  title: 'Received time',
                                                  value: _btcTransactions()[index].time != null
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
                                                      _btcTransactions()[index].hash ?? '--',
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
                                                      _btcTransactions()[index].time != null
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
                                        !_isSearching ? 'No transaction to show here yet' : 'No transaction found',
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
