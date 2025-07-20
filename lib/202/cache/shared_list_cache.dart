import 'package:flutter/material.dart';
import 'package:flutter_learn/202/cache/sharad_learn_cache.dart';
import 'package:flutter_learn/202/cache/shared_learn_manager.dart';
import 'package:flutter_learn/202/cache/user_cache/user_cache_manage.dart';
import 'package:flutter_learn/202/cache/user_model.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends LoadingStatefull<SharedListCache> {
  late final UserCacheManage userCacheManage ;
  List<User> _users = [];

  @override
  void initState() {
    super.initState();
    initalezaAndSave();
  }

  void initalezaAndSave() async {
    changeLoading();
    final SharedLearnManager manager = SharedLearnManager();

    await manager.init();
    userCacheManage = UserCacheManage(manager);
    _users = userCacheManage.getItems() ?? [];
    changeLoading();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isLoading ? CircularProgressIndicator(color: Colors.blue,): null, 
        actions: isLoading ? null : [
          IconButton(onPressed: () async {
            changeLoading();
           await userCacheManage.saveItems(_users);
            changeLoading();
          }, icon: Icon(Icons.download_for_offline_outlined)),
          IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle_outline)),
        ],
      ),
      body: _UserListView(users: _users),
    );
  }
}

class _UserListView extends StatelessWidget {
   _UserListView({
    Key? key, required this.users,
   }) : super(key: key);


  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name ?? ''),
            subtitle: Text(users[index].description ?? ''),
            trailing: Text(users[index].url ?? '', 
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        decoration: TextDecoration.underline,))),
        );
      }
    );
  }
}