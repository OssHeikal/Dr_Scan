// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/data/datasources/auth_datasource.dart';
import 'package:dr_scan_graduation_project/data/models/user_model.dart';
import 'package:dr_scan_graduation_project/utils/errors/failure.dart';

abstract class AuthenticationRepository {
  Future<Either<Failure, User>> login(String username, String password);
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSourceImpl dataSource;
  AuthenticationRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Failure, User>> login(String username, String password) async {
    try {
      final user = await dataSource.logInWithCredentials(username, password);
      return user.fold(
        (error) => Left(Failure.fromException(error)),
        (user) => Right(user),
      );
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}

// const String baseUrl = 'https://api.escuelajs.co/api/v1/';
