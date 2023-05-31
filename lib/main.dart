import 'package:dr_scan_graduation_project/presentation/auth/forgetpassword_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/login_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/password_changed.dart';
import 'package:dr_scan_graduation_project/presentation/auth/registration_intro_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/reset_password_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/send_email_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/send_message_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/send_code_email.dart';
import 'package:dr_scan_graduation_project/presentation/auth/send_code_message.dart';
import 'package:dr_scan_graduation_project/presentation/auth/signup_page.dart';
import 'package:dr_scan_graduation_project/presentation/auth/skip_registration_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/body_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/bodyitem_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/diagnosis_result_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/loading_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/medical_diagnosis_page.dart';
import 'package:dr_scan_graduation_project/presentation/history/saved_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/questions_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/symptom_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/home_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/setting/accountinfo_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/setting/privacy_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/setting/setting_page.dart';
import 'package:dr_scan_graduation_project/presentation/onboarding/description_pages.dart';
import 'package:dr_scan_graduation_project/presentation/onboarding/splash_page.dart';
import 'package:dr_scan_graduation_project/presentation/test/madical_analysis_page.dart';
import 'package:dr_scan_graduation_project/presentation/test/test_result_page.dart';
import 'package:dr_scan_graduation_project/presentation/test_view.dart';
import 'package:dr_scan_graduation_project/utils/firebase_options.dart';
import 'package:dr_scan_graduation_project/utils/widgets/nav_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const DrScan());
}

class DrScan extends StatelessWidget {
  const DrScan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            RegistrationIntroPage.id: (context) =>
                const RegistrationIntroPage(),
            SplashPage.id: (context) => const SplashPage(),
            LoginPage.id: (context) => const LoginPage(),
            SignupPage.id: (context) => const SignupPage(),
            ForgetPasswordPage.id: (context) => const ForgetPasswordPage(),
            SkipRegistrationPage.id: (context) => const SkipRegistrationPage(),
            DescriptionPages.id: (context) => DescriptionPages(),
            ResetPasswordPage.id: (context) => const ResetPasswordPage(),
            PasswordChangedPage.id: (context) => const PasswordChangedPage(),
            SendMessagePage.id: (context) => const SendMessagePage(),
            SendCodeEmail.id: (context) => const SendCodeEmail(),
            SendCodeMessage.id: (context) => const SendCodeMessage(),
            AccountInfoPage.id: (context) => const AccountInfoPage(),
            SettingPage.id: (context) => const SettingPage(),
            PrivacyPage.id: (context) => const PrivacyPage(),
            HomePage.id: (context) => const HomePage(),
            NavBar.id: (context) => NavBar(
                  istabbed: false,
                  istabbed2: false,
                  istabbed1: false,
                  istabbed3: false,
                ),
            MedicalDiagnosisPage.id: (context) => const MedicalDiagnosisPage(),
            BodyPage.id: (context) => const BodyPage(),
            SymptomPage.id: (context) => const SymptomPage(),
            BodyItemPage.id: (context) => const BodyItemPage(),
            QuestionsPage.id: (context) => const QuestionsPage(),
            LoadingPage.id: (context) => const LoadingPage(),
            DiagnosisResultPage.id: (context) => const DiagnosisResultPage(),
            MedicalAnalysisPage.id: (context) => const MedicalAnalysisPage(),
            SendEmailPage.id: (context) => const SendEmailPage(),
            TestResultPage.id: (context) => const TestResultPage(),
            SavedPage.id: (context) => const SavedPage(),
            TestView.id: (context) => TestView(),
          },
          // initialRoute: SplashPage.id,
          initialRoute: TestView.id,
        );
      },
    );
  }
}
