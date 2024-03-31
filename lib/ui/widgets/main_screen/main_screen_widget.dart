import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/domain/data_providers/session_data_provider.dart';
import 'package:lazyload_app/ui/theme/custom_app_bar.dart';
import 'package:lazyload_app/ui/theme/drawer_menu.dart';
import 'package:lazyload_app/ui/widgets/movie_list/movie_list_model.dart';
import 'package:lazyload_app/ui/widgets/movie_list/movie_list_widget.dart';
import 'package:lazyload_app/ui/widgets/news/new_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;
  final movieListModel = MovieListModel();

  void onSelectIndex(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    movieListModel.setupLocale(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
       appBar: AppBar(
        title: const Text('TMDB'),
        actions: [
          IconButton(
            onPressed: () => SessionDataProvider().setSessionId(null),
            icon: const Icon(Icons.search),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: 'Новости',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_filter),
            label: 'Фильмы',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Сериалы',
          ),
        ],
        onTap: onSelectIndex,
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: [
            const NewsWidget(),
            NotifierProvider(
              create: () => movieListModel,
              isManagingModel: false,
              child: const MovieListWidget(),
            ),
            const Text('Сериалы'),
          ],
        ),
      ),
    );
  }
}
