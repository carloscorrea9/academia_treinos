import 'package:flutter/material.dart';
import '../modules/home/home_page.dart';

class TreinosdeAcademia extends StatelessWidget {
  const TreinosdeAcademia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Treinos de Academia',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 42, 100, 100),
        fontFamily: 'Arial',
      ),
      home: const HomePage(),
    );
  }
}
