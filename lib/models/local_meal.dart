import 'package:hive/hive.dart';

part 'local_meal.g.dart';

@HiveType(typeId: 0)
class LocalMeal extends HiveObject{
  @HiveField(0)
  String? idMeal;
  @HiveField(1)
  String? strMeal;
  @HiveField(2)
  String? strCategory;
  @HiveField(3)
  String? strMealThumb;

}