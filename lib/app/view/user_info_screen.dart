import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:githubsearch/app/controller/home_page_controller.dart';
import 'package:githubsearch/app/model/user_model.dart';
import 'package:githubsearch/app/view/followers_or_following_screen.dart';

class UserInfoScreen extends StatelessWidget {
  final String username;
  final _controller = HomePageController();
  UserInfoScreen({
    required this.username,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('User Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: FutureBuilder<UserModel?>(
          future: _controller.fetchUser(username: username),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(snapshot.data!.avatarUrl),
                    backgroundColor: Colors.transparent,
                  ),
                  Text(
                    snapshot.data!.fullName ?? snapshot.data!.username,
                    style: const TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FollowersOrFollowingScreen(
                                isFollowing: false,
                                username: username,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_pin_outlined),
                        label: Text('${snapshot.data!.followers} Followers'),
                      ),
                      TextButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => FollowersOrFollowingScreen(
                                isFollowing: true,
                                username: username,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.queue),
                        label: Text('${snapshot.data!.following} Following'),
                      ),
                    ],
                  )
                ],
              );
            } else if (snapshot.hasError && snapshot.error is DioError) {
              final dioError = snapshot.error as DioError;
              switch (dioError.response!.statusCode) {
                case 404:
                  return const Center(
                    child: Text('Not found!'),
                  );
                default:
                  return Center(
                    child: Text('Error ${dioError.message}'),
                  );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
