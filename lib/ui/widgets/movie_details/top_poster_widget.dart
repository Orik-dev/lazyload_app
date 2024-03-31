import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/domain/api_client.dart';
import 'package:lazyload_app/entity/movie.dart';
import 'package:lazyload_app/entity/movie_details.dart';
import 'package:lazyload_app/resources/resources.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_model.dart';

class TopPosterWidget extends StatelessWidget {
  const TopPosterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieDetailsModel>(context);
    final backdropPath = model?.movieDetails?.backdropPath;
    final posterPath = model?.movieDetails?.posterPath;
    return AspectRatio(
      aspectRatio: 390 / 219,
      child: Stack(
        children:  [
             backdropPath != null
                ? Image.network(ApiClient.imageUrl(backdropPath))
                : const SizedBox.shrink(),
           Positioned(
            top: 20,
            left: 20,
            bottom: 20,
            child:posterPath != null
                ? Image.network(ApiClient.imageUrl(posterPath))
                : const SizedBox.shrink(),),
        ],
      ),
    );
  }
}
