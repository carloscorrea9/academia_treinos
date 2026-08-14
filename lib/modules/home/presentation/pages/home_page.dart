import 'package:academia_treinos/modules/auth/presentation/stores/login_store.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_bloc.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_event.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_state.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/days_row.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/exercises_section.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/home_header.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/selected_exercises_strip.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/workout_settings_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Modular.get<HomeBloc>()..add(const HomeStarted()),
      child: const _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            final workout = state.workout;
            return Column(
              children: [
                if (state.isSaving) const LinearProgressIndicator(minHeight: 2),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HomeHeader(
                          userName: Modular.get<LoginStore>().userName,
                        ),
                        const SizedBox(height: 16),
                        DaysRow(selectedDay: state.selectedDay),
                        const SizedBox(height: 28),
                        if (state.status == HomeStatus.loading &&
                            workout == null)
                          const Center(child: CircularProgressIndicator())
                        else if (state.status == HomeStatus.failure)
                          Text(
                            state.errorMessage ?? 'Erro ao carregar treino',
                            style: const TextStyle(color: Colors.redAccent),
                          )
                        else if (workout != null) ...[
                          WorkoutSettingsSection(workout: workout),
                          const SizedBox(height: 28),
                          SelectedExercisesStrip(workout: workout),
                          const SizedBox(height: 28),
                          ExercisesSection(workout: workout),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
