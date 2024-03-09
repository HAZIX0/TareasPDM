import 'package:flutter/material.dart';
import 'package:tarea5/forage_provider.dart';
import 'package:provider/provider.dart';
import 'package:tarea5/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider<ForageProvider>(
    create: (context) => ForageProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forage',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Colors.deepPurpleAccent.shade400),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.deepPurpleAccent.shade400,
            titleTextStyle: TextStyle(
              color: Colors.white,
            )),
      ),
      home: HomePage(),
    );
  }
}
