import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn/101/app_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {,
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // hoverColor: ColorItems.sulu,
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle:  SystemUiOverlayStyle.light,
         // backgroundColor: Colors.transparent-, 
          elevation: 0,
        )
      ), 
      home:  AppBarLearnView(),
    );
  }                            
} 


