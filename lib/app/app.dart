import 'package:flutter/material.dart';

import '../modules/home/home_page.dart';
import 'config.dart';
import '../core/theme/app_theme.dart';

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
