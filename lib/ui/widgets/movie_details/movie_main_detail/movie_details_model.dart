import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lazyload_app/domain/api_client.dart';
import 'package:lazyload_app/domain/data_providers/session_data_provider.dart';
import 'package:lazyload_app/entity/movie_details.dart';

class MovieDetailsModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final _sessionDataProvider = SessionDataProvider();

  final int movieId;
  MovieDetails? _movieDetails;
  String _locale = '';
  late DateFormat _dateFormat;
  bool _isFavorite = false;

  MovieDetails? get movieDetails => _movieDetails;
  bool get isFavorite => _isFavorite;

  String stringFromDate(DateTime? date) =>
      date != null ? _dateFormat.format(date) : '';

  MovieDetailsModel(this.movieId);

  Future<void> setupLocale(BuildContext context) async {
    final locale = Localizations.localeOf(context).toLanguageTag();
    if (_locale == locale) return;
    _locale = locale;
    _dateFormat = DateFormat.yMMMMd(locale);
    await loadDetails();
  }

  Future<void> loadDetails() async {
    final sessionId = await _sessionDataProvider.getSessionId();
    _movieDetails = await _apiClient.movieDetails(movieId, _locale);
    if (sessionId != null) {
     _isFavorite = await _apiClient.isFavorite(movieId,sessionId);
    }
    notifyListeners();
  }
}
