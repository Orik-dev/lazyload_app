import 'package:flutter/material.dart';
import 'package:lazyload_app/Libary/Widgets/inherited/provider.dart';
import 'package:lazyload_app/ui/widgets/auth/auth_model.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.read<AuthModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessage(),
        const SizedBox(height: 16),
        const Text(
          'Имя пользователя',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: model?.loginTextController,
          decoration: const InputDecoration(
            hintText: 'Введите имя пользователя',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Пароль',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
        ),
        TextField(
          obscureText: true,
          controller: model?.passwordTextController,
          // Используйте ! для инвертирования значения
          decoration: const InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(3))),
          ),
        ),
        const SizedBox(height: 10),
        const SizedBox(height: 30),
        Row(children: [
          _AuthButtonWidget(model: model),
          const SizedBox(width: 20),
          TextButton(
            onPressed: () {},
            child: const Text('Сбросить пароль'),
          )
        ])
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({
    super.key,
    required this.model,
  });

  final AuthModel? model;

  @override
  Widget build(BuildContext context) {
    final model = NotifierProvider.watch<AuthModel>(context);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            width: 15,
            height: 15,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: Colors.white,
            ),
          )
        : const Text(
            'Войти',
            style: TextStyle(color: Colors.white),
          );
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color.fromRGBO(1, 180, 228, 1.0),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
        ),
        child: child);
  }
}

class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final errorMessage = NotifierProvider.watch<AuthModel>(context)?.errorMesage;
    if (errorMessage == null) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
