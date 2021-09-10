
import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:hive_example/model/User.dart';

class HiveDB{
  static final box = Hive.box("user");
   saveData(String user /*User user*/){
    box.put("user", user);
  }

  Future<User> loadData()async{
    return User.fromJson(jsonDecode(await box.get("user")));
  }
}