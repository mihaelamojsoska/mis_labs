import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../screens/exam_detail_screen.dart';
import 'package:intl/intl.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;

  const ExamCard({super.key, required this.exam});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final isPast = exam.dateTime.isBefore(now);

    final Color pastPrimary = const Color(0xFF74A65D);
    final Color pastSecondary = const Color(0xFF95C87A);
    final Color upcomingPrimary = const Color(0xFF006C5B);
    final Color upcomingSecondary = const Color(0xFF00997C);

    final Color accentColor = isPast ? pastPrimary : upcomingPrimary;
    final Color badgeColor = (isPast ? pastSecondary : upcomingSecondary).withOpacity(0.2);
    final Color iconColor = accentColor;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ExamDetailScreen(exam: exam)),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: accentColor, width: 3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            exam.subjectName,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                              color: accentColor,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: badgeColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            DateFormat('dd MMM').format(exam.dateTime),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: accentColor,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(Icons.access_time_rounded, size: 18, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat('dd.MM.yyyy • HH:mm').format(exam.dateTime),
                          style: const TextStyle(fontSize: 15),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[700]),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            exam.rooms.join(", "),
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Icon(
                          isPast ? Icons.check_circle : Icons.pending_actions,
                          size: 17,
                          color: iconColor,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          isPast ? "Испитот е завршен" : "Испитот се уште не е одржан",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: iconColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
