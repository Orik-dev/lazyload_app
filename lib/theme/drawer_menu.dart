import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Обработчик нажатия для первого элемента
              Navigator.pop(context); // закрываем боковое меню
              // Ваш код для обработки нажатия на Item 1
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
              // Обработчик нажатия для второго элемента
              Navigator.pop(context); // закрываем боковое меню
              // Ваш код для обработки нажатия на Item 2
            },
          ),
          // Добавьте дополнительные элементы меню по необходимости
        ],
      ),
    );
  }
}
