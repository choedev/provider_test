import 'package:flutter/material.dart';
import 'package:provider_test/providers/api_user_model.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/config_model.dart';

class ProviderWatchPage extends StatefulWidget {
  const ProviderWatchPage({Key? key}) : super(key: key);

  @override
  _ProviderWatchPage createState() => _ProviderWatchPage();
}

class _ProviderWatchPage extends State<ProviderWatchPage> {
  @override
  Widget build(BuildContext context) {
    /**
     * 값을 바로 사용하는 경우라면 consumer
     */

    var provider = context.read<ApiUserModel>();
    context.watch<ApiUserModel>();

    var config = context.read<ConfigModel>();
    context.select<ConfigModel, int>((value) => value.totalCount);

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.network(provider.user.picture)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildText(provider.user.name, 24),
                ),
                _buildText(provider.user.age.toString(), 48),
                _buildText(config.totalCount.toString(), 21),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    child: _buildText('데이터 변경', 32),
                    onPressed: () async {
                      provider.getUser();
                    },
                  ),
                ),
                if (provider.isLoading) CircularProgressIndicator(),
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
