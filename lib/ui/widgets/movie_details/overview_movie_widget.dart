import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_model.dart';

class OverviewMovieWidget extends StatelessWidget {
  const OverviewMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Overview',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),
          Text(
            model?.movieDetails?.overview ?? '',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 16.6,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
        ]);
  }
}
