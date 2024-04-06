import 'package:divar/constants.dart';
import 'package:divar/extensions.dart';
import 'package:divar/screens/show_more_screen.dart';
import 'package:divar/widgets/hyper_text.dart';
import 'package:flutter/material.dart';
import '../elements/poster.dart';

class PosterScreen extends StatelessWidget {
  const PosterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posters = Poster.loadPosters();
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: CustomScrollView(
          slivers: [
            _appBar(),
            SliverToBoxAdapter(
              child: _categoryHeader(
                title: 'آویز های داغ',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMoreScreen(
                      posters: posters.hot,
                      type: PosterType.hot,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverToBoxAdapter(
                child: SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: posters.hot
                        .map<Widget>(
                          (e) => PosterWidget(
                            poster: e,
                            position: PosterType.hot,
                          ),
                        )
                        .toList()
                        .joinAsList(
                      const [
                        SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _categoryHeader(
                title: 'آویز های اخیر',
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowMoreScreen(
                      posters: posters.latest,
                      type: PosterType.latest,
                    ),
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              sliver: SliverList.list(
                children: posters.latest
                    .map<Widget>(
                      (e) => PosterWidget(
                        poster: e,
                        position: PosterType.latest,
                      ),
                    )
                    .toList()
                    .joinAsList(
                  const [
                    SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _categoryHeader({
    required String title,
    required void Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 32.0,
        bottom: 24.0,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: DefaultFonts.bold,
              fontSize: 16,
              color: DefaultColors.veryDarkGrey,
            ),
          ),
          const Spacer(),
          HyperText(
            text: 'مشاهده همه',
            style: const TextStyle(
              fontFamily: DefaultFonts.regular,
              fontSize: 14,
              color: DefaultColors.grey,
            ),
            hoverStyle: const TextStyle(
                fontFamily: DefaultFonts.regular,
                fontSize: 14,
                color: DefaultColors.grey,
                decoration: TextDecoration.underline),
            onTap: onTap,
          ),
        ],
      ),
    );
  }

  Widget _appBar() {
    return const SliverAppBar(
      // floating: true,
      // snap: true,
      title: Image(
        height: 26,
        image: AssetImage('assets/images/aviz_text_logo.png'),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }
}
