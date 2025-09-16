import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';

class CusttomButtom extends StatelessWidget {
  const CusttomButtom({super.key, required this.text, this.isVisible,  required this.onPressed});
  final String text;
  final Function() onPressed;
  final bool? isVisible;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      visible: isVisible ?? true,
      child: SizedBox(
        width: double.infinity,
        child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 20, color: Colors.white,
            fontFamily: 'Cairo',fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
