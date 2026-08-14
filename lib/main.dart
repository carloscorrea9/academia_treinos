import 'dart:convert';

import 'package:academia_treinos/app/app.dart';
import 'package:academia_treinos/app/app_module.dart';
import 'package:academia_treinos/core/network/mock_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  final raw = await rootBundle.loadString('assets/mock/workouts.json');
  MockDatabase.instance.seed(jsonDecode(raw) as Map<String, dynamic>);

  runApp(ModularApp(module: AppModule(), child: const AppWidget()));
}
