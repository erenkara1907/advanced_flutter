import 'package:flutter/material.dart';
import 'feed_view.dart';

class TabbarAdvanceLearn extends StatefulWidget {
  const TabbarAdvanceLearn({Key? key}) : super(key: key);
  @override
// ignore: library_private_types_in_public_api
  _TabbarAdvanceLearnState createState() => _TabbarAdvanceLearnState();
}

class _TabbarAdvanceLearnState extends State<TabbarAdvanceLearn>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final double _nothedValue = 10;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _MyTabViews.values.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length,
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          },
        ),
        bottomNavigationBar: BottomAppBar(
          notchMargin: _nothedValue,
          child: _myTabView(),
        ),
        appBar: AppBar(),
        body: _tabbarView(),
      ),
    );
  }

  TabBar _myTabView() {
    return TabBar(
      padding: EdgeInsets.zero,
      onTap: (int index) {},
      controller: _tabController,
      tabs: _MyTabViews.values
          .map((e) => Tab(
                text: e.name,
              ))
          .toList(),
    );
  }

  TabBarView _tabbarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: const [
        FeedView(),
        Text('Settings'),
        Text('Favorite'),
        Text('Profile'),
      ],
    );
  }
}

enum _MyTabViews { home, settings, favorite, profile }
