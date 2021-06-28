import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/api_user_model.dart';

class ConsumerPage extends StatefulWidget {
  const ConsumerPage({Key? key}) : super(key: key);

  @override
  _ConsumerPageState createState() => _ConsumerPageState();
}

class _ConsumerPageState extends State<ConsumerPage> {
  @override
  void initState() {
    context.read<ApiUserModel>().clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: SafeArea(
        child: Consumer<ApiUserModel>(
          builder: (BuildContext context, model, Widget? child) {
            log('==> Value Type value: ${model}');
            if (model.user.name.isEmpty) {
              log('==> draw here');
              return child ?? Container();
            }

            return Container(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.network(model.user.picture)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildText(model.user.name, 24),
                    ),
                    _buildText(model.user.age.toString(), 48),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                        child: _buildText('GET USER', 32),
                        onPressed: () async {
                          model.getUser();
                        },
                      ),
                    ),
                    if (model.isLoading) CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '데이터가 없습니다.',
                  style: TextStyle(fontSize: 24),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    child: _buildText('GET USER', 32),
                    onPressed: () async {
                      context.read<ApiUserModel>().getUser();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildText(String title, double fontSize) {
    return Text(
      title,
      style: TextStyle(fontSize: fontSize),
    );
  }
}
