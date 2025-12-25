import 'package:flutter/material.dart';
import 'package:rentverse/common/widget/skeleton_loading.dart';

class ChatSkeletonView extends StatelessWidget {
  const ChatSkeletonView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: 10,
      itemBuilder: (context, index) {
        return const SkeletonListTile();
      },
    );
  }
}
