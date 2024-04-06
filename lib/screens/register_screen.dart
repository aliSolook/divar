import 'package:divar/constants.dart';
import 'package:divar/screens/singing_screen.dart';
import 'package:divar/screens/singup_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: _images(context),
          ),
          Expanded(
            child: _content(context),
          ),
        ],
      ),
    );
  }

  Widget _images(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/register_screen_background.png'),
        ),
        Image(
          width: MediaQuery.sizeOf(context).width * .65,
          image: const AssetImage('assets/images/register_screen_image.png'),
        ),
      ],
    );
  }

  Widget _content(BuildContext context) {
    const text =
        'در آویز ملک خود را برای فروش،اجاره و رهن آگهی کنید و یا اگر دنبال ملک با مشخصات دلخواه خود هستید آویز ها را ببینید';
    return Column(
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'اینجا محل '),
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Image(
                  height: 26,
                  image: AssetImage('assets/images/aviz_text_logo.png'),
                ),
              ),
              TextSpan(text: ' آگهی شماست'),
            ],
          ),
          style: TextStyle(
            fontFamily: DefaultFonts.bold,
            fontSize: 16,
            color: DefaultColors.veryDarkGrey
          ),
          textAlign: TextAlign.center,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 35, right: 35, top: 16),
          child: Text(
            text,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: DefaultColors.darkGrey,
              fontFamily: DefaultFonts.regular,
            ),
          ),
        ),
        const Spacer(),
        _dots(),
        const SizedBox(height: 32),
        _buttons(context),
        const SizedBox(height: 22),
      ],
    );
  }

  Widget _buttons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SgininScreen(),
              ),
            );
          },
          child: const Text('ورود',
              style: TextStyle(fontSize: 16, fontFamily: DefaultFonts.regular)),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SginupScreen(),
              ),
            );
          },
          child: const Text('ثبت نام',
              style: TextStyle(fontSize: 16, fontFamily: DefaultFonts.regular)),
        ),
      ],
    );
  }

  Widget _dots() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox.square(
          dimension: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(9999999999),
            ),
            child: ColoredBox(color: DefaultColors.lightGrey),
          ),
        ),
        SizedBox(width: 4),
        SizedBox(
          width: 16,
          height: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(9999999999),
            ),
            child: ColoredBox(color: DefaultColors.red),
          ),
        ),
        SizedBox(width: 4),
        SizedBox.square(
          dimension: 6,
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(9999999999),
            ),
            child: ColoredBox(color: DefaultColors.lightGrey),
          ),
        ),
      ],
    );
  }
}
