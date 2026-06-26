import 'package:flutter_rconnect/app/common/config/api_config.dart';
import 'package:flutter_rconnect/app/data/helper/repository_helper.dart';
import 'package:flutter_rconnect/app/data/models/user_model.dart';
import 'package:fpdart/fpdart.dart';

abstract class AuthRepository {
  Future<Either<String, String>> loginUser({
    required String username,
    required String password,
    String? deviceToken,
    String? deviceId,
    String? deviceName,
    String? deviceType,
    String? version,
  });
  Future<Either<String, User>> getUserData();
}

class AuthRepositoryImpl extends RepositoryHelper implements AuthRepository {
  @override
  Future<Either<String, String>> loginUser({
    required String username,
    required String password,
    String? deviceToken,
    String? deviceId,
    String? deviceName,
    String? deviceType,
    String? version,
  }) {
    final dioCall = api.postRequest(
      ApiConfig.authLogin,
      data: {
        "username": username,
        "password": password,
        "device_token":
            "cT2ci1MBD0fQmTK-x49aRS:APA91bFW398mEeDK3U3KdVZZpgReCuRyRn7s2esI8dufC22ylxwdCu3bjltQ0HvkqHNw-X5JXb2S9wYQmDabAF7HoeHYaSmhHVqi-tvtIG0cOLeVBgWeiGo",
        "device_id": "BDBA5D2F-661D-4616-B3C1-253C2B262F33",
        "device_name": "iPhone (iPhone)",
        "device_type": "iOS",
        "version": "1.6.13",
      },
    );
    return callApi<String>(api: dioCall, jsonCallback: (json) => json['token']);
  }

  @override
  Future<Either<String, User>> getUserData() {
    final dioCall = api.getRequest(ApiConfig.getUser);
    return callApiWithData(
      api: dioCall,
      jsonCallback: (json) => User.fromJson(json),
    );
  }
}
