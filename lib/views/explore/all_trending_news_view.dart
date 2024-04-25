import 'package:busha_assessment/core/utils/exports.dart';

class AllTrendingNewsView extends StatefulWidget {
  const AllTrendingNewsView({super.key});

  @override
  State<AllTrendingNewsView> createState() => _AllTrendingNewsViewState();
}

class _AllTrendingNewsViewState extends State<AllTrendingNewsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trending news',
          style: GoogleFonts.rubik(
            fontSize: 18.sp,
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
              // Trending news
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) => const TrendingNewsContainer(),
                  separatorBuilder: (context, index) => Column(
                    children: [
                      16.szbh,
                      // Divider
                      Divider(
                        thickness: 1.w,
                        color: const Color(0xffe3e5e6),
                      ),
                      16.szbh,
                    ],
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
