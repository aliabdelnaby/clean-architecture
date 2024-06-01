import 'dart:convert';

import 'package:clean_architecture/core/database/cache/cache_helper.dart';
import 'package:clean_architecture/core/errors/expentions.dart';
import 'package:clean_architecture/features/user/data/models/user_model.dart';

class UserLocalDataSource {
  final CacheHelper cacheHelper;
  final String key = "CachedUser";
  UserLocalDataSource({required this.cacheHelper});

  cacheUserData(UserModel? userToCache) async {
    if (userToCache != null) {
      await cacheHelper.saveData(
          key: key, value: json.encode(userToCache.toJson()));
    } else {
      throw CacheExeption(errorMessage: "No internet connection");
    }
  }

  Future<UserModel> getCachedUserData() async {
    final userJson = cacheHelper.getDataString(key: key);
    if (userJson != null) {
      return Future.value(UserModel.fromJson(json.decode(userJson)));
    } else {
      throw CacheExeption(errorMessage: "No internet connection");
    }
  }
}
