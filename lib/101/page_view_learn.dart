import 'package:flutter/material.dart';
import 'package:flutter_learn/101/icon_learn.dart';
import 'package:flutter_learn/101/image_Learn.dart';
import 'package:flutter_learn/101/stack_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({super.key});

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
final _pageController = PageController(viewportFraction: 0.7);

int _currentPageIndex = 0;
void _updatePageIndex(int index){
  setState(() {
    _currentPageIndex = index;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Text(_currentPageIndex.toString()),
          ),
          Spacer(),
          Padding(
            padding:  EdgeInsets.only(right: 10),
            child: FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
              }, 
              child: const Icon(Icons.chevron_left),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
            }, 
            child: const Icon(Icons.chevron_right),
          ),
        ],
      ),
      appBar: AppBar(),
      body: PageView(
        padEnds: false,
        controller: _pageController,
        onPageChanged: _updatePageIndex,
        children: [
          ImageLearn(),
          IconsLearnView(),
          StackLearn(),
        ],
      ),
    );
  }
}

class _DurationUtility {
 static const _durationLow =  Duration(seconds: 1);
 }