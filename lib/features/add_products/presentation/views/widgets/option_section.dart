import 'package:dishboard_fruits_app/core/helper/utiles/colors.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/is_feature.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/is_organic.dart';
import 'package:dishboard_fruits_app/features/add_products/presentation/views/widgets/secton_title.dart';
import 'package:flutter/material.dart';

class OptionsSection extends StatelessWidget {
  final ValueChanged<bool> onFeatureChanged;
  final ValueChanged<bool> onOrganicChanged;

  const OptionsSection({
    super.key,
    required this.onFeatureChanged,
    required this.onOrganicChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            sectionTitle("Options"),
            const SizedBox(height: 8),
            IsFeature(onchanged: (value) => onFeatureChanged(value)),
            IsOrganic(onchanged: (value) => onOrganicChanged(value)),
          ],
        ),
      ),
    );
  }
   
}
