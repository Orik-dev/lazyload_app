import 'package:flutter/material.dart';
import 'package:lazyload_app/my_app_model.dart';
import 'package:lazyload_app/ui/navigation/main_navigation.dart';
import 'package:lazyload_app/ui/theme/app_colors.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final model = MyAppModel();
  await model.checkAuth();
  final app = MyApp(model: model);
  runApp( app);
}

class MyApp extends StatelessWidget {
  final MyAppModel model;
  static final mainNavigation = MainNavigation();
  const MyApp({super.key, required this.model});
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
      initialRoute: mainNavigation.initialRoute(model.isAuth),
    );
  }
}
