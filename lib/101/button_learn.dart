import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton( style: ButtonStyle(backgroundColor: WidgetStateProperty.resolveWith((states){
                 if (states.contains(WidgetState.pressed)){
                  return Colors.red;  
                 }
                 return Colors.green;
          })),
          onPressed: (){}, child: Text('save',style: Theme.of(context).textTheme.titleLarge),
          ),
          ElevatedButton(onPressed: null, child:  const Text('data')
          ),
         IconButton(onPressed: () {}, icon: const Icon(Icons.abc_rounded) 
         ),
         FloatingActionButton(onPressed: () {}, child: const Icon(Icons.add)
         ),
         OutlinedButton(onPressed: () {} , child: const Text('data')
         ),
         InkWell(onTap: () {}, child: const Text('costum')
         ),
        Container(
          height: 100,
          color: Colors.white,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          style:  ElevatedButton.styleFrom(backgroundColor: Colors.black ,
          shape:  const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),), 
          onPressed: () {}, 
          child: Padding(padding: EdgeInsets.only(top: 10, bottom: 10, right: 40, left: 40),
          child: Text('Place Bid',
          style: Theme.of(context).textTheme.headlineLarge)
          
          ),
          ),


          


        ],
      ),
    );
  }
}


  
