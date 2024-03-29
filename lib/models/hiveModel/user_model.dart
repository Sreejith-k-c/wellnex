import 'package:hive_flutter/adapters.dart';
part  'user_model.g.dart';


@HiveType(typeId: 1)
class User extends HiveObject{

  @HiveField(0)
  final String email;

  @HiveField(1)
  final String password;

  @HiveField(2)
  String? id;

  @HiveField(3)
  String? name;

  User({required this.email,required this.password, this.name}){
    id  = DateTime.now().microsecondsSinceEpoch.toString();
  }
}