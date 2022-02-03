import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:universities_app/university/bloc/university_bloc.dart';
import 'package:universities_app/university/constants/size_config.dart';
import 'package:universities_app/university/screens/universities_page_widgets.dart';
import 'package:universities_app/university_repository.dart';

class UniversitiesPage extends StatelessWidget {
  const UniversitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return BlocProvider<UniversityBloc>(create: (context) => UniversityBloc(SampleUniversityRepository())..add(LoadUniversities()),
    child: BlocBuilder<UniversityBloc, UniversityState>(builder: (context, state) {
      if (state is UniversitiesError) {
        return Scaffold(
          appBar: AppBarWidget(text: 'Error',),
          body: TextErrorWidget(text: state.message),
        );
      } else if (state is UniversitiesLoaded) {
        return Scaffold(
          appBar: AppBarWidget(text: 'Russian Universities',),
          body: ListViewWidget(universities: state.universities,),
        );
      }
      else {
        return Scaffold(
          appBar: AppBarWidget(text: 'Loading...',),
          body: const CircularProgressIndicatorWidget(),
        );
      }
    },),);
  }

}