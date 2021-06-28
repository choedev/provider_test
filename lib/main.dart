import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:provider_test/pages/main_page.dart';
import 'package:provider_test/providers/api_user_model.dart';
import 'package:provider_test/providers/config_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: _initProviders(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

List<SingleChildWidget> _initProviders() {
  return [
    ChangeNotifierProvider(
      create: (context) => ApiUserModel(),
    ),
    ChangeNotifierProxyProvider<ApiUserModel, ConfigModel>(
      create: (context) {
        log('------->>> create');
        return ConfigModel();
      },
      update: (context, userModel, configModel) {
        //  context로 직접 프로바이더 변셩하지 말것
        log('------->>> update ${userModel}:${userModel == null}, ${configModel}:${configModel == null}');
        if (configModel == null)
          return ConfigModel();

        return configModel..update(userModel);
      }
    ),
  ];
}
