import 'package:flutter/material.dart';
import 'package:flutter_full_learn/core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({super.key});
  final imageUrl = 'https://picsum.photos/200/300';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                //title: Text('My Card')
                //title: Image.network(imageUrl, height: 100, fit: BoxFit.cover,),
                title: RandomImage(),
                //contentPadding: EdgeInsets.zero,
                onTap: () {},
                subtitle: Text("How do you use your card"),
                leading: Icon(Icons.money),
                trailing: Icon(Icons.chevron_right),
              ),
            ),
          )
        ],
      ),  
    );
  }
}

