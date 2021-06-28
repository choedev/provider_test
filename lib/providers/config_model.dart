//프리퍼런스 시뮬레이션
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider_test/providers/api_user_model.dart';

/**
 * config 이 프리퍼런스라면 selector
 */
class ConfigModel extends ChangeNotifier {
  int _totalCount = 0;
  int get totalCount => _totalCount;

  void increment() {
    ++_totalCount;
    notifyListeners();
  }

  void update(ApiUserModel model) {
    log('############## udpate!!! ${model.user.age}');
    increment();
  }
}