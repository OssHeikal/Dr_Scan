import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/data/models/user_model.dart';
import 'package:dr_scan_graduation_project/data/services/api_services.dart';
import 'package:dr_scan_graduation_project/utils/errors/failure.dart';
import 'package:dr_scan_graduation_project/utils/helper/error_handler.dart';
import 'package:dr_scan_graduation_project/utils/strings/endpoints.dart';

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
      final response = await apiServices.postData(Endpoints.login, body);
      final accessToken = response['access_token'];
      final refreshToken = response['refresh_token'];
      return await getUserProfile(accessToken, refreshToken);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
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
          await apiServices.getData(Endpoints.profile, headers: headers);
      final user = User.fromJson(response);
      user.setTokens(accessToken, refreshToken);
      return Right(user);
    } catch (e) {
      return Left(ErrorHandler.handleException(e as Exception));
    }
  }
}
