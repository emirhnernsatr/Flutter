import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({super.key});
   final String title = "Food";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(width: MediaQuery.of(context).size.width, 
            child: CustomFootButton(title:  title, onPressed: (){})),
            )),
          SizedBox(height: 200,),
          Center(
            child: CustomFootButton(title:  title, onPressed: (){})),


        ],
        ),
      );
  }
}

class _ColorsUltility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

class _PaddingUtility {
  final EdgeInsets padding = EdgeInsets.all(8.0);
  final EdgeInsets padding2x = EdgeInsets.all(16.0);
}

class CustomFootButton extends StatelessWidget {
  CustomFootButton({super.key, required this.title , required this.onPressed});
  final _ColorsUltility colorsUltility = _ColorsUltility();
  final String title;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: _ColorsUltility().redColor, shape: const StadiumBorder()),
          onPressed: onPressed, 
          child: Padding(
            padding: _PaddingUtility().padding,
            child: Text(title ,
            style:  Theme.of(context).textTheme.headlineSmall?.
            copyWith(color: _ColorsUltility().whiteColor, fontWeight: FontWeight.bold),
            ),
          ),);
  }
}