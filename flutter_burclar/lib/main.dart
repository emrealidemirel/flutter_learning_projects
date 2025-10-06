import 'package:flutter/material.dart';
import 'package:flutter_burclar/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.yellow,
          scaffoldBackgroundColor: Colors.brown.shade100),
      onGenerateRoute: RouteGenerator.routeGenerator ,
    );
  }
}
