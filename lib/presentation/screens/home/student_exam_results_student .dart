import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/exam_results/exam_results_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_student/exam_results/exam_results_state.dart';

class ExamResultsScreen extends StatelessWidget {
  const ExamResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExamResultsCubit, ExamResultsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.categorizedResults.isEmpty) {
          return const Center(child: Text("لا توجد نتائج متاحة."));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children:
              state.categorizedResults.entries.map((category) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.key,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: boldBlueColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...category.value.map((exam) {
                      final double rate = (exam.score / exam.total) * 100;
                      final Color resultColor =
                          rate >= 75
                              ? Colors.green
                              : rate >= 50
                              ? Colors.orange
                              : Colors.red;

                      return Card(
                        color: cyanColor,
                        child: ListTile(
                          title: Text(
                            exam.subject,
                            style: const TextStyle(
                              color: whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "النتيجة: ${exam.score}/${exam.total} (${rate.toStringAsFixed(1)}%)",
                            style: const TextStyle(color: whiteColor),
                          ),
                          trailing: Icon(
                            rate >= 75
                                ? Icons.check_circle
                                : rate >= 50
                                ? Icons.warning_amber
                                : Icons.cancel,
                            color: resultColor,
                          ),
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 24),
                  ],
                );
              }).toList(),
        );
      },
    );
  }
}
