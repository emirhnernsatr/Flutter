import 'package:flutter/material.dart';
import 'package:flutter_learn/product/counter_hello_button.dart';

class StatefullLearn extends StatefulWidget {
  const StatefullLearn({super.key});

  @override
  State<StatefullLearn> createState() => _StatefullLearnState();
}

class _StatefullLearnState extends State<StatefullLearn> {
  int _countValue = 0;
/*
  void incrementValue() {
    setState(() {
      _countValue = _countValue + 1;
    });
  }

  void deincrementValue() {
    setState(() {
      _countValue = _countValue - 1;
    });
  }
  */
  void _updateCounter(bool isIncrement) {
    if(isIncrement){
      _countValue = _countValue + 1;
    } else {
      _countValue = _countValue - 1;
    }
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _incrementButton(),
          _deincrementButton(),
        ],
      ),
      body:  Column(
        children: [
          Center(child: Text(_countValue.toString(), style: Theme.of(context).textTheme.headlineLarge),),
          const Placeholder(),
          const CounterHelloButton()
        ],
      ),
    );
  }

  FloatingActionButton _incrementButton() {
    return FloatingActionButton(
      onPressed: () {
        _updateCounter(true);
      },
      child: const Icon(Icons.add),
    );
  }

  Padding _deincrementButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: FloatingActionButton(
        onPressed: () {
          _updateCounter(false);
        },
        child: const Icon(Icons.remove),
      ),
    );
  }
}







