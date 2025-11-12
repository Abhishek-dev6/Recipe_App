import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:reciepe/model/recipe_model.dart';
import 'package:reciepe/view/recipe_view2.dart';
import 'package:reciepe/viewmodel/recipe_viewmodel.dart';

class Recipelist extends StatefulWidget {
  const Recipelist({super.key});

  @override
  State<Recipelist> createState() => _RecipelistState();
}

class _RecipelistState extends State<Recipelist> {
  @override
  void initState() {
    super.initState();
    Future.microtask((){
    Provider.of<RecipeViewmodel>(context,listen: false).getrecipe();
    });
  }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeViewmodel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Recipe App")),
        backgroundColor: Colors.cyan,
      ),
      body:
          provider.isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                itemCount: provider.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = provider.recipes[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(recipe.image.toString(),height: 100,width: 100,),
                      title: Text(recipe.name.toString()),onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>Screen(recipe: recipe,))),
                    ),
                  );
                },
              ),
    );
  }
}
