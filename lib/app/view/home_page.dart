import 'package:flutter/material.dart';
import 'package:githubsearch/app/view/shared/search_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SearchAppBarWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              height: 200,
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/25/25231.png',
              ),
            ),
          ),
          const Text(
            'Search any user in github',
            style: TextStyle(fontSize: 25),
          ),
        ],
      ),
    );
  }
}
