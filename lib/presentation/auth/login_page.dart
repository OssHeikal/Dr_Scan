import 'package:dr_scan_graduation_project/presentation/auth/forgetpassword_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/signup_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/skip_registration_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/home_page.dart';
import 'package:dr_scan_graduation_project/utils/constants.dart';
import 'package:dr_scan_graduation_project/utils/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/utils/widgets/custom_text_field.dart';
import 'package:dr_scan_graduation_project/utils/widgets/custom_text_formfield.dart';
import 'package:dr_scan_graduation_project/utils/widgets/customicon_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:text_divider/text_divider.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  static String id = 'LoginPage';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  bool isLogin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        // Positioned(
        //   top: 50,left: 15,
        //
        //     child: Image.asset('assets/images/Union.png')),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  const Text(
                    'Log in',
                    style: TextStyle(
                        fontFamily: kRoboto,
                        fontWeight: FontWeight.bold,
                        fontSize: 30),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 18),
              child: Text(
                'Hello, welcome back to your account',
                style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff888888),
                    fontFamily: kRoboto,
                    fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              abovetext: 'Email address',
              hintText: 'ex.Email@gmail.com',
              width: 350,
              padding: 250,
            ),
            const SizedBox(
              height: 39,
            ),
            CustomTextFormField(
              padding: 275,
              hintText: 'Enter password',
              suffixIcon: const Icon(
                Icons.visibility_off_outlined,
              ),
              abovetext: 'Password',
              width: 350,
              color: kWhiteColor,
            ),
            const SizedBox(
              height: 22,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 25,
                ),
                const Icon(
                  Icons.check_circle_sharp,
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  width: 11,
                ),
                const Text(
                  'Remember me',
                  style: TextStyle(fontSize: 14, fontFamily: kRoboto),
                ),
                const SizedBox(
                  width: 100,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPasswordPage.id);
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: kRoboto,
                          color: Colors.black),
                    )),
              ],
            ),
            const SizedBox(
              height: 36,
            ),
            Center(
              child: CustomButton(
                onTap: () {
                  setState(() {
                    isLogin = true;
                  });
                  Navigator.pushNamed(context, HomePage.id);
                },
                text: 'Log-In',
                size: 20,
                width: 295,
                height: 45,
                color: isLogin ? const Color(0xff027189) : kPrimaryColor,
                borderRadius: 8,
                fontweight: FontWeight.w500,
                textColor: kWhiteColor,
                borderColor: isLogin ? const Color(0xff027189) : kPrimaryColor,
              ),
            ),
            const SizedBox(
              height: 28,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 23),
              child: TextDivider.horizontal(
                  text: const Text(
                    '  OR',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: kRoboto,
                    ),
                  ),
                  thickness: 1,
                  color: const Color(0xff565656),
                  indent: 8,
                  endIndent: 8),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () async {
                UserCredential cred = await signInWithGoogle();
                Navigator.pushNamed(context, SkipRegistrationPage.id);
              },
              child: CustomIconText(
                  icon: Logo(
                    Logos.google,
                    size: 24,
                  ),
                  iconText: 'Login with Google'),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () async {
                await signInWithFacebook();
                Navigator.pushNamed(context, SkipRegistrationPage.id);
              },
              child: CustomIconText(
                  icon: const Icon(
                    Icons.facebook,
                    color: Color(0xff1778F2),
                    size: 30,
                  ),
                  iconText: 'Login with Facebook'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 85,
                right: 60,
                top: 31,
                bottom: 25,
              ),
              child: Row(
                children: [
                  const Text(
                    'Don’t have an account? ',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: kRoboto,
                        color: Color(0xff474747)),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignupPage.id);
                    },
                    child: const Text(
                      'Sign-up',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        fontFamily: kRoboto,
                        color: Color(0xff474747),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ]),
    );
  }
}
