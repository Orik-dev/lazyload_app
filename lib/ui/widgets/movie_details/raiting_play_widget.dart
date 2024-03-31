import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/navigation/main_navigation.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_model.dart';
import 'package:lazyload_app/ui/widgets/widget.dart';

class RaitingPlayWidget extends StatelessWidget {
  const RaitingPlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        NotifierProvider.watch<MovieDetailsModel>(context)?.movieDetails;
    var voteAverage = movieDetails?.voteAverage ?? 0;

    final videos = movieDetails?.videos.results
        .where((video) => video.type == 'Trailer' && video.site == 'YouTube');

    final trailerKey = videos?.isNotEmpty == true ? videos?.first.key : null;
    voteAverage = voteAverage * 10;

    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            height: 50,
            child: RadialPercentWidget(
              percent: 0.72,
              fillColor: const Color.fromARGB(255, 10, 23, 25),
              lineColor: const Color.fromARGB(255, 37, 203, 103),
              freeColor: const Color.fromARGB(255, 25, 54, 31),
              lineWidth: 5,
              child: Text(
                voteAverage.toStringAsFixed(0),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            'Рейтинг',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 30,
            child: VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
          ),
          Container(width: 1, height: 15, color: Colors.grey),
          trailerKey != null
              ? TextButton(
                  onPressed: () => Navigator.of(context).pushNamed(
                    MainNavigationRouteNames.movieTrailerWidget,
                    arguments: trailerKey,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.play_arrow),
                      Text(
                        'Play Trailer',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
