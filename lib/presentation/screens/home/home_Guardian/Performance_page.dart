import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_guardian/Student_performance/Performance_cubit.dart';
import 'package:school_management_system/presentation/cubits/home_guardian/Student_performance/performance_state.dart';

class PerformancePage extends StatefulWidget {
  final int studentId;
  final int parentId;
  const PerformancePage({
    required this.studentId,
    required this.parentId,
    super.key,
  });

  @override
  State<PerformancePage> createState() => _PerformancePageState();
}

class _PerformancePageState extends State<PerformancePage> {
  File? justificationFile;
  String? fileError;

  Future<void> pickJustificationFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png', 'pdf'],
    );

    if (result != null && result.files.isNotEmpty) {
      final file = File(result.files.single.path!);
      final ext = file.path.split('.').last.toLowerCase();

      if (!['jpg', 'jpeg', 'png', 'pdf'].contains(ext)) {
        setState(
          () => fileError = 'صيغة غير مدعومة. الصيغ المسموح بها: JPG, PNG, PDF',
        );
        return;
      }

      setState(() {
        justificationFile = file;
        fileError = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) =>
              PerformanceCubit()
                ..fetchPerformance(widget.studentId, widget.parentId),
      child: Scaffold(
        body: BlocBuilder<PerformanceCubit, PerformanceState>(
          builder: (context, state) {
            if (state is PerformanceLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is PerformanceError) {
              return Center(
                child: Text(state.message, style: TextStyle(color: Colors.red)),
              );
            } else if (state is PerformanceLoaded) {
              final p = state.performance;
              return SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    Card(
                      color: cyanColor,
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        title: Text(
                          "نسبة الحضور: ${p.attendancePercentage}%",
                          style: TextStyle(color: whiteColor),
                        ),
                        subtitle: Text(
                          "نسبة الغياب: ${p.absencePercentage}%",
                          style: TextStyle(color: whiteColor),
                        ),
                        trailing: Text(
                          "المعدل: ${p.averageGrade}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Text(
                      "تبرير الغياب",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: boldBlueColor,
                      ),
                    ),
                    SizedBox(height: 12),
                    justificationFile != null
                        ? Text(
                          "تم اختيار الملف: ${justificationFile!.path.split('/').last}",
                          style: TextStyle(color: boldBlueColor),
                        )
                        : Text(
                          "لم يتم اختيار ملف",
                          style: TextStyle(color: boldBlueColor),
                        ),
                    if (fileError != null) ...[
                      SizedBox(height: 8),
                      Text(fileError!, style: TextStyle(color: Colors.red)),
                    ],
                    SizedBox(height: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cyanColor, // لون الخلفية
                      ),
                      onPressed: pickJustificationFile,
                      icon: Icon(Icons.upload_file, color: boldBlueColor),
                      label: Text(
                        "إرفاق تبرير",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cyanColor, // لون الخلفية
                      ),
                      onPressed:
                          justificationFile != null
                              ? () {
                                // TODO: إرسال الملف إلى API
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: cyanColor,
                                    content: Text(
                                      "تم رفع التبرير بنجاح (محاكاة).",
                                      style: TextStyle(color: whiteColor),
                                    ),
                                  ),
                                );
                              }
                              : null,
                      child: Text(
                        "إرسال التبرير",
                        style: TextStyle(color: whiteColor),
                      ),
                    ),
                  ],
                ),
              );
            }
            return SizedBox();
          },
        ),
      ),
    );
  }
}
