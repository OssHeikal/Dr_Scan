// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dr_scan_graduation_project/utils/errors/exceptions.dart';
import 'package:dr_scan_graduation_project/utils/errors/failure.dart';
import 'package:dr_scan_graduation_project/utils/helper/network_checker.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl;
  NetworkChecker networkChecker;
  ApiServices({required this.baseUrl, required this.networkChecker});

  Future<dynamic> getData(String url, {Map<String, String>? headers}) async {
    bool isConnected = await networkChecker.isConnected();
    if (isConnected == true) {
      final response =
          await http.get(Uri.parse(baseUrl + url), headers: headers);
      final responseBody = fetchData(response);
      return Right(responseBody);
    } else {
      throw NetworkException();
    }
  }

  Future<Either<Failure, dynamic>> postData(
      String url, Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(baseUrl + url), body: body);
      final responseBody = jsonDecode(response.body);
      return Right(responseBody);
    } catch (e) {
      return Left(Failure.fromException(e));
    }
  }

  Future fetchData(response) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      throw BadRequestException();
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else if (response.statusCode == 403) {
      throw ForbiddenException();
    } else if (response.statusCode == 404) {
      throw NotFoundException();
    } else if (response.statusCode == 500) {
      throw InternalServerErrorException();
    } else {
      throw ServerException();
    }
  }
}
