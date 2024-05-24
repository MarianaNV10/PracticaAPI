import 'package:hive/hive.dart';
import 'models/local_meal.dart';

class Boxes{
  static Box<LocalMeal> getFavoritesMeals() => Hive.box<LocalMeal>('favorites_meals');
}
