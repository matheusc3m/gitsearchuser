import 'package:githubsearch/app/data/dio/custom_dio.dart';
import 'package:githubsearch/app/model/user_model.dart';

class GithubRepository {
  final dio = AppDio.getInstance();
  Future<UserModel?> fetchUser({required String username}) async {
    final response = await dio.get<Map<String, dynamic>>('users/$username');
    try {
      final user = UserModel.fromJson(
        response.data as Map<String, dynamic>,
      );
      return user;
    } catch (e) {
      return null;
    }
  }

  Future<List<UserModel?>> fetchFollowers({required String username}) async {
    final response = await dio.get<List<dynamic>>('users/$username/followers');
    try {
      final users =
          response.data!.map((data) => UserModel.fromJson(data)).toList();

      return users;
    } catch (e) {
      return [];
    }
  }

  Future<List<UserModel?>> fetchFollowing({required String username}) async {
    final response = await dio.get<List<dynamic>>('users/$username/following');
    try {
      final users =
          response.data!.map((data) => UserModel.fromJson(data)).toList();

      return users;
    } catch (e) {
      return [];
    }
  }
}
