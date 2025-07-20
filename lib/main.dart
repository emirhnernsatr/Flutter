import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/secure_context/secure_context_learn.dart';
import 'package:flutter_learn/202/cache/shared_list_cache.dart';
import 'package:flutter_learn/202/theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: LightTheme().theme,
      /*
      ThemeData.dark().copyWith(
        // hoverColor: ColorItems.sulu,
        listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          systemOverlayStyle:  SystemUiOverlayStyle.light,
         // backgroundColor: Colors.transparent-, 
          elevation: 0,
        )),
        */ 
      home:  SecureContextLearn(),
    ); 
  }                            
} 
