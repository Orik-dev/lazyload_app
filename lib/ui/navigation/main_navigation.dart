import 'package:flutter/material.dart';
import 'package:lazyload_app/models/auth_model.dart';
import 'package:lazyload_app/ui/widgets/auth/auth.dart';
import 'package:lazyload_app/ui/widgets/main_screen/main_screen_widget.dart';
import 'package:lazyload_app/ui/widgets/movie_details/movie_main_detail/movie_details_widget.dart';

abstract class MainNavigationRouteName {
  static const auth = 'auth';
  static const mainScreen = '/main_screen';
  static const movieDetails = '/main_screen/movie_details';
}

class MainNavigation {
  String initialRoute(bool isAuth) => isAuth
      ? MainNavigationRouteName.mainScreen
      : MainNavigationRouteName.auth;
  final routes = <String, Widget Function(BuildContext)>{
    '/auth': (context) => AuthProvider(model: AuthModel(), child: const Auth()),
    '/main_screen': (context) => const MainScreenWidget(),
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
