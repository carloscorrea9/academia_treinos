import 'package:academia_treinos/core/constants/app_assets.dart';
import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/core/constants/app_icons.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/muscle_card_exercices.dart';
import 'package:academia_treinos/modules/home/presentation/widgets/header_icon_button.dart';

import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter/material.dart';
import '../widgets/muscle_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical:20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context),

              const SizedBox(height: 16),

              _buildDaysToGym(),

              const SizedBox(height: 28),

              _buildWorkout(),

              const SizedBox(),

              _buildTargetMuscle(),

              const SizedBox(height: 28),

              _buildExercises(),
            ],
          ),
          ),
        ),
      ),
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
     return Row(
       children: [ 
          TextButton(
            onPressed: () {},
            child: Text('Day 1',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),),),
            SizedBox(width: 6),
            TextButton(
            onPressed: () {},
            child: Text('Day 2',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),),),
            SizedBox(width: 6),
            TextButton(
            onPressed: () {},
            child: Text('Day 3',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),),),
            SizedBox(width: 6),
            TextButton(
            onPressed: () {},
            child: Text('Day 4',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),),),
            SizedBox(width: 6),
            TextButton(
            onPressed: () {},
            child: Text('Day 5',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),),),
            SizedBox(width: 6),
          ],
        );
   }

   Widget _buildWorkout(){
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
          Spacer(),
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
          child: const Row(
            children: [
              Icon(
                Icons.mail_outline_rounded,
                color: AppColors.iconPrimary,
              ),
               Text('My Gym',
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
        SizedBox(width: 8),
        TextButton(
          onPressed:() {},
          child: const Row(
            children: [
              Text('50 min',
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
        SizedBox(width: 8),
          TextButton(
          onPressed:() {},
          child: const Row(
            children: [
              Text('4 Muscles',
              style: TextStyle(
                fontSize: 20,
                color: AppColors.textPrimary,
              ),                
              ),
            Icon(
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

   Widget _buildTargetMuscle(){
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
              MuscleCard(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              const SizedBox(width: 8),
              MuscleCard(
                title: 'Back',
                imagePath: AppAssets.appIcon,
              ),
              const SizedBox(width: 8),
              MuscleCard(
                title: 'Abdominal',
                imagePath: AppAssets.appIcon,
              ),
              const SizedBox(width: 8),
              MuscleCard(
                title: 'Obliques',
                imagePath: AppAssets.appIcon,
              ),
            ],
          ),
        ),
      ],
    );
}

Widget _buildExercises() {
  return Column(
    children: [
      Row(
        children: [
          const Text('7 Exercises'),
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
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
              MuscleCardExercices(
                title: 'Chest',
                imagePath: AppAssets.appIcon,
              ),
        ],),
      ),
    ],
  );
}
}
