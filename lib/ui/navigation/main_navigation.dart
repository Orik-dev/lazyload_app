import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/widgets/auth/auth_model.dart';
import 'package:lazyload_app/ui/widgets/auth/auth.dart';
import 'package:lazyload_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_widget.dart';

abstract class MainNavigationRouteName {
  static const auth = 'auth';
  static const mainScreen = '/';
  static const movieDetails = '/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteName.mainScreen
      : MainNavigationRouteName.auth;
  final routes = <String, Widget Function(BuildContext)>{
   MainNavigationRouteName.auth: (context) => NotifierProvider(model: AuthModel(), child: const Auth()),
    MainNavigationRouteName.mainScreen: (context) => const MainScreenWidget(),
    '/main_screen/movie_details': (context) {
      final arguments = ModalRoute.of(context)?.settings.arguments as int;
      if (arguments is int) {
        return MovieDetailsWidget(movieId: arguments);
      } else {
        return const MovieDetailsWidget(movieId: 0);
      }
    }
  };
}
