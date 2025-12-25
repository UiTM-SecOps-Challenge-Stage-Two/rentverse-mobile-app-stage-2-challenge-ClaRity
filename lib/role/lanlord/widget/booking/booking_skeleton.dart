import 'package:flutter/material.dart';
import 'package:rentverse/common/widget/skeleton_loading.dart';

class BookingSkeletonView extends StatelessWidget {
  const BookingSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: const SkeletonCard(height: 160),
        );
      },
    );
  }
}
