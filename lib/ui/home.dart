import 'package:assignment/configs/colors.dart';
import 'package:assignment/ui/profile.dart';
import 'package:assignment/ui/more.dart';
import 'package:assignment/ui/posts/posts.dart';
import 'package:assignment/utils/string_helper.dart';
import 'package:flutter/material.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<HomeWidget> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    PostsWidget(),
    const ProfileWidget(),
    const MoreWidget(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(localized()?.appTitle ?? ""),
        titleTextStyle: const TextStyle(
            color: AppColors.secondary,
            fontWeight: FontWeight.w700,
            fontSize: 20),
        centerTitle: true,
        backgroundColor: AppColors.primary,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home), label: localized()?.posts ?? ""),
          BottomNavigationBarItem(
              icon: const Icon(Icons.account_circle),
              label: localized()?.tab1 ?? ""),
          BottomNavigationBarItem(
              icon: const Icon(Icons.more_horiz_sharp),
              label: localized()?.tab2 ?? ""),
        ],
        selectedItemColor: AppColors.secondary,
        unselectedItemColor: Colors.white,
        selectedIconTheme: const IconThemeData(size: 35),
        backgroundColor: AppColors.primary,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _widgetOptions[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
