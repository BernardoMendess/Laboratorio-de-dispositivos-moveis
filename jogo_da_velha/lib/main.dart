import 'package:jogo_da_velha/pages/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "Jogo da Velha",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
    ),
    home: Home()
  ));
}
