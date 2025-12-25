import 'package:flutter/material.dart';
import 'package:rentverse/common/widget/skeleton_loading.dart';

class DashboardSkeletonView extends StatelessWidget {
  const DashboardSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Wallet card skeleton
          Container(
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.grey.shade300, Colors.grey.shade200],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SkeletonBox(
                    width: 100,
                    height: 14,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  const SizedBox(height: 12),
                  SkeletonBox(
                    width: 180,
                    height: 28,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Stats cards
          Row(
            children: [
              Expanded(
                child: SkeletonCard(height: 100),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: SkeletonCard(height: 100),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Trust index card
          SkeletonCard(height: 140),
          const SizedBox(height: 16),

          // Section title
          SkeletonBox(
            width: 150,
            height: 18,
            borderRadius: BorderRadius.circular(4),
          ),
          const SizedBox(height: 12),

          // Property cards
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: 280,
                  margin: EdgeInsets.only(right: index < 2 ? 12 : 0),
                  child: const SkeletonCard(height: 200),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
