import 'package:flutter/material.dart';
import 'package:provider_test/apis/api_user.dart';
import 'package:provider_test/apis/model/user.dart';

final defaultImg = 'https://usagi-post.com/wp-content/uploads/2020/05/no-image-found-360x250-1.png';

class ApiUserModel extends ChangeNotifier {
  ApiUser _api = ApiUser();

  User _user = User('', 0, defaultImg);
  User get user => _user;

  Exception? _e;
  Exception? get e => _e;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  getUser() async {
    _isLoading = false;
    _e = null;

    try {
      _isLoading = true;
      notifyListeners();

      _user = await _api.getUser();

    } catch(ex) {
      _e = ex as Exception;
    }

    _isLoading = false;
    notifyListeners();
  }

  clear() {
    _user = User('', 0, defaultImg);
    // notifyListeners();
  }
}