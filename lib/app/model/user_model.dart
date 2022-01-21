import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: 'avatar_url')
  final String avatarUrl;
  @JsonKey(name: 'name')
  final String? fullName;
  @JsonKey(name: 'login')
  final String username;

  final int? followers;
  final int? following;

  const UserModel({
    required this.avatarUrl,
    required this.fullName,
    required this.username,
    required this.followers,
    required this.following,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
