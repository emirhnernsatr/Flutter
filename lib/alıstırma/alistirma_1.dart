import 'package:flutter/material.dart';

class Alistirma extends StatefulWidget {
  const Alistirma({super.key});

  @override
  State<Alistirma> createState() => _Alistirma1State();
}

class _Alistirma1State extends State<Alistirma> {
  final String _title = 'Rawsters Coffe';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: MyColors().whiteColor,

      appBar: AppBar(
        backgroundColor: MyColors().bluegrey,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(_title, style: TextStyle(color: Colors.black ,fontSize: 23,), )),
        ),
          leading: Padding(
            padding: EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: ImageLogo(), ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Stack(
                children: [
                  Icon(Icons.shopping_bag_outlined, size: 30, color: Colors.black),
                ],
                ),
              )
            ],        
      ),

      body:Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeaturedItem(),
           SizedBox(height: 20),
          Text('Popular Items', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CoffeeItem();
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
       // padding: EdgeInsets.all(10)
        child: BottomNavigationBar(
          backgroundColor:Colors.black,
        
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), backgroundColor: MyColors().bluegrey, label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
          ],
        
          
          ),
      ),
      );
  }
}

class ImageLogo extends StatelessWidget {
  const ImageLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/rawstersLogo.png', fit: BoxFit.cover, );
  }
}

class MyColors {
  final Color whiteColor = Color(0xfff2f3f6);
  final Color bluegrey = Colors.blueGrey;
}

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: MyColors().bluegrey,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            spreadRadius: 2
          )
        ]
      ),
      child: Row(

        children: [
            Expanded(
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Cinnamon Dolce Latte', 
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 5),
                Text('110 Calories', style: TextStyle(color: const Color.fromARGB(255, 11, 31, 66))),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {},
                  child: Text('Explore now',style: TextStyle(color: Colors.white),),
                )
              ],
            ),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset('assets/Rawsters_Latte.png', width: 150, height: 150, fit: BoxFit.cover),
          ),
        ],
      ),
    );
  }
}

class CoffeeItem extends StatelessWidget {
  const CoffeeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColors().bluegrey,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Image.asset('assets/Rawsters_Latte.png', width: 100, height: 100),
          Text('Caffe Lattte', style: TextStyle(fontWeight: FontWeight.bold)),
          Text('\$160', style: TextStyle(color: Colors.green)),
          Icon(Icons.star, color: Colors.amber, size: 20)
        ],
      ),
    );
  }
}
