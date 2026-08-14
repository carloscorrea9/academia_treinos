import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.selectedDay = 1,
    this.workout,
    this.errorMessage,
    this.isSaving = false,
  });

  final HomeStatus status;
  final int selectedDay;
  final WorkoutDay? workout;
  final String? errorMessage;
  final bool isSaving;

  HomeState copyWith({
    HomeStatus? status,
    int? selectedDay,
    WorkoutDay? workout,
    String? errorMessage,
    bool? isSaving,
    bool clearError = false,
  }) {
    return HomeState(
      status: status ?? this.status,
      selectedDay: selectedDay ?? this.selectedDay,
      workout: workout ?? this.workout,
      errorMessage: clearError ? null : errorMessage ?? this.errorMessage,
      isSaving: isSaving ?? this.isSaving,
    );
  }

  @override
  List<Object?> get props => [status, selectedDay, workout, errorMessage, isSaving];
}
