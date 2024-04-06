import 'package:divar/constants.dart';
import 'package:divar/screens/register_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: _CustomScrollBehavior(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        dividerColor: DefaultColors.lightGrey,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: DefaultColors.white,
            backgroundColor: DefaultColors.red,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            minimumSize: const Size(160, 40),
          ),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateColor.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return DefaultColors.red;
            } else {
              return DefaultColors.grey;
            }
          }),
          thumbColor:
              MaterialStateColor.resolveWith((states) => DefaultColors.white),
        ),
        dropdownMenuTheme: const DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            fillColor: DefaultColors.veryLightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(4)),
            ),
            labelStyle: TextStyle(
              fontSize: 16,
              fontFamily: DefaultFonts.medium,
              color: DefaultColors.grey,
            ),
          ),
        ),
        scaffoldBackgroundColor: DefaultColors.white,
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              ),
            ),
            side: const BorderSide(color: DefaultColors.red, width: 1),
            foregroundColor: DefaultColors.red,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            minimumSize: const Size(160, 40),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          fillColor: DefaultColors.veryLightGrey,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          labelStyle: TextStyle(
            fontSize: 16,
            fontFamily: DefaultFonts.medium,
            color: DefaultColors.grey,
          ),
          hintStyle: TextStyle(
            fontFamily: DefaultFonts.medium,
            fontSize: 16,
            color: DefaultColors.grey,
          ),
        ),
      ),
      home: const RegisterScreen(),
      // home: ShowMoreScreen(
      //   posters: Poster.loadPosters().latest,
      //   type: PosterType.latest,
      // ),
    );
  }
}

class _CustomScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}
