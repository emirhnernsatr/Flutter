import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureContextLearn extends StatefulWidget {
  const SecureContextLearn({super.key});

  @override
  State<SecureContextLearn> createState() => _SecureContextLearnState();
}

enum _SecureKeys {token}

class _SecureContextLearnState extends State<SecureContextLearn> {
  final _storage = FlutterSecureStorage();
  String _title = '';

  void saveItems(String data){
    setState(() {
      _title = data;;
    });
  }

  @override
  void initState() {
    super.initState();
    getSecureItems();
  }

  Future<void> getSecureItems () async {
    _title = await _storage.read(key: _SecureKeys.token.name) ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
        await _storage.write(key: _SecureKeys.token.name, value: _title);
        },
        label: const Text('Save'),),
        body: TextField(
          onChanged: saveItems,
        ),
    );
  }
}