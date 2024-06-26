import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/domain/api_client.dart';
import 'package:lazyload_app/ui/widgets/movie_list/movie_list_model.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<MovieListModel>(context);
    if (model == null) return const SizedBox.shrink();
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: model.movies.length,
            itemExtent: 163,
            itemBuilder: (context, index) {
              final movie = model.movies[index];
              final posterPath = movie.posterPath;
              final releaseDate = movie.releaseDate;
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          posterPath != null
                              ? Image.network(
                                  ApiClient.imageUrl(posterPath),
                                )
                              : const SizedBox.shrink(),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                const SizedBox(height: 15),
                                Text(
                                  movie.title,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  model.stringFromDate(movie.releaseDate),
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  movie.overview,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 5),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => model.onMovieTap(context, index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Поиск',
                filled: true,
                fillColor: Colors.white.withAlpha(235),
                border: const OutlineInputBorder()),
          ),
        )
      ],
    );
  }
}
