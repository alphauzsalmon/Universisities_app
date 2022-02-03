import 'package:flutter/material.dart';
import 'package:universities_app/university/constants/size_config.dart';
import 'package:universities_app/university/models/university.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  final String text;
  AppBarWidget({Key? key, required this.text})
      : preferredSize = Size.fromHeight(getHeight(44.0)),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        text,
        style: const TextStyle(color: Colors.black),
      ),
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    );
  }

  @override
  final Size preferredSize;
}

class TextErrorWidget extends StatelessWidget {
  final String text;
  const TextErrorWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}

class ListViewWidget extends StatelessWidget {
  final List<University> universities;
  const ListViewWidget({Key? key, required this.universities})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  universities[index].name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(universities[index].country!),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getHeight(35.0),
                      ),
                      child: const Text('WebPages: '),
                    ),
                    SizedBox(
                      height: getHeight(50.0),
                      width: getWidth(200.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, j) {
                          return Text(universities[index].webPages![j]);
                        },
                        itemCount: universities[index].webPages!.length,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: getHeight(35.0),
                      ),
                      child: const Text('Domains: '),
                    ),
                    SizedBox(
                      height: getHeight(50.0),
                      width: getWidth(200.0),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, i) {
                          return Text(universities[index].domains![i]);
                        },
                        itemCount: universities[index].domains!.length,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        itemCount: universities.length,
      ),
    );
  }
}

class CircularProgressIndicatorWidget extends StatelessWidget {
  const CircularProgressIndicatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
