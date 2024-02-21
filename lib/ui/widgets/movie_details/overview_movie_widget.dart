import 'package:flutter/material.dart';

class OverviewMovieWidget extends StatelessWidget {
  const OverviewMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The world forever changes.',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 17.6,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10),
          Text(
            'Обзор',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          Text(
            'История о жизни физика-теоретика Роберта Оппенгеймера во время Второй мировой войны и разработке им атомной бомбы.',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.6,
                fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 20),
          Text(
            'Christopher Nolan',
            style: TextStyle(
                color: Colors.white,
                fontSize: 17.6,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Director, Writer',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14.6,
                fontWeight: FontWeight.w400),
          ),
        ]);
  }
}
