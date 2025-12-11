import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  const OrderButton({
    super.key,
    required this.onAccept,
    required this.onReject,
    required this.isVisible,
  });

  final VoidCallback onAccept;
  final VoidCallback onReject;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildButton(
            title: "Accept",
            color: AppColors.primaryColor,
            textColor: AppColors.primaryColor,
            onTap: onAccept,
          ),
          _buildButton(
            title: "Reject",
            color: Colors.red,
            textColor: Colors.red,
            onTap: onReject,
          ),
        ],
      ),
    );
  }

  Widget _buildButton({
    required String title,
    required Color color,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return Visibility(
      visible: isVisible,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white, // WHITE BACKGROUND
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2), // COLORED BORDER
          ),
          child: Text(
            title,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
