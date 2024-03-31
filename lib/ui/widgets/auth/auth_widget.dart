import 'package:flutter/material.dart';
import 'package:lazyload_app/ui/theme/app_colors.dart';
import 'package:lazyload_app/ui/theme/custom_app_bar.dart';
import 'package:lazyload_app/ui/theme/drawer_menu.dart';
import 'package:lazyload_app/ui/widgets/auth/header_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
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
