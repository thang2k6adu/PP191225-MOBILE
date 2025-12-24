import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pp191225/domain/entities/tasks/task.dart';

class TaskItemWidget extends StatelessWidget {
  final Task task;

  const TaskItemWidget({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final isActive = task.status == 'ACTIVE';
    final isDone = task.status == 'DONE';
    final isPlanned = task.status == 'PLANNED';

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isActive
            ? const Color(0xFFD4F4DD) // Light green for active
            : isDone
            ? const Color(0xFFF5F5F5) // Gray for done
            : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isActive ? const Color(0xFF4CAF50) : const Color(0xFFE0E0E0),
          width: isActive ? 2 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(0, 0, 0, 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Task name
          Text(
            task.name,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: isDone ? Colors.grey : Colors.black87,
              decoration: isDone ? TextDecoration.lineThrough : null,
            ),
          ),
          const SizedBox(height: 8),

          // Deadline
          Row(
            children: [
              const Icon(CupertinoIcons.calendar, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                'Deadline: ${DateFormat('MMM d').format(task.deadline)}',
                style: TextStyle(
                  fontSize: 14,
                  color: isDone ? Colors.grey : Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),

          // Estimate hours
          Row(
            children: [
              const Icon(CupertinoIcons.clock, size: 14, color: Colors.grey),
              const SizedBox(width: 4),
              Text(
                'Est. Hours: ${task.estimateHours.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 14,
                  color: isDone ? Colors.grey : Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Status badge and action button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Status badge
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isActive
                      ? const Color(0xFF4CAF50)
                      : isPlanned
                      ? const Color(0xFFFF9800)
                      : Colors.grey,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  task.status,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              // Action button (only for PLANNED tasks in MVP)
              if (isPlanned)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    'Start working',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
