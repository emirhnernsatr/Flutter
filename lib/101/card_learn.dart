import 'package:flutter/material.dart';

class CardLearn extends StatelessWidget {
  const CardLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const _CostomCard(
          child:  SizedBox(
            height: 100,
            width: 300,
            child: Center(child: Text('data'),),
          )),
          const _CostomCard(
          child:  SizedBox(
            height: 100,
            width: 300,
            child: Center(child: Text('data'),),
          )),
        ],
      ),
    );
  }
}

class _CostomCard extends StatelessWidget {
  const _CostomCard({Key? key, required this.child}) : super(key: key);
  final Widget child; 
  
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: ProjectMargins.cardMargin,
      //color: Colors.white,
      child: child ,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    );
  }
}

class ProjectMargins {
  static const cardMargin = EdgeInsets.all(10);
}



// Borders
// StadiumBorder(),
// CircleBorder(), 
// RoundedRectangleBorder(),