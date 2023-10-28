import 'package:hive/hive.dart';
part 'transactions.g.dart';


@HiveType(typeId: 0)
class DeptIns extends HiveObject{
  @HiveField(0)
  late String dept;
}