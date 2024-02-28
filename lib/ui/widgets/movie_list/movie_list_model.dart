import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:lazyload_app/domain/api_client.dart';
import 'package:lazyload_app/entity/movie.dart';
import 'package:lazyload_app/ui/navigation/main_navigation.dart';

class MovieListModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _movies = <Movie>[];
  late String _locale;

  List<Movie> get movies => List.unmodifiable(_movies);
  final _dateFormat = DateFormat.yMMMMd();

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  Future<void> loadMovies() async {
    final moviesResponse = await _apiClient.popularMovie(1, 'ru-Ru');
    _movies.addAll(moviesResponse.movies);
    notifyListeners();
  }

  void setupLocale(BuildContext context){
    final locale = Localizations.localeOf(context);
  }

  void onMovieTap(BuildContext context, int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      MainNavigationRouteName.movieDetails,
      arguments: id,
    );
  }
}
