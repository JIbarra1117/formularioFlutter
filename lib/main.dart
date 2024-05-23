import 'package:flutter/material.dart';
import 'MainPage.dart';
void main() {
  runApp(MaterialApp(
    routes: {
      "/":(context) => MainPage()},
    initialRoute: "/",
  ));
}
