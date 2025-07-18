import 'package:flutter/material.dart';

class ScaffoldLearnView extends StatelessWidget {
  const ScaffoldLearnView({super.key});

 @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Scaffold samples')),
    body: const Text('merhaba'),
    backgroundColor: Colors.blue,
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(context: context, builder: (context) => Container(height: 200,));
      },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: const Drawer(),
      bottomSheet: const Text('data'),
    bottomNavigationBar: BottomNavigationBar(items: const [
      BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label: 'a'),
      BottomNavigationBarItem(icon: Icon(Icons.abc_outlined),label: 'b'),
    ])
  );
  }
}