import 'package:flutter/material.dart';
import '../model/recipe_model.dart';

class screen extends StatelessWidget {
  final Recipe recipe;

  const screen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(recipe.name.toString())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(child: Image.network(recipe.image.toString(),height: 100,width: 100,)),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Name:${recipe.name.toString()}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    SizedBox(width: 30),
                    Text(recipe.rating.toString()),
                  ],
                ),SizedBox(height: 30,),
                Text(recipe.tags.toString()),SizedBox(height: 30),
                Row(
                  children: [
                    Text("servings: ${recipe.servings.toString()}",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.red),),
                    SizedBox(width: 20),
                    Text("Cusines:${recipe.cuisine.toString()}"),
                  ],
                ),
                SizedBox(height: 30),
                Text("calories:${recipe.caloriesPerServing.toString()}"),
                 SizedBox(height: 30),
                Row(
                  children: [
                    Text("Prepration Time:${recipe.prepTimeMinutes.toString()}"),
                    SizedBox(width: 30),
                    Text("Cokking Time:${recipe.cookTimeMinutes.toString()}"),
                  ],
                ), SizedBox(height: 30),
                Text("Ingredients Needed${recipe.ingredients.toString()}"),
                 SizedBox(height: 30),
                Text("Instructions:${recipe.instructions.toString()}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
