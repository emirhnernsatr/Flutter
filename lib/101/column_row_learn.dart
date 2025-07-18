import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
     body: Column(
          children: [
            // 4+2+2+2
           Expanded(
            flex: 4,
             child: Row(
               children: [
                 Expanded(child:Container(color: Colors.grey,)),
                 Expanded(child:Container(color: Colors.pink,)),
                 Expanded(child:Container(color: Colors.red,)),
                 Expanded(child:Container(color: Colors.blue,)),
               ],
             )),
             const Spacer(flex: 2),
             Expanded(child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('a'),
                Text('a2'),
                Text('a3'),
                ],
             )),
            const Expanded(flex: 2, child: FlutterLogo()),
          ],
      ),
    );
  }
}










/*
Column(
        children: [
          Expanded(child: Row(
            children: [
              Expanded(child:FlutterLogo()),
              Expanded(child:FlutterLogo()),
              Expanded(child:FlutterLogo()),
              Expanded(child:FlutterLogo()),
            ],
          )),
          Expanded(child:FlutterLogo()),
          Expanded(child:FlutterLogo()),
          Expanded(child:FlutterLogo()),
        ],
      ),
*/

/*
Column(
          children: [
           Expanded(
            flex: 4,
             child: Row(
               children: [
                 Expanded(flex: 3, child:Container(color: Colors.grey,)),
                 Expanded(flex: 2, child:Container(color: Colors.pink,)),
                 Expanded(flex: 2, child:Container(color: Colors.red,)),
                 Expanded(flex: 3, child:Container(color: Colors.blue,)),
               ],
             ),
           ),
            Expanded(flex: 2, child:Container(color: Colors.green,)),
            Expanded(flex: 2, child:Container(color: Colors.blue,)),
            Expanded(flex: 2, child:Container(color: Colors.purple,)),
          ],
      ),
*/