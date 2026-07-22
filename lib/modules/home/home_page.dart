import 'package:flutter/material.dart';

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

              const SizedBox(height: 32),

              _buildDaysToGym(),
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
     return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 43, 255, 0),
        borderRadius: BorderRadius.circular(24),
      ),
     );  
   }
}
