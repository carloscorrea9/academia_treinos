import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/domain/repositories/workout_repository.dart';
import 'package:academia_treinos/modules/home/domain/usecases/get_workout_by_day.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_event.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._getWorkoutByDay, this._repository) : super(const HomeState()) {
    on<HomeStarted>(_onStarted);
    on<HomeDaySelected>(_onDaySelected);
    on<HomeDurationChanged>(_onDurationChanged);
    on<HomeExerciseCountChanged>(_onExerciseCountChanged);
    on<HomeExerciseUpdated>(_onExerciseUpdated);
  }

  final GetWorkoutByDay _getWorkoutByDay;
  final WorkoutRepository _repository;

  Future<void> _onStarted(HomeStarted event, Emitter<HomeState> emit) {
    return _load(event.day, emit);
  }

  Future<void> _onDaySelected(HomeDaySelected event, Emitter<HomeState> emit) {
    return _load(event.day, emit);
  }

  Future<void> _load(int day, Emitter<HomeState> emit) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        selectedDay: day,
        clearError: true,
      ),
    );
    try {
      final loaded = await _getWorkoutByDay(day);
      final shouldPersistSelection = loaded.needsSelection;
      final workout = loaded.ensureSelection();
      emit(
        state.copyWith(
          status: HomeStatus.success,
          workout: workout,
          selectedDay: day,
        ),
      );
      if (shouldPersistSelection) {
        await _repository.save(workout);
      }
    } catch (error) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }

  Future<void> _onDurationChanged(
    HomeDurationChanged event,
    Emitter<HomeState> emit,
  ) async {
    final workout = state.workout;
    if (workout == null) return;
    final minutes = event.minutes
        .clamp(WorkoutDay.minDurationMin, WorkoutDay.maxDurationMin)
        .toInt();
    await _persist(workout.copyWith(durationMin: minutes), emit);
  }

  Future<void> _onExerciseCountChanged(
    HomeExerciseCountChanged event,
    Emitter<HomeState> emit,
  ) async {
    final workout = state.workout;
    if (workout == null) return;
    await _persist(workout.withRandomSelection(event.count), emit);
  }

  Future<void> _onExerciseUpdated(
    HomeExerciseUpdated event,
    Emitter<HomeState> emit,
  ) async {
    final workout = state.workout;
    if (workout == null) return;

    final exercises = workout.exercises.map((exercise) {
      if (exercise.id != event.exerciseId) return exercise;
      return exercise.copyWith(
        sets: event.sets,
        reps: event.reps,
        weightKg: event.weightKg,
      );
    }).toList();

    await _persist(workout.copyWith(exercises: exercises), emit);
  }

  Future<void> _persist(WorkoutDay workout, Emitter<HomeState> emit) async {
    emit(state.copyWith(isSaving: true, workout: workout, clearError: true));
    try {
      final saved = await _repository.save(workout);
      emit(
        state.copyWith(
          isSaving: false,
          workout: saved,
          status: HomeStatus.success,
        ),
      );
    } catch (error) {
      emit(
        state.copyWith(
          isSaving: false,
          errorMessage: error.toString().replaceFirst('Exception: ', ''),
        ),
      );
    }
  }
}
