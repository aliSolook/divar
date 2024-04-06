import 'package:divar/extensions.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../elements/poster.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final posters = Poster.loadPosters();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: DefaultColors.white,
          title: const Text.rich(
            TextSpan(
              text: 'جستجو در',
              children: [
                WidgetSpan(
                  child: Image(
                    height: 24,
                    image: AssetImage('assets/images/aviz_text.png'),
                  ),
                ),
              ],
            ),
            style: TextStyle(
              fontFamily: DefaultFonts.medium,
              fontSize: 16,
              color: DefaultColors.red,
            ),
          ),
          elevation: 0,
          leading: IconButton(
            splashRadius: 24,
            onPressed: () => Navigator.pop(context),
            icon: Transform.flip(
              flipX: true,
              child: const Image(
                width: 24,
                image: AssetImage('assets/images/arrow_left_red_icon.png'),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              _appBar(),
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _appBar() {
    return const SliverAppBar(
      clipBehavior: Clip.none,
      floating: true,
      toolbarHeight: 80,
      snap: true,
      title: Padding(
        padding: EdgeInsets.symmetric(),
        child: Material(
          color: Colors.transparent,
          elevation: 8,
          child: TextField(
            decoration: InputDecoration(
              fillColor: DefaultColors.white,
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: DefaultColors.mediumLightGrey,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  color: DefaultColors.mediumLightGrey,
                  width: 1,
                ),
              ),
              prefixIcon: Padding(
                padding: EdgeInsetsDirectional.only(start: 16, end: 8),
                child: Image(
                  width: 24,
                  height: 24,
                  image: AssetImage('assets/images/search_icon.png'),
                ),
              ),
              hintText: 'جستجو...',
            ),
          ),
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: Colors.transparent,
      automaticallyImplyLeading: false,
    );
  }
}
