import 'package:divar/constants.dart';
import 'package:divar/extensions.dart';
import 'package:divar/widgets/custom_input_field.dart';
import 'package:divar/widgets/geo_location.dart';
import 'package:divar/widgets/visibility_switcher.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../elements/poster.dart';
import '../widgets/common_widgets.dart';

class AddAvizScreen extends StatefulWidget {
  const AddAvizScreen({super.key});

  @override
  State<AddAvizScreen> createState() => _AddAvizScreenState();
}

class _AddAvizScreenState extends State<AddAvizScreen> {
  int _currentSteps = 0;
  PosterCategory? _category;
  bool _parking = false;
  bool _elevator = true;
  bool _storageRoom = true;
  bool _activateChat = false;
  bool _activateCall = true;
  bool _showLocation = true;

  late final _floorController = TextEditingController(text: '۱')
    ..addListener(() {
      setState(() {});
    });
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _roomCountController = TextEditingController(text: '۱');
  final _meterageController = TextEditingController(text: '۵۰');
  final _yearOfConstructionController = TextEditingController(text: '۱۴۰۰');

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: LayoutBuilder(
            builder: (context, constraints) => IndexedStack(
              index: _currentSteps,
              children: [
                _step1(),
                _step2(),
                _step3(),
                _step4(),
                _step5(),
              ],
            ),
          ),
        ),
        appBar: _appBar(),
      ),
    );
  }

  Widget _step5() {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'تصویر آویز',
          image: AssetImage('assets/images/camera.png'),
        ),
        const SizedBox(height: 24),
        AspectRatio(
          aspectRatio: 2.14375,
          child: DottedBorder(
            color: DefaultColors.mediumLightGrey,
            dashPattern: const [7, 6],
            strokeWidth: 1.5,
            radius: const Radius.circular(4),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'لطفا تصویر آویز خود را بارگذاری کنید',
                    style: TextStyle(
                      fontFamily: DefaultFonts.regular,
                      fontSize: 14,
                      color: DefaultColors.darkGrey,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 40,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsetsDirectional.only(
                            start: 8, end: 16, top: 8, bottom: 8),
                      ),
                      onPressed: () {},
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              child: Padding(
                                padding: EdgeInsetsDirectional.only(end: 12),
                                child: Image(
                                  width: 24,
                                  image: AssetImage(
                                      'assets/images/document_upload.png'),
                                ),
                              ),
                            ),
                            TextSpan(text: 'انتخاب تصویر'),
                          ],
                        ),
                        style: TextStyle(
                          fontFamily: DefaultFonts.regular,
                          fontSize: 16,
                          color: DefaultColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'عنوان آویز',
          image: AssetImage('assets/images/edit_underline_icon.png'),
        ),
        const SizedBox(height: 24),
        CustomField.text(
          hintText: 'عنوان آویز را وارد کنید',
          controller: _titleController,
        ),
        const SizedBox(height: 24),
        const TitleWidget(
          title: 'توضیحات',
          image: AssetImage('assets/images/clipboard_text.png'),
        ),
        const SizedBox(height: 32),
        CustomField.longText(
          hintText: 'عنوان آویز را وارد کنید',
          controller: _descriptionController,
        ),
        const SizedBox(height: 32),
        SwitchItem(
          title: 'فعال کردن گفتگو',
          value: _activateChat,
          onChanged: (value) => setState(() => _activateChat = value),
        ),
        const SizedBox(height: 16),
        SwitchItem(
          title: 'فعال کردن تماس',
          value: _activateCall,
          onChanged: (value) => setState(() => _activateCall = value),
        ),
        const SizedBox(height: 40),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
            onPressed: () {
              setState(() {
                _currentSteps = 0;
              });
            },
            child: const Text('ثبت آگهی'),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _step4() {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'موقعیت مکانی',
          image: AssetImage('assets/images/map_icon.png'),
        ),
        const SizedBox(height: 32),
        const Text(
          'بعد انتخاب محل دقیق روی نقشه میتوانید نمایش آن را فعال یا غیر فعال کید تا حریم خصوصی شما خفظ شود.',
          style: TextStyle(
            fontSize: 14,
            fontFamily: DefaultFonts.regular,
            color: DefaultColors.darkGrey,
          ),
        ),
        const SizedBox(height: 32),
        const GeoLocation(text: 'گرگان، صیاد شیرازی'),
        const SizedBox(height: 32),
        SwitchItem(
          title: 'موقعیت دقیق نقشه نمایش داده شود؟',
          value: _showLocation,
          onChanged: (value) => setState(() => _showLocation = value),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
            onPressed: () {
              setState(() {
                _currentSteps++;
              });
            },
            child: const Text('بعدی'),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _step3() {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'انتخاب دسته بندی آویز',
          image: AssetImage('assets/images/category_icon.png'),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: CustomField<PosterCategory>.dropDown(
                titleText: 'دسته بندی',
                items: PosterCategory.values
                    .map(
                      (e) => DropdownMenuItem<PosterCategory>(
                        value: e,
                        child: Text(
                          'فروش ${e.value}',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontFamily: DefaultFonts.regular,
                            fontSize: 16,
                            color: DefaultColors.veryDarkGrey
                          ),
                        ),
                      ),
                    )
                    .toList(),
                selectedValue: _category,
                onSelected: (value) => setState(() => _category = value),
              ),
            ),
            const SizedBox(width: 25),
            const Expanded(
              child: CustomField.text(
                titleText: 'محدوده ملک',
                hintText: 'خیابان صیاد شیرازی',
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'ویژگی ها',
          image: AssetImage('assets/images/options_logo.png'),
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
              child: CustomField.number(
                controller: _meterageController,
                titleText: 'متراژ',
                incrementCount: 50,
                min: 1,
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: CustomField.number(
                controller: _roomCountController,
                titleText: 'تعداد اتاق',
                initialValue: '6',
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
              child: CustomField.number(
                controller: _floorController,
                min: 1,
                titleText: _category == PosterCategory.apartment
                    ? 'طبقه'
                    : 'تعداد طبقات',
              ),
            ),
            const SizedBox(width: 25),
            Expanded(
              child: CustomField.number(
                controller: _yearOfConstructionController,
                titleText: 'سال ساخت',
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        const Divider(),
        const SizedBox(height: 32),
        const TitleWidget(
          title: 'امکانات',
          image: AssetImage('assets/images/magicpen.png'),
        ),
        const SizedBox(height: 24),
        Builder(builder: (context) {
          final enabled = _category == PosterCategory.apartment ||
              (int.tryParse(_floorController.text.toRegularNumber()) ?? 0) > 1;

          return SwitchItem(
            title: 'آسانسور',
            value: enabled ? _elevator : false,
            onChanged:
                enabled ? (value) => setState(() => _elevator = value) : null,
          );
        }),
        const SizedBox(height: 27),
        SwitchItem(
          title: 'پارکینگ',
          value: _parking,
          onChanged: (value) => setState(() => _parking = value),
        ),
        const SizedBox(height: 27),
        SwitchItem(
          title: 'انباری',
          value: _storageRoom,
          onChanged: (value) => setState(() => _storageRoom = value),
        ),
        const SizedBox(height: 35),
        SizedBox(
          width: double.infinity,
          height: 40,
          child: TextButton(
            onPressed: () {
              setState(() {
                _currentSteps++;
              });
            },
            child: const Text('بعدی'),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _step2() {
    onTap(PosterCategory category) {
      return () {
        _category = category;
        setState(() {
          _currentSteps++;
        });
      };
    }

    const style = TextStyle(
        fontFamily: DefaultFonts.regular,
        color: DefaultColors.veryDarkGrey,
        fontSize: 16);

    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 32),
        for (int i = 0; i < PosterCategory.values.length; i++) ...[
          ClickItem(
            style: style,
            title: 'فروش ${PosterCategory.values[i].value}',
            onTap: onTap(PosterCategory.values[i]),
          ),
          if (i < PosterCategory.values.length - 1) const SizedBox(height: 16),
        ],
      ],
    );
  }

  Widget _step1() {
    void onTap() {
      setState(() {
        _currentSteps++;
      });
    }

    const style = TextStyle(
        fontFamily: DefaultFonts.regular,
        color: DefaultColors.veryDarkGrey,
        fontSize: 16);

    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 32),
        ClickItem(
          style: style,
          title: 'اجاره مسکونی',
          onTap: onTap,
        ),
        const SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'فروش مسکونی',
          onTap: onTap,
        ),
        const SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'فروش دفاتر اداری و تجاری',
          onTap: onTap,
        ),
        const SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'اجاره دفاتر اداری و تجاری',
          onTap: onTap,
        ),
        const SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'اجاره کوتاه مدت',
          onTap: onTap,
        ),
        const SizedBox(height: 16),
        ClickItem(
          style: style,
          title: 'پروژه های ساخت و ساز',
          onTap: onTap,
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      bottom: PreferredSize(
        preferredSize: const Size(double.infinity, 4),
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: _currentSteps / 5),
          duration: const Duration(milliseconds: 200),
          builder: (context, value, child) {
            return LinearProgressIndicator(
              value: value,
              backgroundColor: Colors.transparent,
              color: DefaultColors.red,
            );
          },
        ),
      ),
      leading: VisibilitySwitcher(
        visibile: _currentSteps <= 0,
        builder: (child, value, isHiding) => Transform.translate(
          offset: Offset(50 * value, 0),
          child: child,
        ),
        child: IconButton(
          splashRadius: 24,
          onPressed: () {
            setState(() {
              _currentSteps--;
            });
          },
          icon: const Image(
            width: 24,
            image: AssetImage('assets/images/arrow_right_icon.png'),
          ),
        ),
      ),
      actions: [
        VisibilitySwitcher(
          visibile: _currentSteps <= 0,
          builder: (child, value, isHiding) => Transform.translate(
            offset: Offset(-50 * value, 0),
            child: child,
          ),
          child: IconButton(
            splashRadius: 24,
            onPressed: () {
              setState(() {
                _currentSteps = 0;
              });
            },
            icon: const Icon(
              Icons.close,
              color: DefaultColors.veryDarkGrey,
              size: 24,
            ),
          ),
        ),
        const SizedBox(width: 8),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text.rich(
        TextSpan(
          text: 'دسته بدنی',
          children: [
            WidgetSpan(
              alignment: PlaceholderAlignment.middle,
              child: Image(
                width: 28,
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
        textDirection: TextDirection.rtl,
      ),
    );
  }
}
