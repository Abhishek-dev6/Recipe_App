import 'dart:convert';
import 'package:reciepe/model/recipe_model.dart';
import 'package:http/http.dart' as http;
class ServicesRecipe {
  final String baseurl="https://dummyjson.com/recipes";
  Future <List<Recipe>> fetchproduct() async{
    final response=await http.get(Uri.parse(baseurl));
    if(response.statusCode==200){
      final  decoded=jsonDecode(response.body);
       final List<dynamic> data = decoded['recipes'];
      return data.map((e)=>Recipe.fromJson(e)).toList();
    }else{
      throw Exception("Error occured While fetching the product");
    }
  }
}