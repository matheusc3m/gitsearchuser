import 'package:flutter/material.dart';
import 'package:githubsearch/app/view/user_info_screen.dart';

class SearchAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  SearchAppBarWidget({Key? key})
      : preferredSize = const Size.fromHeight(60.0),
        super(key: key);

  @override
  final Size preferredSize;

  @override
  _SearchAppBarState createState() => _SearchAppBarState();
}

class _SearchAppBarState extends State<SearchAppBarWidget> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return isPressed
        ? AppBar(
            title: TextFormField(
              style: const TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              onFieldSubmitted: (query) {
                setState(() {
                  isPressed = false;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => UserInfoScreen(
                      username: query,
                    ),
                  ),
                );
              },
              decoration: const InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white, size: 30.0),
                contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                hintText: 'Search user',
                hintStyle:
                    TextStyle(color: Colors.grey, fontFamily: 'Quicksand'),
              ),
            ),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isPressed = false;
                  });
                },
                icon: const Icon(Icons.close),
              )
            ],
          )
        : AppBar(
            title: const Text('Github Search'),
            backgroundColor: Colors.black,
            actions: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isPressed = true;
                  });
                },
                icon: const Icon(Icons.search),
              )
            ],
          );
  }
}
