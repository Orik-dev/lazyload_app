import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lazyload_app/resources/resources.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CustomAppBarState extends State<CustomAppBar> {
  void _openDrawer(BuildContext context) {
    setState(() {
      Scaffold.of(context).openDrawer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => _openDrawer(context),
        color: Colors.white,
        icon: const Icon(Icons.menu),
      ),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
          color: Colors.blue,
        ),
      ],
      title: SvgPicture.asset(
        AppImages.logo,
        width: 55,
        height: 40,
        colorFilter: const ColorFilter.mode(
          Color.fromRGBO(144, 206, 161, 1.0),
          BlendMode.srcIn,
        ),
      ),
      centerTitle: true,
    );
  }
}
