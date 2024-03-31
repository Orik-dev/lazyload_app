import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/theme/app_colors.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_detail_cast_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_model.dart';
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
  void didChangeDependencies() {
    super.didChangeDependencies();
    NotifierProvider.read<MovieDetailsModel>(context)?.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainBrown,
      appBar: AppBar(
        title: const _TitleWidget(),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      body: const ColoredBox(
        color: Color.fromRGBO(32, 11, 11, 255),
        child: _BodyWidget(),
      ),
    );
  }
}

class _BodyWidget extends StatelessWidget {
  const _BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final movieDetails = model?.movieDetails;
    if(movieDetails==null){
      return const Center(child: CircularProgressIndicator(),);
    }
    return ListView(
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
        );
  }
}

class _TitleWidget extends StatelessWidget {
  const _TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    return Text(model?.movieDetails?.title ?? 'Загрузка...');
  }

 
}
