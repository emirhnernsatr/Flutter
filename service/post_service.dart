import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'comment_model.dart';
import 'post_model.dart';

abstract class IPostService {
  Future<bool> addItemToService(PostModel postModel);
  Future<bool> putItemToService(PostModel postModel, int id);
  Future<bool> deleteItemToService(int id);
  Future<List<PostModel>?> fetchPostItems();
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId);
  
}

class PostService implements IPostService {
  final Dio _dio;
  PostService() : _dio = Dio(BaseOptions(baseUrl: 'https://jsonplaceholder.typicode.com/'));


  @override
  Future<bool> addItemToService(PostModel postModel) async {
    try {
      final response = await _dio.post(_PostServicePath.posts.name, data: postModel);
    
    return response.statusCode == HttpStatus.created;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error,this);
      
    }
    return false;
  }

  @override
  Future<bool> putItemToService(PostModel postModel, int id) async {
    try {
      final response = await _dio.put('${_PostServicePath.posts.name}/$id', data: postModel);
    
    return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error,this);
      
    }
    return false;
  }

  @override
  Future<bool> deleteItemToService(int id) async {
    try {
      final response = await _dio.put('${_PostServicePath.posts.name}/$id');
    
    return response.statusCode == HttpStatus.ok;
    } on DioException catch (error) {
      _ShowDebug.showDioError(error,this);
      
    }
    return false;
  }

 
   @override
     Future<List<PostModel>?> fetchPostItems() async {
   try {
    final response = await _dio.get(_PostServicePath.posts.name); 

  if (response.statusCode == HttpStatus.ok) {
    final _datas = response.data;

    if (_datas is List) {
    return _datas.map((e) => PostModel.fromJson(e)).toList();
    }
  }
  } on DioException catch (exception) {
    _ShowDebug.showDioError(exception,this);
  } 
  return null;
  }
  
  @override
  Future<List<CommentModel>?> fetchRelatedCommentsWithPostId(int postId) async {
    try {
    final response = await _dio.get(_PostServicePath.comments.name,
    queryParameters: { _PostQueryPaths.postId.name :postId}); 

  if (response.statusCode == HttpStatus.ok) {
    final _datas = response.data;

    if (_datas is List) {
    return _datas.map((e) => CommentModel.fromJson(e)).toList();
    }
  }
  } on DioException catch (exception) {
    _ShowDebug.showDioError(exception,this);
  } 
  return null;
  }
}

enum _PostServicePath { posts, comments /*albums, photos, todos, users */}
enum _PostQueryPaths { postId}

class _ShowDebug {
  static void showDioError<T>(DioException error, T type) {
    if (kDebugMode) {
      print(error.message);
      print(type);
      print('-----');
    }
  }
}