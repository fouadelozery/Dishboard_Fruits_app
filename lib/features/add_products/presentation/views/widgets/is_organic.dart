import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';

class IsOrganic extends StatefulWidget {
  const IsOrganic({super.key, required this.onchanged});

  final ValueChanged<bool> onchanged;

  @override
  State<IsOrganic> createState() => _IsOrganicState();
}

class _IsOrganicState extends State<IsOrganic> {
  bool isOrganic = false;

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
                    text: 'Is Organic Item ?',
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
                value: isOrganic,
                onChanged: (value) {
                  setState(() {
                    isOrganic = value ?? false;
                  });
                  widget.onchanged(isOrganic);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
