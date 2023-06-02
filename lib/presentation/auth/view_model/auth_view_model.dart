import 'package:dr_scan_graduation_project/presentation/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:dr_scan_graduation_project/data/datasources/auth_datasource.dart';
import 'package:dr_scan_graduation_project/data/repositories/authentication_repository.dart';
import 'package:dr_scan_graduation_project/data/services/api_services.dart';
import 'package:dr_scan_graduation_project/utils/helper/error_handler.dart';
import 'package:dr_scan_graduation_project/utils/helper/network_checker.dart';
import 'package:dr_scan_graduation_project/utils/strings/endpoints.dart';

class AuthViewModel extends GetxController {
  late final ApiServices apiServices;

  late final AuthenticationDataSourceImpl dataSourceImpl;
  late final AuthenticationRepositoryImpl authRepoImpl;

  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  RxString userName = ''.obs;
  RxBool isLogin = false.obs;

  @override
  void onInit() {
    NetworkChecker networkChecker = Get.put(NetworkChecker());
    apiServices = Get.put(ApiServices(
        baseUrl: Endpoints.dbBaseUrl, networkChecker: networkChecker));
    dataSourceImpl =
        Get.put(AuthenticationDataSourceImpl(apiServices: apiServices));
    authRepoImpl =
        Get.put(AuthenticationRepositoryImpl(dataSource: dataSourceImpl));
    super.onInit();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  Future<void> login() async {
    String email = emailController.text; //'john@mail.com'
    String password = passwordController.text; //'changeme'
    final user = await authRepoImpl.login(email, password);
    user.fold(
      (error) => ErrorHandler.handleError(error),
      (user) {
        isLogin.value = true;
        Get.toNamed(HomePage.id);
      },
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }
}
