import 'package:flutter/material.dart';
import 'package:lazyload_app/widgets/widget.dart';

class RaitingPlayWidget extends StatelessWidget {
  const RaitingPlayWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 50,
          height: 50,
          child: RadialPercentWidget(
            percent: 0.72,
            fillColor: Color.fromARGB(255, 10, 23, 25),
            lineColor: Color.fromARGB(255, 37, 203, 103),
            freeColor: Color.fromARGB(255, 25, 54, 31),
            lineWidth: 5,
            child: Text(
              '72%',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Рейтинг',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
          child: VerticalDivider(
            color: Colors.grey,
            thickness: 1,
          ),
        ),
        Expanded(
          child: TextButton.icon(
            icon: const Icon(Icons.play_arrow, color: Colors.white),
            onPressed: () {},
            label: const Text(
              'Воспроизвести трейлер',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
