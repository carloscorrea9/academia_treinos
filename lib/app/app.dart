import 'package:academia_treinos/modules/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../core/theme/app_theme.dart';
import 'config.dart';

class TreinosdeAcademia extends StatelessWidget {
  const TreinosdeAcademia({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appName,
      theme: AppTheme.dark,
      home: const HomePage(),
    );
  }
}
