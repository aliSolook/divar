import 'package:divar/constants.dart';
import 'package:divar/extensions.dart';
import 'package:divar/widgets/common_widgets.dart';
import 'package:divar/widgets/geo_location.dart';
import 'package:flutter/material.dart';
import 'package:styled_divider/styled_divider.dart';
import '../elements/poster.dart';

class PosterViewScreen extends StatefulWidget {
  const PosterViewScreen({super.key, required this.poster});

  final Poster poster;

  @override
  State<PosterViewScreen> createState() => _PosterViewScreenState();
}

class _PosterViewScreenState extends State<PosterViewScreen>
    with SingleTickerProviderStateMixin {
  // late final _tabController = TabController(length: 4, vsync: this)
  //   ..addListener(() {
  //     setState(() {});
  //   });

  var _tabIndex = 0;
  final _animationDuration = const Duration(milliseconds: 300);

  Widget _container(
    Widget child, {
    EdgeInsetsGeometry padding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
  }) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border.fromBorderSide(
          BorderSide(
            color: DefaultColors.mediumLightGrey,
          ),
        ),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      child: Padding(
        padding: padding,
        child: child,
      ),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: DefaultColors.white,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: () {},
          splashRadius: 24,
          icon: const Image(
            width: 24,
            image: AssetImage('assets/images/archive_icon.png'),
          ),
        ),
        IconButton(
          onPressed: () {},
          splashRadius: 24,
          icon: const Image(
            width: 24,
            image: AssetImage('assets/images/share_icon.png'),
          ),
        ),
        IconButton(
          onPressed: () {},
          splashRadius: 24,
          icon: const Image(
            width: 24,
            image: AssetImage('assets/images/information_icon.png'),
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        splashRadius: 24,
        icon: const Image(
          width: 24,
          image: AssetImage('assets/images/arrow_right_icon.png'),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              sliver: SliverToBoxAdapter(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image(
                    width: double.infinity,
                    image: widget.poster.image,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 24, right: 16, left: 16),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [
                    DecoratedBox(
                      decoration: const BoxDecoration(
                        color: DefaultColors.veryLightGrey,
                        borderRadius: BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 4.0),
                        child: Text(
                          widget.poster.category.value,
                          style: const TextStyle(
                            fontFamily: DefaultFonts.regular,
                            fontSize: 14,
                            color: DefaultColors.red,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Builder(
                      builder: (context) {
                        final String text;
                        final String time;
                        final Duration timeDifference = DateTime.now()
                            .difference(widget.poster.dateCreated);

                        if (timeDifference.inMinutes < 60) {
                          time = '${timeDifference.inMinutes} دقیقه';
                        } else if (timeDifference.inHours < 24) {
                          time = '${timeDifference.inHours} ساعت';
                        } else if (timeDifference.inDays < 7) {
                          time = '${timeDifference.inDays} روز';
                        } else if (timeDifference.inDays < 30) {
                          time = '${(timeDifference.inDays / 7).round()} هفته';
                        } else {
                          time = '${(timeDifference.inDays / 30).round()} ماه';
                        }

                        text = '$time پیش در ${widget.poster.cityName}';

                        return Text(
                          text.toPersianNumber(),
                          style: const TextStyle(
                            fontFamily: DefaultFonts.regular,
                            fontSize: 14,
                            color: DefaultColors.darkGrey,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: Text(
                  widget.poster.title,
                  style: const TextStyle(
                    fontFamily: DefaultFonts.bold,
                    fontSize: 16,
                    color: DefaultColors.veryDarkGrey,
                  ),
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
              sliver: SliverToBoxAdapter(
                child: StyledDivider(
                  color: DefaultColors.mediumLightGrey,
                  height: 1,
                  thickness: 1,
                  lineStyle: DividerLineStyle.dashed,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.only(right: 16, left: 16, bottom: 32),
              sliver: SliverToBoxAdapter(
                child: ClickItem(
                  title: 'هشدار های قبل از معامله!',
                  trailingImage:
                      AssetImage('assets/images/arrow_left_grey_icon.png'),
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: CustomTabBar(
                  duration: _animationDuration,
                  index: _tabIndex,
                  onChanged: (index) => setState(() => _tabIndex = index),
                  tabs: const [
                    'مشخصات',
                    'قیمت',
                    'ویژگی ها و انکانات',
                    'توضیحات',
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              sliver: SliverToBoxAdapter(
                child: AnimatedSwitcher(
                  switchInCurve: Curves.easeOutCirc,
                  switchOutCurve: Curves.easeInCirc,
                  transitionBuilder: (child, animation) {
                    return AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Align(
                          alignment: Alignment.topCenter,
                          heightFactor: animation.value,
                          child: child,
                        );
                      },
                      child: Opacity(
                        opacity: animation.status == AnimationStatus.dismissed
                            ? 1
                            : 0,
                        child: child,
                      ),
                    );
                  },
                  duration: _animationDuration,
                  child: [
                    _detailsTab(),
                    _priceTab(),
                    _optionsTab(),
                    _descriptionTab(),
                  ]
                      .map(
                        (e) => SingleChildScrollView(
                          key: UniqueKey(),
                          child: e,
                        ),
                      )
                      .toList()[_tabIndex],
                ),
              ),
            ),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Widget _buttons() {
    return SliverPadding(
      padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
      sliver: SliverToBoxAdapter(
        child: Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 12),
                          child: Image(
                            width: 24,
                            image: AssetImage('assets/images/message_icon.png'),
                          ),
                        ),
                      ),
                      TextSpan(text: 'گفتگو'),
                    ],
                  ),
                  style: TextStyle(
                    fontFamily: DefaultFonts.regular,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: TextButton(
                onPressed: () {},
                child: const Text.rich(
                  TextSpan(
                    children: [
                      WidgetSpan(
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(end: 12),
                          child: Image(
                            width: 24,
                            image: AssetImage('assets/images/call_icon.png'),
                          ),
                        ),
                      ),
                      TextSpan(text: 'اطلاعات تماس'),
                    ],
                    style: TextStyle(
                      fontFamily: DefaultFonts.regular,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _descriptionTab() {
    return Text(
      widget.poster.description,
      style: const TextStyle(
        fontFamily: DefaultFonts.regular,
        fontSize: 14,
        color: DefaultColors.darkGrey,
      ),
    );
  }

  Widget _optionsTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _container(
          DefaultTextStyle(
            style: const TextStyle(
              fontFamily: DefaultFonts.regular,
              fontSize: 16,
              color: DefaultColors.darkGrey,
            ),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text('سند'),
                    Spacer(),
                    Text('تک برگ'),
                  ],
                ),
                const SizedBox(height: 16),
                const StyledDivider(
                  color: DefaultColors.mediumLightGrey,
                  height: 1,
                  thickness: 1,
                  lineStyle: DividerLineStyle.dashed,
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('جهت ساختمان'),
                    const Spacer(),
                    Text(widget.poster.buildingDirection.value),
                  ],
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'امکانات',
          image: AssetImage('assets/images/magicpen.png'),
        ),
        const SizedBox(height: 24),
        _container(
            DefaultTextStyle(
              style: const TextStyle(
                fontFamily: DefaultFonts.regular,
                fontSize: 16,
                color: DefaultColors.darkGrey,
              ),
              child: Builder(
                builder: (context) {
                  final options = List.from(widget.poster.options)
                    ..remove(PosterOptions.toilet)
                    ..remove(PosterOptions.iranianToilet);
                  String toiletText = '';

                  if (widget.poster.options
                      .contains(PosterOptions.iranianToilet)) {
                    toiletText = PosterOptions.iranianToilet.value;
                  }

                  if (widget.poster.options.contains(PosterOptions.toilet)) {
                    if (toiletText.isNotEmpty) toiletText += ' و ';
                    toiletText += PosterOptions.toilet.value;
                  }

                  final children = <Widget>[
                    for (var option in options) Text(option.value),
                    Text('جنس کف ${widget.poster.floorMaterial.value}'),
                    if (toiletText.isNotEmpty)
                      Text('سرویس بهداشتی $toiletText'),
                  ].joinAsList(
                    const [
                      SizedBox(height: 16),
                      StyledDivider(
                        color: DefaultColors.mediumLightGrey,
                        height: 1,
                        thickness: 1,
                        lineStyle: DividerLineStyle.dashed,
                      ),
                      SizedBox(height: 16),
                    ],
                  );

                  return SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: children,
                    ),
                  );
                },
              ),
            ),
            padding: const EdgeInsets.all(16)),
      ],
    );
  }

  Widget _priceTab() {
    return Center(
      child: _container(
        DefaultTextStyle(
          style: const TextStyle(
              fontFamily: DefaultFonts.regular,
              fontSize: 16,
              color: DefaultColors.veryDarkGrey),
          child: Column(
            children: [
              Row(
                children: [
                  const Text('قیمت هر متر:'),
                  const Spacer(),
                  Text(
                    widget.poster.pricePerMeter
                        .toString()
                        .addSplitters(3, '٬')
                        .toPersianNumber(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const StyledDivider(
                color: DefaultColors.mediumLightGrey,
                height: 1,
                thickness: 1,
                lineStyle: DividerLineStyle.dashed,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  const Text('قیمت کل:'),
                  const Spacer(),
                  Text(
                    (widget.poster.pricePerMeter * widget.poster.meterage)
                        .toString()
                        .addSplitters(3, '٬')
                        .toPersianNumber(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailsTab() {
    const headerStyle = TextStyle(
      fontFamily: DefaultFonts.regular,
      fontSize: 14,
      color: DefaultColors.darkGrey,
    );
    const dataStyle = TextStyle(
      fontFamily: DefaultFonts.regular,
      fontSize: 14,
      color: DefaultColors.veryDarkGrey,
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _container(
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text('متراژ', style: headerStyle),
                    const SizedBox(height: 8),
                    Text(
                      widget.poster.meterage.toString().toPersianNumber(),
                      style: dataStyle,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
                child: StyledVerticalDivider(
                  color: DefaultColors.mediumLightGrey,
                  width: 1,
                  thickness: 1,
                  lineStyle: DividerLineStyle.dashed,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text('اتاق', style: headerStyle),
                    const SizedBox(height: 8),
                    Text(
                      widget.poster.rooms.toString().toPersianNumber(),
                      style: dataStyle,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
                child: StyledVerticalDivider(
                  color: DefaultColors.mediumLightGrey,
                  width: 1,
                  thickness: 1,
                  lineStyle: DividerLineStyle.dashed,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Text(
                        widget.poster.category == PosterCategory.apartment
                            ? 'طبقه'
                            : 'طبقات',
                        style: headerStyle),
                    const SizedBox(height: 8),
                    Builder(builder: (context) {
                      final String text;
                      if (widget.poster.category == PosterCategory.apartment) {
                        text = widget.poster.floor.toString().toPersianNumber();
                      } else if (widget.poster.floor == 2) {
                        text = 'دوبلکس';
                      } else {
                        text =
                            '${widget.poster.floor.toString().toPersianNumber()} طبقه';
                      }

                      return Text(
                        text,
                        style: dataStyle,
                        textAlign: TextAlign.center,
                      );
                    }),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(
                height: 48,
                child: StyledVerticalDivider(
                  color: DefaultColors.mediumLightGrey,
                  width: 1,
                  thickness: 1,
                  lineStyle: DividerLineStyle.dashed,
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    const Text('توضاحات', style: headerStyle),
                    const SizedBox(height: 8),
                    Text(
                      widget.poster.yearOfConstruction
                          .toString()
                          .toPersianNumber(),
                      style: dataStyle,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'موقیعیت مکانی',
          image: AssetImage('assets/images/map_icon.png'),
        ),
        const SizedBox(height: 24),
        const GeoLocation(text: 'گرگان صیاد شیرازی'),
      ],
    );
  }
}

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({
    super.key,
    required this.tabs,
    required this.duration,
    required this.index,
    required this.onChanged,
  });

  final List<String> tabs;
  final Duration duration;
  final int index;
  final void Function(int index) onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      clipBehavior: Clip.none,
      child: Row(
        children: [
          for (int i = 0; i < tabs.length; i++) ...[
            if (i > 0) const SizedBox(width: 16),
            TweenAnimationBuilder(
              duration: duration,
              tween: Tween<double>(
                  begin: index == i ? 0 : 1, end: index == i ? 1 : 0),
              builder: (context, value, child) => TextButton(
                style: TextButton.styleFrom(
                  minimumSize: Size.zero,
                  backgroundColor: Color.lerp(
                    DefaultColors.white,
                    DefaultColors.red,
                    value,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(4)),
                    side: BorderSide(
                      color: Color.lerp(
                        DefaultColors.veryLightGrey,
                        Colors.transparent,
                        value,
                      )!,
                    ),
                  ),
                ),
                onPressed: () {
                  if (index != i) onChanged(i);
                },
                child: Text(
                  tabs[i],
                  style: TextStyle(
                    fontFamily: DefaultFonts.regular,
                    fontSize: 14,
                    color: Color.lerp(
                      DefaultColors.red,
                      DefaultColors.white,
                      value,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

// class TabBarDelegate extends SliverPersistentHeaderDelegate {
//   final Widget child;

//   const TabBarDelegate(this.child);

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     return child;
//   }

//   @override
//   double get maxExtent => 39;

//   @override
//   double get minExtent => 39;

//   @override
//   bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
//       false;
// }
