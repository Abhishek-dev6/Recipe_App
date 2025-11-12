import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    Future.microtask(() {
      Provider.of<RecipeViewmodel>(context, listen: false).getrecipe();
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RecipeViewmodel>(context);
    return Scaffold(
      backgroundColor: Color(0xFFE8EAF6),
      appBar: AppBar(
        title: Center(
          child: Text(
            "Flavorly",
            style:GoogleFonts.lobster(fontWeight: FontWeight.bold,color: Colors.white)
          ),
        ),
        backgroundColor: Color(0xFF3F51B5),
      ),
      body:
          provider.isLoading
              ? CircularProgressIndicator()
              : ListView.builder(
                itemCount: provider.recipes.length,
                itemBuilder: (context, index) {
                  final recipe = provider.recipes[index];
                  return Card(
                    
                    elevation: 3,
                    color:Color(0XFFE0F7FA),
                    shadowColor: Colors.tealAccent,
                    child: ListTile(
                      leading: Image.network(
                        recipe.image.toString(),
                        height: 100,
                        width: 100,
                      ),
                      title: Text(recipe.name.toString()),
                      onTap:
                          () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Screen(recipe: recipe),
                            ),
                          ),
                    ),
                  );
                },
              ),
    );
  }
}
