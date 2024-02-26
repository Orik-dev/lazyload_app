import 'package:flutter/material.dart';
import 'package:lazyload_app/models/movie.dart';
import 'package:lazyload_app/resources/resources.dart';
import 'package:lazyload_app/ui/navigation/main_navigation.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({super.key});

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  final _movies = [
    Movie(
        id: 1,
        title: 'Оппенгеймер',
        description:
            'В этой музыкальной комедии про переходный возраст Адам Сэндлер играет ящерицу по имени Лео, глазами которой мы наблюдаем за последним годом начальной школы.',
        imageName: AppImages.fireGamer,
        time: '19 Июля 2023'),
    Movie(
        id: 2,
        title: 'Cоздатель',
        description:
            'События разворачиваются в будущем, во время войны между людьми и искусственным интеллектом. Бывший спецназовец Джошуа вместе с отрядом оперативников получает задание найти и убить архитектора продвинутого искусственного интеллекта — Создателя, который разработал оружие, способное положить конец не только войне, но и всему человечеству.',
        imageName: AppImages.sozdatel,
        time: '27 Сентября 2023'),
    Movie(
        id: 3,
        title: 'Форсаж X',
        description:
            'Дом Торетто и его семья становятся мишенью для мстительного сына наркобарона Эрнана Рейеса.',
        imageName: AppImages.fastfuriosX,
        time: '17 Мая 2023'),
    Movie(
        id: 4,
        title: 'Солдат',
        description:
            'История человека, который мстит коварному торговцу оружием, подставившему и погубившему его родителей.',
        imageName: AppImages.soldat,
        time: '7 Сентября 2023'),
    Movie(
        id: 5,
        title: 'Наполеон',
        description:
            'Оригинальный и личный взгляд на происхождение Наполеона и его стремительное, безжалостное восхождение к престолу, рассматриваемый через призму его захватывающих и часто неустойчивых отношений со своей женой и единственной настоящей любовью, Жозефиной.',
        imageName: AppImages.napoleon,
        time: '22 Ноября 2023'),
    Movie(
        id: 6,
        title: 'Великий урванитель 3',
        description:
            'Покончив с работой тайного агента Роберт Макколл продолжает отстаивать правду в повседневной жизни и защищать тех, кто в этом нуждается. Находясь в Южной Италии он узнает, что его друзья оказались под влиянием местных криминальных авторитетов. Когда события обостряются, Макколл решает встать на защиту справедливости, вступив в борьбу с мафией.',
        imageName: AppImages.uravnitel,
        time: '30 Августа 2023'),
  ];

  var _filteredMovies = <Movie>[];
  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
   Navigator.of(context).pushNamed(MainNavigationRouteName.mainScreen,arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: const EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (context, index) {
              final movie = _filteredMovies[index];
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
                          Image.asset(
                            movie.imageName,
                            width: 94,
                            height: 141,
                          ),
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
                                  movie.time,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  movie.description,
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
                        onTap: () => _onMovieTap(index),
                      ),
                    )
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            controller: _searchController,
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
