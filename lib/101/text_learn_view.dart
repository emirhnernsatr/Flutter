import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget{
  const TextLearnView({super.key});
  final String name = 'Eren';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [ 
          Text(
        ('Welcome  $name ${name.length} ' /* + name */),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.right,
        style: const TextStyle(
          wordSpacing: 2,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
          letterSpacing: 2, 
          color:  Colors.lime, 
          fontSize: 16, 
          fontWeight: FontWeight.w600)
          ),
        ]
      )),
    );    
  }
}

