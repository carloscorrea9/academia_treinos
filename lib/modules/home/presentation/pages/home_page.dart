import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/core/constants/app_icons.dart';
import 'package:academia_treinos/modules/home/data/datasources/workout_local_datasource.dart';
import 'package:academia_treinos/modules/home/data/repositories/workout_repository_impl.dart';
import 'package:academia_treinos/modules/home/domain/entities/workout_day.dart';
import 'package:academia_treinos/modules/home/domain/usecases/get_workout_by_day.dart';
import 'package:academia_treinos/modules/home/presentation/controllers/home_controller.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/header_icon_button.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/muscle_card.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/muscle_card_exercices.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;


  @override
  void initState() {
    super.initState();

    final datasource = WorkoutLocalDatasource();
    final repository = WorkoutRepositoryImpl(datasource);
    final getWorkoutByDay = GetWorkoutByDay(repository);

    _controller = HomeController(getWorkoutByDay);
    _controller.getWorkoutByDay();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _controller,
      builder: (context, _) {
        final workout = _controller.currentWorkout;
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(context),
                    const SizedBox(height: 16),
                    _buildDaysToGym(),
                    const SizedBox(height: 28),
                    if (_controller.isLoading && workout == null)
                      const Center(child: CircularProgressIndicator())
                    else if (_controller.errorMessage != null)
                      Text(
                        _controller.errorMessage!,
                        style: const TextStyle(color: Colors.redAccent),
                      )
                    else if (workout != null) ...[
                      _buildWorkout(workout),
                      const SizedBox(height: 28),
                      _buildTargetMuscle(workout),
                      const SizedBox(height: 28),
                      _buildExercises(workout),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
   
   Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Material(
          color: const Color(0xFF173E44),
          borderRadius: BorderRadius.circular(24),
          child: InkWell(
            onTap: () {
              _showPlanModeBottomSheet(context);
            },
            borderRadius: BorderRadius.circular(24),
            child: const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 9,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fitness_center,
                    size: 15,
                    color: Colors.white,
                  ),
                  SizedBox(width: 7),
                  Text('My Plan',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  ),
                  SizedBox(width: 5),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Colors.white70,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),

        HeaderIconButton(
          icon: Icons.keyboard_arrow_down_rounded,
          onTap: () {},
        ),

        const SizedBox(width: 7),

        HeaderIconButton(
          icon: Icons.tune_rounded,
          onTap: () {},
        ),

        const SizedBox(width: 7),

        HeaderIconButton(
          icon: Icons.workspace_premium_outlined,
          backgroundColor: const Color(0XFF6DFF39),
          iconColor: const Color(0xFF062D31),
          borderColor: const Color(0xFF6DFF39),
          onTap: () {},
        ),
      ], 
    );  
 }
 
 void _showPlanModeBottomSheet(BuildContext context){
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return FractionallySizedBox(
        heightFactor: 0.5,
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
          decoration: const BoxDecoration(
            color: Color(0xff082D32),
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(28),
            ),
          ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
               width: 42,
               height: 4,
               decoration: BoxDecoration(
                color: Colors.white24,
                borderRadius: BorderRadius.circular(20),
               ),                 
              ),
            ),
            const SizedBox(height: 24),

            const Text('Select your mode',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),),

            const SizedBox(height: 24),

            const Text('Choose how you want to organize your workouts.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14, 
            ),),

            const SizedBox(height: 24),

            Expanded(
              child: Column(
                children: [
                  _buildModeOption(
                    context: context,
                    icon: Icons.auto_awesome,
                    title: 'Smart Plan',
                    subtitle: 'A plan created based on your goals.'
                  ),

                  const SizedBox(height: 12),

                  _buildModeOption(
                    context: context,
                    icon: Icons.edit_calendar_outlined,
                    title: 'Custom Plan',
                    subtitle: 'Create and organize your own routine.'
                  ),

                   const SizedBox(height: 12),

                  _buildModeOption(
                    context: context,
                    icon: Icons.auto_awesome,
                    title: 'Quick Workout',
                    subtitle: 'Start a suggested workout immediately.'
                  ),
                ],
              ),
            ),
          ],
        ),
        ),
      );
    },
  );
 }

 Widget _buildModeOption({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
 }) {
  return Material(
    color: const Color(0xFF103B41),
    borderRadius: BorderRadius.circular(16),
    child: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      borderRadius: BorderRadius.circular(16),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: Color(0xFF195058),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: const Color(0xFF6DFF39),
                size: 21,
              ),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(width: 4),

                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white54,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),),
              const Icon(
                Icons.chevron_right_rounded,
                color: Colors.white38,
              )
          ],),),
          
    ),
  );
 }

   Widget _buildDaysToGym() {
    const days = [1, 2, 3, 4, 5];

     return Row(
       children: [ 
        for (final day in days) ...[
          TextButton(
            onPressed: () => _controller.selectDay(day),
            child: Text(
              'Day $day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: _controller.selectedDay == day ? FontWeight.w700 : FontWeight.w400,
                color: _controller.selectedDay == day ? AppColors.textPrimary : AppColors.textSecondary,
              ),
            ),
          ),
          const SizedBox(width: 6),
        ],
          ],
        );
   }

   Widget _buildWorkout(WorkoutDay workout){
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [  
        Row(
          children: [
          Text('WORKOUT SETTINGS',
          style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),),
          const Spacer(),
          TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text('More Options ...',
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textSecondary
          ),
          )
          ),
          ],          
        ), 
        SingleChildScrollView( 
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.mail_outline_rounded,
                color: AppColors.iconPrimary,
              ),
               Text(
                workout.gymName,
                 style: TextStyle(
                 color: AppColors.textPrimary,
                 fontSize: 18,
               ),
             ),
             Icon(
              Icons.keyboard_arrow_down_sharp,
              color: AppColors.iconPrimary,
             ),
           ],
         ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed:() {},
          child: Row(
            children: [
              Text(
              '${workout.durationMin} min',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textPrimary,
              )
              ),
              Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppColors.iconPrimary,
              ),
            ],
          ),
        ),
        const SizedBox(width: 8),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Text(
                '${workout.muscleCount} Muscles',
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.textPrimary,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_down_sharp,
                color: AppColors.iconPrimary,
              ),
            ],
          ),
        ),  
          ],
        ),
        ),
       ],
    );
   }

   Widget _buildTargetMuscle(WorkoutDay workout){
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [       
        const Text('Target Muscles',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: AppColors.textPrimary,
        ),
        ),
        const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (final muscle in workout.muscles) ...[
                MuscleCard(
                  title: muscle.name,
                  imagePath: muscle.imagePath,
                ),
                const SizedBox(width: 8),
              ],
            ],
          ),
        ),
      ],
    );
}

Widget _buildExercises(WorkoutDay workout) {
  return Column(
    children: [
      Row(
        children: [
          Text('${workout.exerciseCount} Exercises'),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Edit',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(width: 4),
                SvgPicture.asset(
                  AppIcons.editIcon,
                  width: 16,
                  height: 16,
                  colorFilter: ColorFilter.mode(
                  AppColors.textSecondary, 
                  BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ],
      ),
      Column(
          children: [
              for (final exercise in workout.exercises) ...[
                MuscleCardExercices(
                  title: exercise.name,
                  imagePath: exercise.imagePath,
                  subtitle: '${exercise.sets} sets • ${exercise.reps} reps • ${exercise.weightKg} kg',
                ),
                const SizedBox(height: 8),
              ],
        ],),
    ],
  );
}
}
