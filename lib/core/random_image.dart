import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({Key? key, this.heigth = 100}) : super(key: key);
  final imageUrl = 'https://picsum.photos/200/300';
  final double heigth;
  
  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl, height: heigth, fit: BoxFit.cover,);
  }
}