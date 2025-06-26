import 'package:flutter_bloc/flutter_bloc.dart';
import 'student_notes_state.dart';
import 'package:school_management_system/data/models/student_note.dart';

class StudentNotesCubit extends Cubit<StudentNotesState> {
  StudentNotesCubit() : super(const StudentNotesState());

  void addNote(String title, String message) {
    final note = StudentNote(
      title: title,
      message: message,
      date: DateTime.now(),
    );
    final updatedNotes = List<StudentNote>.from(state.notes)..add(note);
    emit(state.copyWith(notes: updatedNotes));
  }
}
/*
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_management_system/data/models/student_note.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'student_notes_state.dart';

class StudentNotesCubit extends Cubit<StudentNotesState> {
  StudentNotesCubit() : super(StudentNotesInitial());

  Future<void> addNote(String title, String message) async {
    emit(StudentNotesLoading());

    try {
      final note = StudentNote(title: title, message: message);

      final response = await http.post(
        Uri.parse('https://yourapi.com/notes'), // 🔁 ضع رابط الـ API الصحيح
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(note.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        emit(StudentNotesSuccess("تم إرسال الملاحظة بنجاح."));
      } else {
        emit(StudentNotesError("فشل في الإرسال. حاول مرة أخرى."));
      }
    } catch (e) {
      emit(StudentNotesError("خطأ في الاتصال: $e"));
    }
  }
}
*/