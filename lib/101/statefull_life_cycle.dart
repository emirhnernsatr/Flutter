import 'package:flutter/material.dart';

class StatefullLifeCycle extends StatefulWidget {
  const StatefullLifeCycle({super.key, required this.message});
  final String message;

  @override
  State<StatefullLifeCycle> createState() => _StatefullLifeCycleState();
}

class _StatefullLifeCycleState extends State<StatefullLifeCycle> {
 String _message= '';
 late final bool _isOdd;
 
@override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.message != widget.message){
      _message = widget.message;
      _computerName();
      setState(() {});
    }
  }

  @override
  void dispose() {
    super.dispose();
    _message = "";
  }

@override
void initState() {
  super.initState();
  _message = widget.message; 
  _isOdd = widget.message.length.isOdd;
  _computerName();
}

void _computerName() {
  if(_isOdd){
    _message += ' Cift';
  } else {
    _message += ' Tek';
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_message),
      ),
      body: _isOdd 
      ? TextButton(onPressed: (){}, child: Text(_message))
      : ElevatedButton(onPressed: () {}, child: Text(_message),)
    );
  }
}
 