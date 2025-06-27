import 'dart:io';
import 'package:flutter/material.dart';
import 'comment_learn_view.dart';
import 'post_model.dart';
import 'package:dio/dio.dart';
import 'post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({super.key});

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com';

  // TEST EDİLEBİRİ KOD 
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    name = 'Eren';
    fetchPostItemsAdvance();

  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();

   final response = await _dio.get('posts'); 

  if (response.statusCode == HttpStatus.ok) {
    final _datas = response.data;

    if (_datas is List) {
      
    setState(() {
      _items = _datas.map((e) => PostModel.fromJson(e)).toList();
     });
    }
  }
  _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();

   _items = await _postService.fetchPostItems();
  _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name ?? ' '),
        actions: [ _isLoading ?  CircularProgressIndicator.adaptive() :  SizedBox.shrink()],
      ),
      body:  _items == null ? Placeholder() : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: _items?.length ?? 0,
        itemBuilder: (context, index) {
          return _PostCard(model: _items?[index]);
        },
  ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    super.key,
    required PostModel? model,
  }) : _model = model;

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute (
            builder: (context) => CommentLearnView(postId: _model?.id),
          )); 
        }, 
        title: Text(_model?.title ?? ' '),
        subtitle: Text(_model?.body ?? ' '),
        ),
    );
  }
}
