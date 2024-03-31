import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_model.dart';

class MovieNameWidget extends StatelessWidget {
  const MovieNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    var  year = model?.movieDetails?.releaseDate?.year.toString();
    year = year !=null ?  '  (${year})' : '';
    return RichText(
      textAlign: TextAlign.center,
      maxLines: 3,
      text:  TextSpan(
        children: [
          TextSpan(
            text: model?.movieDetails?.title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: year,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
