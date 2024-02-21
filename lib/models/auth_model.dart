import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyload_app/domain/api_client.dart';
import 'package:lazyload_app/domain/data_providers/session_data_provider.dart';

class AuthModel extends ChangeNotifier {
  final _apiClient = ApiClient();
  final loginTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final _sessionDataProvider = SessionDataProvider();

  String? _errorMessage;
  String? get errorMesage => _errorMessage;


  bool _isAuthProgress = false;
  bool get isAuthProgress => _isAuthProgress;
  bool get canStartAuth => !_isAuthProgress;



  Future<void> auth(BuildContext context) async {
    final login = loginTextController.text;
    final password = passwordTextController.text;
    if (login.isEmpty || password.isEmpty) {
      _errorMessage = 'Заполните логин и пароль';
      notifyListeners();
      return;
    }
    _errorMessage = null;
    _isAuthProgress = true;
    notifyListeners();
    String? sessionId;
    try{
       sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
    }catch(e){
    _errorMessage = 'Неправильный логин и пароль!';
    }
    _isAuthProgress = false;
    if(errorMesage != null ){
      notifyListeners();
      return;
    }
    if(sessionId == null){
      _errorMessage = 'Неизвестная ошибка,повторите попытку';
      notifyListeners();
      return;
    }
   await  _sessionDataProvider.setSessionId(sessionId);
    unawaited(Navigator.of(context).pushNamed('/main_screen'));
  }
}

class AuthProvider extends InheritedNotifier {
  final AuthModel model;

  const AuthProvider({
    super.key,
    required this.model,
    required Widget child,
  }) : super(
          child: child,
          notifier: model,
        );

  static AuthProvider watch(BuildContext context) {
    final AuthProvider? result =
        context.dependOnInheritedWidgetOfExactType<AuthProvider>();
    assert(result != null, 'No AuthProvider found in context');
    return result!;
  }

  static AuthProvider? read(BuildContext context) {
    final widget =
        context.getElementForInheritedWidgetOfExactType<AuthProvider>()?.widget;
    return widget is AuthProvider ? widget : null;
  }
}
