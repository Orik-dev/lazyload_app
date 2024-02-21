import 'package:flutter/material.dart';
import 'package:lazyload_app/ui/theme/app_colors.dart';
import 'package:lazyload_app/ui/theme/custom_app_bar.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_detail_cast_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_name_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/overview_movie_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/raiting_play_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/summery_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/top_poster_widget.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int movieId;

  const MovieDetailsWidget({required this.movieId, super.key});

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBrown,
      appBar: const CustomAppBar(),
      body: ColoredBox(
        color: const Color.fromRGBO(32, 11, 11, 255),
        child: ListView(
          children: const [
            TopPosterWidget(),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: MovieNameWidget(),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: RaitingPlayWidget(),
            ),
            SummeryWidget(),
            Padding(
              padding: EdgeInsets.all(20),
              child: OverviewMovieWidget(),
            ),
            MovieDetailCastWidget(),
          ],
        ),
      ),
    );
  }
}
