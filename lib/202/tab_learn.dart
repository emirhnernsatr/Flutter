import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/icon_learn.dart';
import 'package:flutter_full_learn/101/image_Learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({super.key});

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;

 @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _MyTabViews.values.length, 
      child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(onPressed: () {
        _tabController.animateTo(_MyTabViews.home.index);
      }),
      bottomNavigationBar: BottomAppBar(
       
        notchMargin: 10, 
        shape: CircularNotchedRectangle(),
        child: _myTabView(),
      ),
      appBar: AppBar(
        bottom: TabBar(
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}',)).toList() 
        ),
      ),

      body: _tabbarView(),
    ));
  }

  TabBar _myTabView() {
    return TabBar(
        indicatorColor: Colors.white,
        //isScrollable: true,
        labelColor: Colors.green,
        unselectedLabelColor: Colors.red,
        padding: EdgeInsets.zero,
        onTap: (int index){},
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: '${e.name}',)).toList() );
  }

  TabBarView _tabbarView() {
    return TabBarView(
    physics: NeverScrollableScrollPhysics(),
    controller: _tabController,
    children: [
      ImageLearn(), 
      IconsLearnView(),
      ImageLearn(), 
      IconsLearnView()
    ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {
}
