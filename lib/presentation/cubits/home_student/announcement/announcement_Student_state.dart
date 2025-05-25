import 'package:equatable/equatable.dart';

class AnnouncementStudentState extends Equatable {
  final List<String> ads; // يمكن تغييرها إلى نموذج إعلان لاحقًا
  final bool isLoading;
  final String? error;
  final Set<int> expandedIndexes;
  const AnnouncementStudentState({
    this.ads = const [],
    this.isLoading = false,
    this.error,
    this.expandedIndexes = const {},
  });

  AnnouncementStudentState copyWith({
    List<String>? ads,
    bool? isLoading,
    String? error,
    Set<int>? expandedIndexes,
  }) {
    return AnnouncementStudentState(
      ads: ads ?? this.ads,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      expandedIndexes: expandedIndexes ?? this.expandedIndexes,
    );
  }

  @override
  List<Object?> get props => [ads, isLoading, error, expandedIndexes];
}
