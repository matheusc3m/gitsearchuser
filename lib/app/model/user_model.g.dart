// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      avatarUrl: json['avatar_url'] as String,
      fullName: json['name'] as String?,
      username: json['login'] as String,
      followers: json['followers'] as int?,
      following: json['following'] as int?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'avatar_url': instance.avatarUrl,
      'name': instance.fullName,
      'login': instance.username,
      'followers': instance.followers,
      'following': instance.following,
    };
