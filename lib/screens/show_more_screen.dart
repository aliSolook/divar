import 'package:divar/extensions.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../elements/poster.dart';

class ShowMoreScreen extends StatelessWidget {
  const ShowMoreScreen({
    super.key,
    required this.posters,
    required this.type,
  });

  final List<Poster> posters;
  final PosterType type;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar(context),
        body: Directionality(
          textDirection: TextDirection.rtl,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                sliver: SliverList.list(
                  children: posters
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

  PreferredSizeWidget _appBar(final BuildContext context) {
    return AppBar(
      backgroundColor: DefaultColors.white,
      title: Text(
        type == PosterType.hot ? 'آویز های داغ' : 'آویز های اخیر',
        style: const TextStyle(
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
    );
  }
}
