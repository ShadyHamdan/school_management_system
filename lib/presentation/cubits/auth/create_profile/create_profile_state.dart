part of 'create_profile_cubit.dart';

abstract class CreateProfileState extends Equatable {
  final int currentIndex;
  final String gender;
  final String attribute;

  const CreateProfileState({
    this.currentIndex = 0,
    this.attribute = "Student",
    this.gender = "Male",
  });

  CreateProfileState copyWith({
    int? currentIndex,
    String? gender,
    String? attribute,
  });

  @override
  List<Object> get props => [currentIndex, gender, attribute];
}

class CreateProfileInitial extends CreateProfileState {
  const CreateProfileInitial({
    super.currentIndex = 0,
    super.attribute = "Student",
    super.gender = "Male",
  });

  @override
  CreateProfileInitial copyWith({
    int? currentIndex,
    String? gender,
    String? attribute,
  }) {
    return CreateProfileInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      gender: gender ?? this.gender,
      attribute: attribute ?? this.attribute,
    );
  }
}

class CreateProfileLoading extends CreateProfileState {
  const CreateProfileLoading({
    super.currentIndex,
    super.gender,
    super.attribute,
  });
  @override
  CreateProfileLoading copyWith({
    int? currentIndex,
    String? gender,
    String? attribute,
  }) {
    return CreateProfileLoading(
      currentIndex: currentIndex ?? this.currentIndex,
      gender: gender ?? this.gender,
      attribute: attribute ?? this.attribute,
    );
  }
}

class CreateProfileSuccess extends CreateProfileState {
  final String message;

  const CreateProfileSuccess(
    this.message, {
    super.currentIndex,
    super.gender,
    super.attribute,
  });
  @override
  CreateProfileSuccess copyWith({
    String? message,
    int? currentIndex,
    String? gender,
    String? attribute,
  }) {
    return CreateProfileSuccess(
      message ?? this.message,
      currentIndex: currentIndex ?? this.currentIndex,
      gender: gender ?? this.gender,
      attribute: attribute ?? this.attribute,
    );
  }

  @override
  List<Object> get props => [message, ...super.props];
}

class CreateProfileError extends CreateProfileState {
  final String error;

  const CreateProfileError(
    this.error, {
    super.currentIndex,
    super.gender,
    super.attribute,
  });
  @override
  CreateProfileError copyWith({
    String? error,
    int? currentIndex,
    String? gender,
    String? attribute,
  }) {
    return CreateProfileError(
      error ?? this.error,
      currentIndex: currentIndex ?? this.currentIndex,
      gender: gender ?? this.gender,
      attribute: attribute ?? this.attribute,
    );
  }

  @override
  List<Object> get props => [error, currentIndex];
}
