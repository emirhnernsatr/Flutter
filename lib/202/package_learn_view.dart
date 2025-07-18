import 'package:flutter/material.dart';
import 'package:flutter_learn/202/packege/loading_bar.dart';
import 'package:flutter_learn/202/packege/lounch_mixin.dart';



class PackageLearnView extends StatefulWidget {
  const PackageLearnView({super.key});

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with LaunchMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonTheme.colorScheme?.onPrimary,
        onPressed: () {
          launchURL('x');
        }),
      body: Column(
        children: [
          Text("a", style: Theme.of(context).textTheme.titleLarge,),
          LoadingBar(),
        ],
      ),
    );
  }
}