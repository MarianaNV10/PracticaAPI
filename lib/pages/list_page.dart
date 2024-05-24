import 'package:flutter/material.dart';
import 'package:webservicesapi/models/response_api.dart';
import 'package:webservicesapi/pages/detail_meal_page.dart';
import 'package:webservicesapi/repository/the_dog_api.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

  final List<Meals> _listMeals = <Meals>[];
  final TheDogApi _theDogApi = TheDogApi();

  Future _getMeals() async{
    print('dentro de get cats');
    var resultsFuture = await _theDogApi.getMeals();
    setState(() {
      resultsFuture.meals?.forEach((element) {
        _listMeals.add(element);
      });
    });

  }

  @override

  void initState(){
    super.initState();
    setState(() {
      _getMeals();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("The Meals API"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView.builder(
          itemCount: _listMeals.length,
          itemBuilder: (context, index){
            Meals meals = _listMeals[index];
            return InkWell(
              onTap:(){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMealPage(meals)));
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.orange, // Color del borde
                        width: 2.0, // Ancho del borde
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Card(
                      surfaceTintColor: Colors.white38,
                      elevation: 4.0,
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(
                              meals.strMeal!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20.0,
                              ),
                            ),
                            subtitle: Text(
                              "Categoria: ${meals.strCategory}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 200,
                            child: Ink.image(image: NetworkImage('${meals.strMealThumb}')),
                          ),
                          const SizedBox(height: 8.0,)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8.0,)
                ],
              )
            );
          },
        ),
      ),
    );
  }
}
