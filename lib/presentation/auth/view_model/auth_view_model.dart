// ignore_for_file: avoid_print

import 'package:dr_scan_graduation_project/data/datasources/auth_datasource.dart';
import 'package:dr_scan_graduation_project/data/repositories/authentication_repository.dart';
import 'package:dr_scan_graduation_project/data/services/api_services.dart';
import 'package:dr_scan_graduation_project/utils/constants.dart';
import 'package:dr_scan_graduation_project/utils/errors/failure.dart';
import 'package:dr_scan_graduation_project/utils/helper/network_checker.dart';
import 'package:get/get.dart';

class AuthViewModel extends GetxController {
  final ApiServices apiServices =
      Get.put(ApiServices(baseUrl: BASE_URL, networkChecker: NetworkChecker()));

  late final AuthenticationDataSourceImpl dataSourceImpl;
  late final AuthenticationRepositoryImpl authRepoImpl;

  RxString userName = ''.obs;

  @override
  void onInit() {
    dataSourceImpl =
        Get.put(AuthenticationDataSourceImpl(apiServices: apiServices));
    authRepoImpl =
        Get.put(AuthenticationRepositoryImpl(dataSource: dataSourceImpl));
    super.onInit();
  }

  Future<void> login() async {
    final user = await authRepoImpl.login('john@mail.com', 'changeme');
    user.fold(
      (error) => Get.snackbar('Error', Failure.fromException(error).message),
      (user) => userName.value = user.name,
    );
  }
}
