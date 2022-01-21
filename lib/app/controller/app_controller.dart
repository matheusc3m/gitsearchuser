import 'package:githubsearch/app/data/repository/github_repository.dart';
import 'package:githubsearch/app/model/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

class AppController {
  final repository = GithubRepository();

  Future<UserModel?> fetchUser({required String username}) async {
    return await repository.fetchUser(username: username);
  }

  Future<List<UserModel?>> fetchFollowers({required String username}) async {
    return await repository.fetchFollowers(username: username);
  }

  Future<List<UserModel?>> fetchFollowing({required String username}) async {
    return await repository.fetchFollowing(username: username);
  }

  Future<void> openBrowserTab({required String link}) async {
    if (await canLaunch(link)) {
      await launch(link);
    } else {
      throw 'Could not launch $link';
    }
  }
}
