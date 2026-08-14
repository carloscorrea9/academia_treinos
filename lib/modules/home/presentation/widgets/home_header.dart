import 'package:academia_treinos/modules/auth/presentation/stores/login_store.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/header_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, this.userName});

  final String? userName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Material(
          color: const Color(0xFF173E44),
          borderRadius: BorderRadius.circular(24),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
            child: Row(
              children: [
                const Icon(Icons.fitness_center, size: 15, color: Colors.white),
                const SizedBox(width: 7),
                Text(
                  userName == null ? 'My Plan' : 'Olá, $userName',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        HeaderIconButton(
          icon: Icons.logout_rounded,
          onTap: () async {
            await Modular.get<LoginStore>().logout();
            Modular.to.navigate('/login');
          },
        ),
      ],
    );
  }
}
