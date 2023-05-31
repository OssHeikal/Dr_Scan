import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/data/models/user_model.dart';
import 'package:dr_scan_graduation_project/data/services/api_services.dart';
import 'package:dr_scan_graduation_project/utils/errors/failure.dart';

abstract class AuthenticationDataSource {
  Future<Either<Failure, User>> logInWithCredentials(
      String username, String password);
  Future<Either<Failure, User>> getUserProfile(
      String accessToken, String refreshToken);
}

class AuthenticationDataSourceImpl implements AuthenticationDataSource {
  final ApiServices apiServices;
  AuthenticationDataSourceImpl({required this.apiServices});

  @override
  Future<Either<Failure, User>> logInWithCredentials(
      String username, String password) async {
    final body = {'email': username, 'password': password};
    try {
      final response = await apiServices.postData('auth/login', body);
      return response.fold(
        (error) => Left(Failure.fromException(error)),
        (loginData) async {
          // Inspect the loginData object
          final accessToken = loginData['access_token'];
          final refreshToken = loginData['refresh_token'];
          print(accessToken);
          return await getUserProfile(accessToken, refreshToken);
        },
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, User>> getUserProfile(
      String accessToken, String refreshToken) async {
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    try {
      final response =
          await apiServices.getData('auth/profile', headers: headers);
      return response.fold(
        (error) => Left(Failure.fromException(error)),
        (profileData) {
          final user = User.fromJson(profileData);
          user.setTokens(accessToken, refreshToken);
          return Right(user);
        },
      );
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }
}
