import 'package:falack_app/core/cache/cache_helper.dart';
import 'package:falack_app/features/authentication/domain/entities/data_test.dart';

abstract class AuthLocalDataSource {
  Future<void> cacheAuthUser(AuthUser user);
  Future<AuthUser?> getCachedAuthUser();
  Future<void> clearCachedAuthUser();
}



class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  static const String CACHED_AUTH_USER = 'CACHED_AUTH_USER';

  @override
  Future<void> cacheAuthUser(AuthUser user) async {
    final jsonUser = {
      'email': user.email,
      'phone_number': user.phoneNumber,
      'token': user.token,
    };
    await CacheHelper.saveJsonData(key: CACHED_AUTH_USER, jsonData: jsonUser);
  }

  @override
  Future<AuthUser?> getCachedAuthUser() async {
    final jsonData = CacheHelper.getJsonData(key: CACHED_AUTH_USER);
    if (jsonData != null) {
      return AuthUser.fromJson(jsonData);
    }
    return null;
  }

  @override
  Future<void> clearCachedAuthUser() async {
    await CacheHelper.removeData(key: CACHED_AUTH_USER);
  }
}
