import 'package:flutter/material.dart';
import 'package:webservicesapi/boxes.dart';
import 'package:webservicesapi/models/local_meal.dart';
import 'package:webservicesapi/models/response_api.dart';

class DetailMealPage extends StatefulWidget {

  var meal;

  DetailMealPage(this.meal);

  @override
  State<DetailMealPage> createState() => _DetailMealPageState(meal);
}

class _DetailMealPageState extends State<DetailMealPage> {

  final Meals meal;
  var isFavorite = false;

  void _getFavoritesMeals(){
    final box = Boxes.getFavoritesMeals();
    box.values.forEach((element) {
      if(element.idMeal == meal.idMeal){
        print("${element.strMeal} está en favoritos");
        isFavorite = true;
      }
    });
  }

  void _onFavoriteButtonClicked(){
    print('aquí');
    var localMeal = LocalMeal()
        ..strMeal = meal.strMeal
        ..strCategory = meal.strCategory
        ..strMealThumb = meal.strMealThumb
        ..idMeal = meal.idMeal;

    final box = Boxes.getFavoritesMeals();
    if(isFavorite){
      print("Eliminando");
      box.delete(localMeal.idMeal);
    }else{
      print("Agregando");
      box.put(localMeal.idMeal, localMeal);
    }
    setState(() {
      isFavorite = !isFavorite;
    });
  }



  void initState(){
    _getFavoritesMeals();
    super.initState();
  }

  _DetailMealPageState(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.strMeal ?? 'Chosen Meal'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 200,
                child: Ink.image(image: NetworkImage('${meal.strMealThumb}')),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      color: Colors.red,
                      onPressed: (){
                        _onFavoriteButtonClicked();
                      },
                    ),
                  ),
                ],
              ),
              Text(
                "How to prepare it ...",
                style: const TextStyle(
                  color: Colors.orangeAccent,
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                meal.strInstructions!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
