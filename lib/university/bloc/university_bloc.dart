import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universities_app/university/models/university.dart';
import 'package:universities_app/university_repository.dart';

part 'university_state.dart';
part 'university_event.dart';

class UniversityBloc extends Bloc<UniversityEvent, UniversityState> {
  final UniversityRepository _repository;
  UniversityBloc(this._repository) : super(UniversitiesLoading()) {
    on<LoadUniversities>(getUniversities);
  }

  Future<void> getUniversities(UniversityEvent event, Emitter<UniversityState> emit) async {
    try {
      final List<University> universities = await _repository.getUniversitiesFromApi();
      emit(UniversitiesLoaded(universities));
    }
    catch (err) {
      emit(UniversitiesError(err.toString()));
    }
  }
}