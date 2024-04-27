import 'package:busha_assessment/core/utils/exports.dart';

/// A widget that displays a list of all trending news.
class AllTrendingNewsView extends StatefulWidget {
  const AllTrendingNewsView({super.key});

  @override
  State<AllTrendingNewsView> createState() => _AllTrendingNewsViewState();
}

class _AllTrendingNewsViewState extends State<AllTrendingNewsView> {
  @override
  Widget build(BuildContext context) {
    return ContraViewBuilder(
      builder: (BuildContext context, TrendingNewsController controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () => controller.navigateBack(),
              child: const CustomBackButton(),
            ),
            title: Text(
              'Trending news',
              style: GoogleFonts.inter(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: CustomColors.black.withOpacity(0.95),
              ),
            ),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                16.szbh,
                // Trending news
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) => Padding(
                      padding: 16.hp,
                      child: const TrendingNewsContainer(),
                    ),
                    separatorBuilder: (context, index) => Padding(
                      padding: 16.hp,
                      child: const SeparatorDivider(
                        dividerColor: Color(0xffe3e5e6),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      controllerBuilder: () => TrendingNewsController(),
    );
  }
}
