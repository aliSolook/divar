import 'package:divar/screens/main_screen.dart';
import 'package:divar/screens/singup_screen.dart';
import 'package:divar/widgets/count_down.dart';
import 'package:divar/widgets/splitted_number_filed.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import '../widgets/hyper_text.dart';

class SgininScreen extends StatefulWidget {
  const SgininScreen({super.key});

  @override
  State<SgininScreen> createState() => _SgininScreenState();
}

class _SgininScreenState extends State<SgininScreen> {
  int _currentStep = 0;
  final _countDownController = CountDownController();

  Widget _step2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'تایید شماره موبایل',
          style: TextStyle(
            fontFamily: DefaultFonts.bold,
            fontSize: 16,
            color: DefaultColors.veryDarkGrey,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'کد ورود پیامک شده را وارد کنید',
          style: TextStyle(
            fontSize: 14,
            fontFamily: DefaultFonts.regular,
            color: DefaultColors.darkGrey,
          ),
        ),
        const SizedBox(height: 32),
        const SplittedNumberField(
          count: 4,
          decoration: BoxDecoration(
            color: DefaultColors.lightGrey,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          emptyDecoration: BoxDecoration(
            color: DefaultColors.veryLightGrey,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          style: TextStyle(
            fontFamily: DefaultFonts.medium,
            fontSize: 16,
            color: DefaultColors.veryDarkGrey,
          ),
        ),
        const SizedBox(height: 32),
        CountDown(
          controller: _countDownController,
          duration: const Duration(seconds: 45),
          unfinishedState: const CountDownState(
            trailingText: 'ارسال مجدد کد',
            trailingGap: 4,
            trailingStyle: TextStyle(
                fontFamily: DefaultFonts.medium,
                fontSize: 14,
                color: DefaultColors.grey),
            style: TextStyle(
              fontFamily: DefaultFonts.medium,
              fontSize: 18,
              color: DefaultColors.veryDarkGrey,
            ),
          ),
          finishedState: CountDownState(
            trailingGap: 4,
            trailing: HyperText(
              text: 'ارسال مجدد کد',
              onTap: () {},
              style: const TextStyle(
                fontFamily: DefaultFonts.medium,
                fontSize: 14,
                color: DefaultColors.veryDarkGrey,
              ),
              hoverStyle: const TextStyle(
                fontFamily: DefaultFonts.medium,
                fontSize: 14,
                color: DefaultColors.veryDarkGrey,
                decoration: TextDecoration.underline,
              ),
            ),
            style: const TextStyle(
              fontFamily: DefaultFonts.medium,
              fontSize: 18,
              color: DefaultColors.grey,
            ),
          ),
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ),
              (route) => false,
            );
          },
          child: const Text(
            'تایید ورود',
            style: TextStyle(
              fontSize: 16,
              fontFamily: DefaultFonts.medium,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _step1() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            text: 'ورود به ',
            children: [
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Image(
                  height: 26,
                  image: AssetImage('assets/images/aviz_text_logo.png'),
                ),
              ),
            ],
          ),
          style: TextStyle(
            fontFamily: DefaultFonts.bold,
            fontSize: 16,
            color: DefaultColors.veryDarkGrey,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'خوشحالیم که مجددا آویز رو برای آگهی انتخاب کردی!',
          style: TextStyle(
            fontSize: 14,
            fontFamily: DefaultFonts.regular,
            color: DefaultColors.darkGrey,
          ),
        ),
        const SizedBox(height: 32),
        const TextField(
          decoration: InputDecoration(
            labelText: 'شماره موبایل',
          ),
        ),
        const Spacer(),
        TextButton(
          style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 50)),
          onPressed:  () {
            setState(() {
              _currentStep++;
            });

            _countDownController.start();
          },
          child: const Text.rich(
            TextSpan(
              text: 'مرحله بعد',
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Image(
                      width: 24,
                      image: AssetImage('assets/images/arrow_left_icon.png'),
                    ),
                  ),
                ),
              ],
            ),
            style: TextStyle(
              fontSize: 16,
              fontFamily: DefaultFonts.medium,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: Text.rich(
              TextSpan(
                text: 'تاحالا ثبت نام نکردی؟ ',
                children: [
                  WidgetSpan(
                    child: HyperText(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SginupScreen(),
                          ),
                        );
                      },
                      text: 'ثبت نام',
                      style: const TextStyle(
                        fontFamily: DefaultFonts.medium,
                        decoration: TextDecoration.none,
                        color: DefaultColors.red,
                      ),
                      hoverStyle: const TextStyle(
                        fontFamily: DefaultFonts.medium,
                        decoration: TextDecoration.underline,
                        color: DefaultColors.red,
                      ),
                    ),
                  ),
                ],
              ),
              style: const TextStyle(
                fontFamily: DefaultFonts.medium,
                fontSize: 14,
                color: DefaultColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      // toolbarHeight: 40,
      elevation: 0,
      leading: IconButton(
        splashRadius: 24,
        onPressed: () {
          if (_currentStep == 0) {
            Navigator.pop(context);
          } else {
            setState(() {
              _currentStep--;
            });

            _countDownController.stop();
          }
        },
        icon: Transform.flip(
          flipX: true,
          child: const Image(
            width: 24,
            image: AssetImage('assets/images/arrow_left_red_icon.png'),
          ),
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
        body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
          child: IndexedStack(
            index: _currentStep,
            children: [_step1(), _step2()],
          ),
        ),
      ),
    );
  }
}
