import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reciepe/view/recipe_splash.dart';
//import 'package:reciepe/view/recipe_view.dart';
import 'package:reciepe/viewmodel/recipe_viewmodel.dart';

void main() {
  runApp(const MainApp());
}
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>RecipeViewmodel(),
      child: const MaterialApp(debugShowCheckedModeBanner: false,
      home: recipesplash(),
      ),
    );
  }
}
