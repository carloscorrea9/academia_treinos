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
        IconButton(
        padding: EdgeInsets.zero,
        constraints: BoxConstraints(),
        onPressed: () {},
        icon: const CircleAvatar(
          radius: 24,
          backgroundColor: Color.fromARGB(255, 43, 255, 0),
          child: Icon(           
            Icons.person_outline,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),     
        const SizedBox(width: 8),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello!',
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff333333),
             ),
            ),
            Text('User',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF20202A),
             ),
            ),
          ],
        ),
        const Spacer(),
          IconButton(
            onPressed: () {},
             icon: const Icon (
              Icons.notifications,
              color: Color.fromARGB(255, 43, 255, 0),
             ),
        ),
      ],
    );
   }
}

