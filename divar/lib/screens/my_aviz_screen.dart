import 'package:divar/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/common_widgets.dart';

class MyAvizScreen extends StatelessWidget {
  const MyAvizScreen({super.key});

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: const Image(
        height: 32,
        image: AssetImage('assets/images/my_aviz_logo.png'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: _appBar(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 32),
            const TextField(
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
            const SizedBox(height: 32),
            const TitleWidget(
              title: 'حساب کاربری',
              image: AssetImage('assets/images/profile_icon.png'),
            ),
            const SizedBox(height: 32),
            _profileContainer,
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 32),
            _buttons(),
            const SizedBox(height: 32),
            const Center(
              child: Text(
                'نسخه\n۱.۵.۹',
                style: TextStyle(
                  fontFamily: DefaultFonts.regular,
                  fontSize: 14,
                  color: DefaultColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buttons() {
    const style = TextStyle(
      fontFamily: DefaultFonts.medium,
      fontSize: 16,
      color: DefaultColors.veryDarkGrey,
    );

    return const Column(
      children: [
        ClickItem(
          style: style,
          title: 'آگهی های من',
          image: AssetImage('assets/images/note_icon.png'),
        ),
        SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'پرداخت های من',
          image: AssetImage('assets/images/card_icon.png'),
        ),
        SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'بازدید های اخیر',
          image: AssetImage('assets/images/eye_icon.png'),
        ),
        SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'ذخیره شده ها',
          image: AssetImage('assets/images/save_icon.png'),
        ),
        SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'تنظیمات',
          image: AssetImage('assets/images/setting_icon.png'),
        ),
        SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'پشتیبانی و قوانین',
          image: AssetImage('assets/images/message_question_icon.png'),
        ),
        SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'درباره آویز',
          image: AssetImage('assets/images/info_circle_icon.png'),
        ),
      ],
    );
  }

  Widget get _profileContainer => DecoratedBox(
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(
            BorderSide(
              color: DefaultColors.mediumLightGrey,
              width: 1,
            ),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          color: DefaultColors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const ClipPath(
                clipper: ShapeBorderClipper(
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                ),
                child: Image(
                  width: 56,
                  height: 56,
                  image: AssetImage('assets/images/profile_pictrue.png'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'علی سلوک',
                          style: TextStyle(
                            fontFamily: DefaultFonts.regular,
                            fontSize: 14,
                            color: DefaultColors.veryDarkGrey,
                          ),
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(9999),
                            ),
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Image(
                                width: 24,
                                image:
                                    AssetImage('assets/images/edit_icon.png'),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 13),
                    Row(
                      children: [
                        const Text(
                          '۰۹۱۹۲۵۵۱۷۳۳',
                          style: TextStyle(
                            fontFamily: DefaultFonts.regular,
                            fontSize: 14,
                            color: DefaultColors.veryDarkGrey,
                          ),
                        ),
                        const SizedBox(width: 8),
                        TextButton(
                          style: TextButton.styleFrom(
                            minimumSize: Size.zero,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                          ),
                          onPressed: () {},
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4),
                            child: Text(
                              'تایید شده',
                              style: TextStyle(
                                fontFamily: DefaultFonts.medium,
                                fontSize: 12,
                                color: DefaultColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
