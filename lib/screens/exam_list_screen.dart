import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';

class ExamListScreen extends StatelessWidget {
  final String studentIndex = "223196";

  ExamListScreen({super.key});

  final List<Exam> exams = [
    Exam(subjectName: "Математика 1", dateTime: DateTime(2025, 12, 15, 9, 0), rooms: ["A1", "A2"]),
    Exam(subjectName: "Програмирање", dateTime: DateTime(2025, 12, 18, 12, 0), rooms: ["B3"]),
    Exam(subjectName: "Алгоритми", dateTime: DateTime(2025, 12, 20, 8, 0), rooms: ["C1"]),
    Exam(subjectName: "Бази на податоци", dateTime: DateTime(2025, 11, 2, 11, 0), rooms: ["Lab2"]),
    Exam(subjectName: "Оперативни системи", dateTime: DateTime(2025, 11, 1, 10, 0), rooms: ["A4"]),
    Exam(subjectName: "Мрежи", dateTime: DateTime(2025, 10, 29, 9, 0), rooms: ["B1"]),
    Exam(subjectName: "Веб програмирање", dateTime: DateTime(2025, 10, 25, 13, 0), rooms: ["Lab1"]),
    Exam(subjectName: "Мобилни апликации", dateTime: DateTime(2025, 10, 15, 8, 0), rooms: ["C3"]),
    Exam(subjectName: "Информациски системи", dateTime: DateTime(2025, 10, 10, 14, 0), rooms: ["A2"]),
    Exam(subjectName: "Вештачка интелигенција", dateTime: DateTime(2025, 10, 8, 10, 0), rooms: ["B2"]),
  ];

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Распоред за испити - $studentIndex",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF07272D),
        elevation: 4,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
        ),
      ),

      backgroundColor: const Color(0xFFF2F8F1),

      body: Column(
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              itemCount: exams.length,
              itemBuilder: (context, index) => ExamCard(exam: exams[index]),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF07272D),
              borderRadius:
              BorderRadius.vertical(top: Radius.circular(18)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.school, color: Colors.white),
                const SizedBox(width: 8),
                Text(
                  "Вкупно испити: ${exams.length}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
