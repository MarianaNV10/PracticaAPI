import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:webservicesapi/boxes.dart';
import 'package:webservicesapi/models/local_meal.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getFavoritesMeals().listenable(),
      builder: (context, box, _){
        final favoriteMealBox = box.values.toList().cast<LocalMeal>();
        return ListView.builder(
          itemCount: favoriteMealBox.length,
          itemBuilder: (BuildContext context, int index){
            final meal = favoriteMealBox[index];
            return Card(
              surfaceTintColor: Colors.white38,
              elevation: 4.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      meal.strMeal!,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                      ),
                    ),
                    subtitle: Text(
                      "Categoria: ${meal.strCategory}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    child: Ink.image(image: NetworkImage('${meal.strMealThumb}')),
                  ),
                  const SizedBox(height: 8.0,)
                ],
              ),
            );
          },
        );
      },
    );
  }
}
