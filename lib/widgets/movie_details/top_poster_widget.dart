import 'package:flutter/material.dart';
import 'package:lazyload_app/resources/resources.dart';

class TopPosterWidget extends StatelessWidget {
  const TopPosterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Image(
          image: AssetImage(AppImages.backfire),
        ),
        Positioned(
          top: 20,
          left: 20,
          bottom: 20,
          child: Image(
            image: AssetImage(AppImages.fireGamer),
          ),
        ),
      ],
    );
  }
}
