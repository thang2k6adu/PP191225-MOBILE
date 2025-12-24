import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskEmptyStateWidget extends StatelessWidget {
  const TaskEmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Empty state icon
          Icon(CupertinoIcons.doc_text, size: 80, color: Colors.grey.shade300),
          const SizedBox(height: 24),

          // Empty state message
          const Text(
            'No tasks yet.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),

          // Instruction text
          const Text(
            "Tap '+' to create one.",
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
