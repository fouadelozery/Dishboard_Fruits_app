import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';

class IsFeature extends StatefulWidget {
  const IsFeature({super.key, required this.onchanged});

  final ValueChanged<bool> onchanged;

  @override
  State<IsFeature> createState() => _IsFeatureState();
}

class _IsFeatureState extends State<IsFeature> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(14, 0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            const Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Is Features Item ?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 20,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                  widget.onchanged(isChecked);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
