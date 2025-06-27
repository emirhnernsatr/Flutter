import 'package:flutter/material.dart';
import 'package:flutter_full_learn/demos/colors_learn_view.dart';


class ColorsLifeCycleView extends StatefulWidget {
  const ColorsLifeCycleView({super.key});

  @override
  State<ColorsLifeCycleView> createState() => _ColorsLifeCycleViewState();
}

class _ColorsLifeCycleViewState extends State<ColorsLifeCycleView> {
  Color? _backgroundColor;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _chargeBackgraound,
          icon: const Icon(Icons.clear))],
      ),

      body: Column(
        children: [Spacer(), Expanded(
          child: ColorsLearnView( 
            initialColor: _backgroundColor ?? Colors.transparent
        ))],
      ),
    );
  }

  void _chargeBackgraound() { 
    setState(() {
      _backgroundColor = Colors.pink; 
    });
  }
}
