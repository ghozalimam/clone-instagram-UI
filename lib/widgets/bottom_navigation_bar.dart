import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/screens/home_screen.dart';
import 'package:instagram_clone/screens/profile.dart';
import 'package:instagram_clone/screens/search.dart';
import 'package:instagram_clone/screens/reels.dart';
import 'package:instagram_clone/screens/upload.dart';

class BottomTabs extends StatefulWidget {
  const BottomTabs({Key? key}) : super(key: key);

  @override
  State<BottomTabs> createState() => _BottomTabsState();
}

class _BottomTabsState extends State<BottomTabs> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const SearchScreen(),
    const UploadScreen(),
    const ReelsScreen(),
    const ProfilePage() // Add this line to connect to ProfileScreen
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 0
                  ? 'assets/vectors/home-bold.svg'
                  : 'assets/vectors/home-outline.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 1
                  ? 'assets/vectors/search-bold.svg'
                  : 'assets/vectors/search-outline.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 2
                  ? 'assets/vectors/add-square-bold.svg'
                  : 'assets/vectors/add-square-outline.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(_selectedIndex == 3
                  ? 'assets/vectors/video-play-bold.svg'
                  : 'assets/vectors/video-play-outline.svg'),
              label: ''),
          BottomNavigationBarItem(
              icon: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile.png')),
                    shape: BoxShape.circle),
              ),
              label: ''),
        ],
      ),
    );
  }
}
