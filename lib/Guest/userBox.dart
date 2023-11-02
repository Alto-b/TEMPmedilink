import 'package:hive/hive.dart';

part 'userBox.g.dart';

@HiveType(typeId: 0)
class UserBox extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  late String email;
  @HiveField(2)
  late String password;

  UserBox({required this.name,required this.email,required this.password});
}
