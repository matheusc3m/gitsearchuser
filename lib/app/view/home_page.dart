import 'package:flutter/material.dart';
import 'package:githubsearch/app/view/shared/search_app_bar_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBarWidget(),
      body: const SizedBox(),
    );
  }
}
