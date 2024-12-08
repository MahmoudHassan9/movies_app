import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/app_assets.dart';
import 'package:movies_app/presentation/tabs/search/view/search_view.dart';
import 'package:movies_app/presentation/tabs/watch_list/view/watch_list_view.dart';

import '../../tabs/browse/view/browes_view.dart';
import '../../tabs/home/view/home_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = const [
    HomeView(),
    SearchView(),
    BrowesView(),
    WatchListView(),
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavBar(),
        body: tabs[currentIndex],
      ),
    );
  }

  Widget buildBottomNavBar() => BottomNavigationBar(
    onTap: (index) {
      currentIndex = index;
      setState(() {});
    },
    currentIndex: currentIndex,
    items: const [
      BottomNavigationBarItem(
        label: 'HOME',
        icon: ImageIcon(
          AssetImage(
            AppAssets.homeIcon,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'SEARCH',
        icon: ImageIcon(
          AssetImage(
            AppAssets.searchIcon,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'BROWSE',
        icon: ImageIcon(
          AssetImage(
            AppAssets.browseIcon,
          ),
        ),
      ),
      BottomNavigationBarItem(
        label: 'WATCHLIST',
        icon: ImageIcon(
          AssetImage(
            AppAssets.watchListIcon,
          ),
        ),
      ),
    ],
  );
}
