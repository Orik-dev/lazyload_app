import 'package:flutter/material.dart';
import 'package:lazyload_app/ui/widgets/auth/form_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Войти в свою учётную запись',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Чтобы пользоваться правкой и возможностями рейтинга TMDB, а также получить персональные рекомендации, необходимо войти в свою учётную запись. Если у вас нет учётной записи, её регистрация является бесплатной и простой., чтобы начать.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          TextButton(onPressed: () {}, child: const Text('Зарегистрироваться')),
          const SizedBox(height: 16),
          const Text(
            'Если Вы зарегистрировались, но не получили письмо для подтверждения, проверьте свой почтовый ящик.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: Colors.black,
            ),
          ),
          TextButton(
              onPressed: () {},
              child: const Text('Верифицировать почтовый адрес')),
          const SizedBox(height: 20),
           FormWidget(),
        ],
      ),
    );
  }
}
