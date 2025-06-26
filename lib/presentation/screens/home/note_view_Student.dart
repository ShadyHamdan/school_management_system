import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/core/constants/color.dart';
import 'package:school_management_system/presentation/cubits/home_student/notes_student/student_notes_cubit.dart';

class AddStudentNoteScreen extends StatelessWidget {
  const AddStudentNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final messageController = TextEditingController();

    void submitNote() {
      final title = titleController.text.trim();
      final message = messageController.text.trim();

      if (title.isEmpty || message.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("الرجاء تعبئة جميع الحقول")),
        );
        return;
      }

      context.read<StudentNotesCubit>().addNote(title, message);

      titleController.clear();
      messageController.clear();

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("تم إرسال الملاحظة")));
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const Text(
            "إرسال ملاحظة",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: boldBlueColor,
            ),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: "عنوان الملاحظة",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: messageController,
            maxLines: 5,
            decoration: const InputDecoration(
              labelText: "نص الملاحظة",
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: submitNote,
            icon: const Icon(Icons.send),
            label: const Text("إرسال"),
            style: ElevatedButton.styleFrom(
              backgroundColor: boldBlueColor,
              foregroundColor: whiteColor,
              padding: const EdgeInsets.symmetric(vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

/*
ElevatedButton.icon(
  onPressed: () {
    context.read<StudentNotesCubit>().addNote(
          titleController.text.trim(),
          messageController.text.trim(),
        );
  },
  icon: const Icon(Icons.send),
  label: const Text("إرسال"),
  style: ElevatedButton.styleFrom(
    backgroundColor: boldBlueColor,
    foregroundColor: whiteColor,
    padding: const EdgeInsets.symmetric(vertical: 12),
  ),
),
//
BlocConsumer<StudentNotesCubit, StudentNotesState>(
  listener: (context, state) {
    if (state is StudentNotesSuccess) {
      titleController.clear();
      messageController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.message)),
      );
    } else if (state is StudentNotesError) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(state.error)),
      );
    }
  },
  builder: (context, state) {
    return Column(
      children: [
        // نفس عناصر الإدخال
        if (state is StudentNotesLoading)
          const CircularProgressIndicator(),
        // زر الإرسال هنا
      ],
    );
  },
)
*/
