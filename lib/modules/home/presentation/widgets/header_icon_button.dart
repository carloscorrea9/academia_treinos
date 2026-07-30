import 'package:flutter/material.dart';

class HeaderIconButton extends StatelessWidget{
  const HeaderIconButton ({
    super.key,
    required this.icon,
    required this.onTap,
    this.backgroundColor = const Color(0xFF073137),
    this.iconColor = Colors.white,
    this.borderColor = const Color(0xFF1E5157),
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: CircleBorder(
        side: BorderSide(
          color: borderColor,
          width: 1,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: SizedBox(
          width: 31,
          height: 31,
          child: Icon(
            icon,
            size: 17,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}