import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_model.dart';

class SummeryWidget extends StatelessWidget {
  const SummeryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    if(model == null) return const SizedBox.shrink();
     var texts = <String>[];
     final releaseDate =  model.movieDetails?.releaseDate;
     if(releaseDate != null){
      texts.add(model.stringFromDate(releaseDate));
     }
     final productionCountries = model.movieDetails?.productionCountries;
     if(productionCountries != null && productionCountries.isNotEmpty){
      texts.add('(${productionCountries.first.iso})');
     }

     final runtime = model.movieDetails?.runtime ?? 0;
     final duration = Duration(minutes: runtime);
     final hours = duration.inHours;
     final minutes = duration.inMinutes.remainder(60);
     texts.add('$hours h $minutes m ');

     final genres = model.movieDetails?.genres;
    if(genres != null && genres.isNotEmpty){
      var genresNames = <String>[];
      for(var genr in genres){
        genresNames.add(genr.name);
      }
      texts.add(genresNames.join(', '));
    }
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(29, 10, 10, 1.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromRGBO(29, 10, 10, 1.0).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
          ),
        ],
      ),
      child:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
        child: Text(
          texts.join(''),
          textAlign: TextAlign.center,
          maxLines: 3,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
