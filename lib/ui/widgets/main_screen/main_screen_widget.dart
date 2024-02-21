import 'package:flutter/material.dart';
import 'package:lazyload_app/ui/theme/custom_app_bar.dart';
import 'package:lazyload_app/ui/theme/drawer_menu.dart';
import 'package:lazyload_app/ui/widgets/movie_list/movie_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedIndex = 0;

  void onSelectIndex(int index) {
    if (_selectedIndex == index) return;
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: const CustomAppBar(),
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
          children: const [
            Text('Новости'),
            MovieListWidget(),
            Text('Сериалы'),
          ],
        ),
      ),
    );
  }
}
