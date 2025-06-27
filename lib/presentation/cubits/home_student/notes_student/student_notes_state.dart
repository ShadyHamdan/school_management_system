import 'package:equatable/equatable.dart';
import 'package:school_management_system/data/models/student_home/student_note.dart';

class StudentNotesState extends Equatable {
  final List<StudentNote> notes;

  const StudentNotesState({this.notes = const []});

  StudentNotesState copyWith({List<StudentNote>? notes}) {
    return StudentNotesState(notes: notes ?? this.notes);
  }

  @override
  List<Object?> get props => [notes];
}

/*
part of 'student_notes_cubit.dart';

abstract class StudentNotesState {}

class StudentNotesInitial extends StudentNotesState {}

class StudentNotesLoading extends StudentNotesState {}

class StudentNotesSuccess extends StudentNotesState {
  final String message;
  StudentNotesSuccess(this.message);
}

class StudentNotesError extends StudentNotesState {
  final String error;
  StudentNotesError(this.error);
}
*/
