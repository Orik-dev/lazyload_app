import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lazyload_app/domain/api_client.dart';
import 'package:lazyload_app/domain/data_providers/session_data_provider.dart';
import 'package:lazyload_app/ui/navigation/main_navigation.dart';

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
    int? accountId;
    try {
      sessionId = await _apiClient.auth(
        username: login,
        password: password,
      );
      accountId = await _apiClient.getAccountInfo(sessionId);
    } catch (e) {
      _errorMessage = 'Неправильный логин и пароль!';
    }
    _isAuthProgress = false;
    if (errorMesage != null) {
      notifyListeners();
      return;
    }
    if (sessionId == null || accountId == null) {
      _errorMessage = 'Неизвестная ошибка,повторите попытку';
      notifyListeners();
      return;
    }
    await _sessionDataProvider.setSessionId(sessionId);
    await _sessionDataProvider.setAccountId(accountId);
    unawaited(
      Navigator.of(context)
          .pushReplacementNamed(MainNavigationRouteNames.mainScreen),
    );
  }
}
