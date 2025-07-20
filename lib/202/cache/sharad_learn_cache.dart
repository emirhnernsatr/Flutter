import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/shared_learn_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharadLearnCache extends StatefulWidget {
  const SharadLearnCache({super.key});

  @override
  State<SharadLearnCache> createState() => _SharadLearnCacheState();
}

class _SharadLearnCacheState extends LoadingStatefull<SharadLearnCache> {

  int _currentValue = 0;

  late final SharedLearnManager _manager;

  late final List<User> userItems;
  @override
  void initState() {
    super.initState();
    _manager = SharedLearnManager();
    userItems = UserItems().users;
    _initialze();
  }

  Future<void> _initialze() async {
    changeLoading();
    await _manager.init();
    changeLoading();

    getDefaultValue();
  }

  void getDefaultValue() async {
  //  final prefs = await SharedPreferences.getInstance();
  //  final int? counter = prefs.getInt('counter') ;
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
    
  }

  @override
  void _onChangeValue(String value) {
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_currentValue.toString()),
      actions: [
        _Loading(context)
      ],
       ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _saveValueButton(),
         _removeValueButton() 

        ],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value){
              _onChangeValue(value);
            },),
        ]),);
  }

  SingleChildRenderObjectWidget _Loading(BuildContext context) {
    return isLoading ?
      Center(
        child: CircularProgressIndicator(color: Colors.black))
        : SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      onPressed: () async{
       changeLoading();
       await _manager.saveString(SharedKeys.counter, _currentValue.toString());
       changeLoading();
      },
      child: Icon(Icons.save),
      );
  }


FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      onPressed: () async{
       changeLoading();
       await _manager.removeItem(SharedKeys.counter);
       changeLoading();
      },
      child: Icon(Icons.remove),
      );
  }
}

class UserItems {
  late final List<User> users;
  UserItems() {
    users = [
     User('vb', '10', 'vb10.dev'),
     User('vb2', '102', 'vb10.dev'),
     User('vb3', '103', 'vb10.dev')
    ];
  }
}

abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
 bool isLoading = false;

  void changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}