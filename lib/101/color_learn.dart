import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: Column(
        children: [
          Container(
            
            child: Text('data',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Theme.of(context).hoverColor,),
          )),
        ],
      ),
    );
  }
}

class ColorItems {
  static const Color porchse = Color(0xffEDBF61);
  static const Color sulu = Color.fromRGBO(198, 237, 97, 1);
}