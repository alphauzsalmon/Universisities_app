import 'package:dio/dio.dart';
import 'package:universities_app/university/models/university.dart';

abstract class UniversityRepository {
  Future<List<University>> getUniversitiesFromApi();
}

class SampleUniversityRepository extends UniversityRepository {
  @override
  Future<List<University>> getUniversitiesFromApi() async {
    final Response response = await Dio().get('http://universities.hipolabs.com/search?country=Russian+Federation');

    switch (response.statusCode) {
      case 200:
        return (response.data as List).map((e) => University.fromJson(e)).toList();
      default:
        throw NetworkError(response.statusCode);
    }
  }
}

class NetworkError implements Exception {
  final int? message;
  NetworkError(this.message);
}