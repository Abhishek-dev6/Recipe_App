import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:reciepe/view/recipe_view.dart';

class recipesplash extends StatefulWidget {
  const recipesplash({super.key});

  @override
  State<recipesplash> createState() => _recipesplashState();
}

class _recipesplashState extends State<recipesplash> {
  @override
void initState(){
  super.initState();
  Timer(Duration(seconds: 2), (){
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) =>Recipelist()),);
  });
}


  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/Recipe.png",height: 200,width: 200,),
            SizedBox(height: 10),
            Text("Flavorly",style: GoogleFonts.lobster(fontWeight: FontWeight.bold,fontSize: 30))
          ],
        ),
      ),
    );
  }
}