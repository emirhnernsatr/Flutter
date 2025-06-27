import 'package:flutter/material.dart';

class IconsLearnView extends StatelessWidget {
   IconsLearnView({Key? key}) : super(key: key);
  final IconSizes iconSize = IconSizes(); 
  final IconsColors iconColors = IconsColors(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title:  const Text('Hello'),),
     body: Column(
      children: [
        IconButton(
        onPressed: () {}, 
        icon:  Icon(
          Icons.message_outlined,
          color: Colors.red,
          size: IconSizes.iconSmall2x,
          )),
       IconButton(
        onPressed: () {}, 
        icon:  Icon(
          Icons.message_outlined,
          color: IconsColors().froly,
          size: 30,
          )),

           IconButton(
        onPressed: () {}, 
        icon:  Icon(
          Icons.message_outlined,
          color: Colors.red,
          size: IconSizes().iconSmall,
          )),
      ],
     ),
    );    
  }
}

class IconSizes {
  final double iconSmall = 40;
  static const double iconSmall2x = 80;
}

class IconsColors {
  final Color froly = Color(0xffED617F);
}