import 'package:busha_assessment/core/utils/exports.dart';

/// A view that displays a list of Tezos blocks.
class TezosBlocksView extends StatefulWidget {
  const TezosBlocksView({super.key});

  @override
  State<TezosBlocksView> createState() => _TezosBlocksViewState();
}

class _TezosBlocksViewState extends State<TezosBlocksView> {
  final ScrollController _scrollController = ScrollController();
  late Future<List<Block>?> _future;

  void _reloadPage(TransactionsController controller) {
    setState(() {
      _future = controller.getTezosBlocks();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      onViewReady: (TransactionsController controller) {
        _future = controller.getTezosBlocks();
        _scrollController.addListener(() async {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            if (controller.isBusy) return;
            controller.setBusy(true);
            await controller.getTezosBlocks();
            controller.setTezosBlocksCount(true);
            controller.setBusy(false);
          }
        });
      },
      onDispose: (controller) {
        _scrollController.dispose();
      },
      builder: (BuildContext context, TransactionsController controller) {
        return FutureBuilder<List<Block>?>(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<List<Block>?> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return CustomLoadingView(
                  loadingText: 'Fetching {${controller.selectedTransaction!.toUpperCase()}} blocks',
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
                        '${controller.selectedTransaction!.toUpperCase()} blocks',
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
                            // Blocks
                            Expanded(
                              child: controller.tezosBlocks.isNotEmpty
                                  ? ListView.separated(
                                      controller: _scrollController,
                                      shrinkWrap: true,
                                      physics: const ClampingScrollPhysics(),
                                      itemCount: controller.tezosBlocks.length + (controller.isBusy ? 1 : 0),
                                      itemBuilder: (context, index) {
                                        if (index < controller.tezosBlocks.length) {
                                          return InkWell(
                                            onTap: () {
                                              controller.setTransactionDetailsTiles(
                                                [
                                                  TransactionDetailTile(
                                                    title: 'Hash',
                                                    value: controller.tezosBlocks[index].hash ?? '--',
                                                  ),
                                                  TransactionDetailTile(
                                                    title: 'Time',
                                                    value: controller.tezosBlocks[index].timestamp?.add(
                                                              const Duration(hours: 1),
                                                            ) !=
                                                            null
                                                        ? '${DateFormat('yyyy-MM-dd').format(
                                                            controller.tezosBlocks[index].timestamp!.add(
                                                              const Duration(hours: 1),
                                                            ),
                                                          )} • ${DateFormat.Hm().format(
                                                            controller.tezosBlocks[index].timestamp!.add(
                                                              const Duration(hours: 1),
                                                            ),
                                                          )}'
                                                        : '--',
                                                  ),
                                                  TransactionDetailTile(
                                                    title: 'Level',
                                                    value: controller.tezosBlocks[index].level?.toString() ?? '-',
                                                  ),
                                                  TransactionDetailTile(
                                                    title: 'Reward',
                                                    value: controller.tezosBlocks[index].reward?.toString() ?? '-',
                                                  ),
                                                  TransactionDetailTile(
                                                    title: 'Bonus',
                                                    value: controller.tezosBlocks[index].bonus?.toString() ?? '-',
                                                  ),
                                                  TransactionDetailTile(
                                                    title: 'Fees',
                                                    value: controller.tezosBlocks[index].fees?.toString() ?? '-',
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
                                                        controller.tezosBlocks[index].hash ?? '--',
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
                                                        controller.tezosBlocks[index].timestamp?.add(
                                                                  const Duration(hours: 1),
                                                                ) !=
                                                                null
                                                            ? '${DateFormat('yyyy-MM-dd').format(
                                                                controller.tezosBlocks[index].timestamp!.add(
                                                                  const Duration(hours: 1),
                                                                ),
                                                              )} • ${DateFormat.Hm().format(
                                                                controller.tezosBlocks[index].timestamp!.add(
                                                                  const Duration(hours: 1),
                                                                ),
                                                              )}'
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
                                        } else {
                                          return Center(
                                            child: CustomProgressIndicator(
                                              iosIndicatorRadius: 15.r,
                                            ),
                                          );
                                        }
                                      },
                                      separatorBuilder: (context, index) => const SeparatorDivider(),
                                    )
                                  : Center(
                                      child: Text(
                                        'No block to show here yet',
                                        style: GoogleFonts.inter(
                                          fontSize: 18.sp,
                                          fontWeight: FontWeight.w400,
                                          color: CustomColors.black.withOpacity(0.56),
                                        ),
                                      ),
                                    ),
                            ),
                            30.szbh,
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
