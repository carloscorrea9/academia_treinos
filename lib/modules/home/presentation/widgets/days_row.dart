import 'package:academia_treinos/core/constants/app_colors.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_bloc.dart';
import 'package:academia_treinos/modules/home/presentation/bloc/home_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DaysRow extends StatelessWidget {
  const DaysRow({super.key, required this.selectedDay});

  final int selectedDay;

  @override
  Widget build(BuildContext context) {
    const days = [1, 2, 3, 4, 5];
    return Row(
      children: [
        for (final day in days)
          TextButton(
            onPressed: () {
              BlocProvider.of<HomeBloc>(context).add(HomeDaySelected(day));
            },
            child: Text(
              'Day $day',
              style: TextStyle(
                fontSize: 18,
                fontWeight: selectedDay == day ? FontWeight.w700 : FontWeight.w400,
                color: selectedDay == day
                    ? AppColors.textPrimary
                    : AppColors.textSecondary,
              ),
            ),
          ),
      ],
    );
  }
}
