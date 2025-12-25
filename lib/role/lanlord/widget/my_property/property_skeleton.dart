import 'package:flutter/material.dart';
import 'package:rentverse/common/widget/skeleton_loading.dart';

class PropertySkeletonView extends StatelessWidget {
  const PropertySkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: const SkeletonCard(height: 140),
        );
      },
    );
  }
}
