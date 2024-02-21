import 'package:flutter/material.dart';
import 'package:lazyload_app/ui/navigation/main_navigation.dart';
import 'package:lazyload_app/ui/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static final  mainNavigation = MainNavigation();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: AppColors.mainDarkBlue,
          ),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarkBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          )),
      routes: mainNavigation.routes,
      initialRoute: mainNavigation.initialRoute(false),
    );
  }
}
