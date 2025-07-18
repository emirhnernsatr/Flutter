import 'dart:io';

import 'package:flutter/material.dart';
import 'post_model.dart';
import 'package:dio/dio.dart';

class ServicPostLeranView extends StatefulWidget {
  const ServicPostLeranView({super.key});

  @override
  State<ServicPostLeranView> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicPostLeranView> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    name = 'Eren'; 
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel);
    
    if (response.statusCode == HttpStatus.created) {
      name = 'basarılı';
  }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ' '),
        actions: [ _isLoading ?  CircularProgressIndicator.adaptive() :  SizedBox.shrink()],
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController, 
            decoration: InputDecoration(labelText: 'Title'),
            textInputAction: TextInputAction.next,),
          TextField(
          controller: _bodyController, 
          decoration: InputDecoration(labelText: 'Body'),
          textInputAction: TextInputAction.next),
          TextField(
            controller: _userIdController,
            keyboardType: TextInputType.number,
            autofillHints: [AutofillHints.creditCardNumber],
            decoration:  InputDecoration(labelText: 'UserId'),),
            TextButton(
              onPressed:
              _isLoading ? null :
               () {
                if (_titleController.text.isNotEmpty && 
                _bodyController.text.isNotEmpty && 
                _userIdController.text.isNotEmpty) {
                  final model = PostModel(
                    title: _titleController.text,
                    body: _bodyController.text,
                    userId: int.tryParse(_userIdController.text));

                _addItemToService(model);
                }
              }, 
              child: Text('Send'))
        ],
      ),
    );
  }
}

// ignore: unused_element
class _PostCard extends StatelessWidget {
  const _PostCard({
    required PostModel? model,}) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ' '),
        subtitle: Text(_model?.body ?? ' '),
        ),
    );
  }
}
