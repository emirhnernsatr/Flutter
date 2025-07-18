import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ImagePaths.apple_with_book.toWidget(
        height: 200,
      ),
      // Image.asset(ImagePaths.apple_with_book.path()  /*'assets/apple_with_book.webp'*/)
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  apple_with_book
  }

  extension ImagePathEnumExtension on ImagePaths {
    String  path() {
      return 'assets/$name.webp';
      }

    Widget toWidget({double height = 24}){
      return Image.asset(path(), height: height, );
      }
      
  }

