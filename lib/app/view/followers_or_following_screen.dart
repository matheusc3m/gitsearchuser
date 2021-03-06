import 'package:flutter/material.dart';
import 'package:githubsearch/app/controller/app_controller.dart';
import 'package:githubsearch/app/model/user_model.dart';
import 'package:githubsearch/app/view/shared/custom_card_widget.dart';
import 'package:githubsearch/app/view/user_info_screen.dart';

class FollowersOrFollowingScreen extends StatelessWidget {
  String username;
  bool isFollowing;
  final _controller = AppController();
  FollowersOrFollowingScreen({
    Key? key,
    required this.username,
    required this.isFollowing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: FutureBuilder<List<UserModel?>>(
        future: isFollowing
            ? _controller.fetchFollowing(username: username)
            : _controller.fetchFollowers(username: username),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
              padding: const EdgeInsets.all(20),
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => UserInfoScreen(
                          username: snapshot.data![index]!.username,
                        ),
                      ),
                    );
                  },
                  child: CustomCardWidget(
                    name: snapshot.data![index]!.username,
                    avatarUrl: snapshot.data![index]!.avatarUrl,
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
