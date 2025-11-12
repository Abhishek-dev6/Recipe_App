//import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:reciepe/model/recipe_model.dart';
import 'package:reciepe/services/services_recipe.dart';

class RecipeViewmodel extends ChangeNotifier{
  final ServicesRecipe _recipe=ServicesRecipe();
  bool isLoading=false;
  List <Recipe> recipes=[];
  Future <void> getrecipe() async{
    isLoading=true;
    notifyListeners();
    try{
      recipes=await _recipe.fetchproduct();
    }catch(e){
      debugPrint("Enable to fetch product$e");
    }
    isLoading=false;
    notifyListeners();
  }
}