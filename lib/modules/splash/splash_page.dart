import 'package:academia_treinos/core/constants/app_assets.dart';
import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/modules/auth/presentation/stores/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _goNext();
  }

  Future<void> _goNext() async {
    final store = Modular.get<LoginStore>();
    store.restoreSession();
    await Future<void>.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    Modular.to.navigate(store.isLoggedIn ? '/home' : '/login');
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Image(
          image: AssetImage(AppAssets.logoWhite),
          width: 160,
        ),
      ),
    );
  }
}
