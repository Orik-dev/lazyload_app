import 'package:flutter/material.dart';
import 'package:lazyload_app/theme/app_colors.dart';
import 'package:lazyload_app/theme/custom_app_bar.dart';
import 'package:lazyload_app/theme/drawer_menu.dart';
import 'package:lazyload_app/widgets/auth/header_widget.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      backgroundColor: AppColors.mainDarkBlue,
      appBar: const CustomAppBar(),
      body: Scrollbar(
        child: ListView(
          children: const [
            HeaderWidget(),
          ],
        ),
      ),
    );
  }
}
