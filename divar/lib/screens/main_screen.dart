import 'package:divar/constants.dart';
import 'package:divar/screens/add_poster_screen.dart';
import 'package:divar/screens/my_aviz_screen.dart';
import 'package:divar/screens/poster_screen.dart';
import 'package:divar/screens/search_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _activeIndex,
        children: const [
          MyAvizScreen(),
          AddAvizScreen(),
          SearchScreen(),
          PosterScreen(),
        ],
      ),
      bottomNavigationBar: _navigator(),
    );
  }

  Widget _navigator() {
    return BottomNavigationBar(
      // type: BottomNavigationBarType.fixed,
      selectedItemColor: DefaultColors.red,
      unselectedItemColor: DefaultColors.grey,
      unselectedLabelStyle: const TextStyle(
        fontFamily: DefaultFonts.medium,
        fontSize: 12,
      ),
      showUnselectedLabels: true,
      selectedLabelStyle: const TextStyle(
        fontFamily: DefaultFonts.medium,
        fontSize: 14,
      ),
      currentIndex: _activeIndex,
      onTap: (value) => setState(() => _activeIndex = value),
      items: const [
        BottomNavigationBarItem(
          icon: Image(
            width: 24,
            image: AssetImage('assets/images/profile_circle_icon.png'),
          ),
          activeIcon: Image(
            width: 24,
            image: AssetImage('assets/images/profile_circle_active_icon.png'),
          ),
          label: 'آویز من',
        ),
        BottomNavigationBarItem(
          icon: Image(
            width: 24,
            image: AssetImage('assets/images/add_circle_icon.png'),
          ),
          activeIcon: Image(
            width: 24,
            image: AssetImage('assets/images/add_circle_active_icon.png'),
          ),
          label: 'افزودن آویز',
        ),
        BottomNavigationBarItem(
          icon: Image(
            width: 24,
            image: AssetImage('assets/images/search_icon.png'),
          ),
          activeIcon: Image(
            width: 24,
            image: AssetImage('assets/images/search_active_icon.png'),
          ),
          label: 'جستجو',
        ),
        BottomNavigationBarItem(
          icon: Image(
            width: 24,
            image: AssetImage('assets/images/posters_icon.png'),
          ),
          activeIcon: Image(
            width: 24,
            image: AssetImage('assets/images/posters_active_icon.png'),
          ),
          label: 'آویز آگهی ها',
        ),
      ],
    );
  }
}
