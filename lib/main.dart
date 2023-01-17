import 'package:capstone_app/pages/home_page.dart';
import 'package:capstone_app/pages/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'components/report.dart';

void main() async {
  // initialize hive
  await Hive.initFlutter();

  // open a box
  await Hive.openBox("Habit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      // home: Report(),
      home: Splash(),
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        '/home' :(context) => HomePage(),
        '/details': (context) =>Report(),

      },
    );
  }
}
