// ignore_for_file: avoid_print
import 'dart:convert';

import 'package:dr_scan_graduation_project/utils/errors/exceptions.dart';
import 'package:dr_scan_graduation_project/utils/helper/network_checker.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices({
    required this.baseUrl,
    required this.networkChecker,
  });
  String baseUrl;
  NetworkChecker networkChecker;

  Future<dynamic> getData(String endpoint,
      {Map<String, String>? headers}) async {
    bool isConnected = await networkChecker.isConnected();
    if (isConnected == true) {
      final url = Uri.parse(baseUrl + endpoint);
      final response = await http.get(url, headers: headers);
      final responseBody = fetchData(response);
      return responseBody;
    } else {
      throw NetworkException();
    }
  }

  Future<dynamic> postData(String endpoint, Map<String, dynamic> body) async {
    bool isConnected = await networkChecker.isConnected();
    if (isConnected == true) {
      final url = Uri.parse(baseUrl + endpoint);
      final response = await http.post(url, body: body);
      final responseBody = fetchData(response);
      return responseBody;
    } else {
      throw NetworkException();
    }
  }

  Future fetchData(http.Response response) async {
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 201) {
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
