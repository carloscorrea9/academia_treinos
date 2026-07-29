import 'package:academia_treinos/core/constants/app_assets.dart';
import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import '../home/widgets/muscle_card.dart';

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
              _buildHeader(),

              const SizedBox(height: 40),

              _buildDaysToGym(),

              const SizedBox(height: 28),

              _buildWorkout(),

              const SizedBox(),

              _buildTargetMuscle(),
            ],
          ),
          ),
        ),
      ),
    );
  }
   
   Widget _buildHeader() {
    return Row(
      children: [ 
        TextButton(onPressed: () {},
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 10,
          ),
          side: const BorderSide(
            color: Color.fromARGB(101, 255, 255, 255),
            width: 0.1,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(64),
          ),
        ),
         child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [            
            Icon(
              Icons.fitness_center,
              size:16,
              color: Colors.white,
            ),
            SizedBox(width: 8),
            Text('My Plan',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),),
            SizedBox(width: 8),
            Icon(
              Icons.keyboard_arrow_down_sharp,
              size: 25,
              color: Colors.white,
            ),
          ],
         ),
        ),
        const Spacer(),
          Material(
          color: Colors.transparent,
          shape: const CircleBorder(
          side: BorderSide(
          color: Color.fromARGB(101, 255, 255, 255),
          width: 0.1,
           ),
          ),
        child: InkWell(
        onTap: () {
        },
          customBorder: const CircleBorder(),
          child: const SizedBox(
            width: 30,
            height: 30,
              child: Icon(
                Icons.keyboard_arrow_up,
                color: Colors.white,
      ),
    ),
  ),
),
  SizedBox(width: 8),
   Material(
    color: Colors.transparent,
    shape: const CircleBorder(
      side: BorderSide(
        color: Color.fromARGB(101, 255, 255, 255),
        width: 0.1,
      ),
    ),
    child: InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: const SizedBox(
        width: 30,
        height: 30,
        child: Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    ),
   ),
   SizedBox(width: 8),
   Material(
    color: Colors.transparent,
    shape: const CircleBorder(
      side: BorderSide(
        color: Color.fromARGB(101, 255, 255, 255),
        width: 0.1,
      ),
    ),
    child: InkWell(
      onTap: () {},
      customBorder: const CircleBorder(),
      child: const SizedBox(
        width: 30,
        height: 30,
        child: Icon(
          Icons.star_border_purple500_sharp,
          color: Colors.white,
        ),
      ),
    ),
   ),
    ],
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
}
