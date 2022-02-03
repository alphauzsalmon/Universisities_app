part of 'university_bloc.dart';

abstract class UniversityState extends Equatable {
  const UniversityState();

  @override
  List<Object?> get props => [];
}

class UniversitiesLoading extends UniversityState {}

class UniversitiesLoaded extends UniversityState {
  final List<University> universities;

  const UniversitiesLoaded(this.universities);

  @override
  List<Object?> get props => [universities];
}

class UniversitiesError extends UniversityState {
  final String message;

  const UniversitiesError(this.message);
}

