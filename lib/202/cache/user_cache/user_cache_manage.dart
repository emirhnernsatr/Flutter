
import 'dart:convert';

import 'package:flutter_learn/202/cache/shared_learn_manager.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class UserCacheManage {
  final SharedLearnManager sharedManager;

  UserCacheManage(this.sharedManager);

  Future<void> saveItems(List<User> items) async {
    //compute
    final _items = items.map((element) => jsonEncode(element.toJson())).toList();
    await sharedManager.saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    final itemsString = sharedManager.getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element){
        final json = jsonDecode(element);
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        }
        
        return User('', '', ''); 
      }).toList();
    }
    return null;
  }
}