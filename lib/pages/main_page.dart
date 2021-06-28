import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/pages/consumer_page.dart';
import 'package:provider_test/pages/provider_watch_page.dart';
import 'package:provider_test/providers/api_user_model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    var provider = context.read<ApiUserModel>();
    context.watch<ApiUserModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Center(
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProviderWatchPage()),
                      );
                    },
                    child: Text(
                      "Watch",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ConsumerPage()),
                      );
                    },
                    child: Text(
                      "Consumer",
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
