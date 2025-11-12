import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../model/recipe_model.dart';

class Screen extends StatelessWidget {
  final Recipe recipe;

  const Screen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFFFF8E1),
      appBar: AppBar(title: Text(recipe.name.toString(),style: TextStyle(fontWeight: FontWeight.bold),),backgroundColor: Color(0XFFFFCC80),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Card(
          color: Color(0xFFFFE0B2),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 300,
                    width: double.infinity,
                    child: Image.network(
                      recipe.image.toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Name: ${recipe.name.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "Ratings:  ${recipe.rating.toString()}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 11,
                            color: Colors.red,
                          ),
                        ),
                        RatingBarIndicator(
                          rating: recipe.rating ?? 0,
                          itemBuilder:
                              (context, index) =>
                                  Icon(Icons.star, color: Colors.amber),
                          direction: Axis.horizontal,
                          itemSize: 15,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                if (recipe.tags != null && recipe.tags!.isNotEmpty)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tags:",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 4.0,
                        children: [
                          ...recipe.tags!.map(
                            (tag) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.cyan,
                                ),
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Servings:  ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      recipe.servings.toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 40),
                    Row(
                      children: [
                        Text(
                          "Recipe:   ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          recipe.cuisine.toString(),
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Calories:   ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      recipe.caloriesPerServing.toString(),
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Prepration Time:   ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(recipe.prepTimeMinutes.toString()),
                    SizedBox(width: 30),
                    Row(
                      children: [
                        Text(
                          "Cooking Time:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(recipe.cookTimeMinutes.toString()),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Text(
                      "Ingredients:   ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Text(recipe.ingredients?.join(",") ?? "N/A"),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Instructions:   ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    ...recipe.instructions!
                        .map(
                          (item) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("$item"),
                          ),
                        )
                        .toList(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
