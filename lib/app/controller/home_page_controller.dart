import 'package:githubsearch/app/data/repository/github_repository.dart';
import 'package:githubsearch/app/model/user_model.dart';

class HomePageController {
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
}
