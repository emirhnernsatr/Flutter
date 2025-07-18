import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoteDemos extends StatelessWidget {
  const NoteDemos({super.key});
  final _title = "Create your firt note";
  final _description = "Add a note ";
  final _createNote = "Create a Note";
  final _importNote = "Import Note";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
       ),
      body: Padding(
        padding: PaddingItems.horizontalPadding,
        child: Column(
          children: [
            PngImage(name: ImageItems().appleWithBook),
            _TitleWidget(title: _title),
           Padding(
             padding: PaddingItems.verticalPadding,
             child: _TitleWidget2(title2: _description * 8,),
           ),
           const Spacer(),
           ElevatedButton(onPressed: () {}, 
           child:  SizedBox(height: 50, child:Center( child: Text(_createNote, 
           style: Theme.of(context).textTheme.headlineMedium 
           )))),

           TextButton(onPressed: () {}, 
           child: Text(_importNote, style:Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.black))),
           const SizedBox(height: 50,),
          ],
         ),
      ),
    );
  }
}

class _TitleWidget2 extends StatelessWidget {
  const _TitleWidget2({required this.title2});
final String title2;
  @override
  Widget build(BuildContext context) {
    return Text(
      title2,
      textAlign: TextAlign.center, 
      style: Theme.of(context).textTheme.headlineSmall?.
      copyWith(color: Colors.black, fontWeight: FontWeight.w300),
      );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget ({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headlineLarge?.
      copyWith(color: Colors.black, fontWeight: FontWeight.w500),
      
      );
  }
}

class PaddingItems {
  static const EdgeInsets horizontalPadding = EdgeInsets.symmetric(horizontal: 20);
  static const EdgeInsets verticalPadding = EdgeInsets.symmetric(vertical: 10);  
}

class ImageItems {
  final String appleWithBook = "assets/apple_with_book.webp";
}

class PngImage extends StatelessWidget {
  const PngImage({super.key,required this.name });
  final String name ;

  @override
  Widget build(BuildContext context) {
    return Image.asset(_PngImagePath, fit: BoxFit.cover,);
  }

  String get _PngImagePath => "assets/apple_with_book.webp";
}

