import 'package:flutter/material.dart';

class ColorsLearnView extends StatefulWidget {
  const ColorsLearnView({Key? key, required this.initialColor,}) : super(key: key);
  final Color? initialColor;

  @override
  State<ColorsLearnView> createState() => _ColorsLearnViewState();
}

class _ColorsLearnViewState extends State<ColorsLearnView> {
Color? _backgroundColor; 

@override
  void initState() {
    super.initState();
    _backgroundColor = widget.initialColor ?? Colors.transparent;
  }

  @override
  void didUpdateWidget(covariant ColorsLearnView oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(oldWidget.initialColor != _backgroundColor && widget.initialColor != null){
      changeBackgroundColor(widget.initialColor!);
    }
  }


void changeBackgroundColor(Color color){
  setState(() {
    _backgroundColor = color;
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
      onTap: _colorOnTap,
      items: [
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red,), label: 'Red'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue,), label: 'Blue'),
        BottomNavigationBarItem(icon: _ColorContainer(color: Colors.yellow,), label: 'Yellow'),
      ]),
    );
  }

  void _colorOnTap (int value){
    if(value == _MyColor.red.index){changeBackgroundColor(Colors.red);}
    else if (value == _MyColor.blue.index){changeBackgroundColor(Colors.yellow);}
    else if(value == _MyColor.yellow.index){changeBackgroundColor(Colors.blue);}
  }
}

enum _MyColor {red, yellow, blue}

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({Key? key, required this.color}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(color: color, width: 10, height: 10,);
  }
}