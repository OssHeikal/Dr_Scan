import 'package:dr_scan_graduation_project/utils/binding/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'presentation/auth/view/forgetpassword_page.dart';
import 'presentation/auth/view/login_page.dart';
import 'presentation/auth/view/password_changed.dart';
import 'presentation/auth/view/registration_intro_page.dart';
import 'presentation/auth/view/reset_password_page.dart';
import 'presentation/auth/view/send_code_email.dart';
import 'presentation/auth/view/send_code_message.dart';
import 'presentation/auth/view/send_email_page.dart';
import 'presentation/auth/view/send_message_page.dart';
import 'presentation/auth/view/signup_page.dart';
import 'presentation/auth/view/skip_registration_page.dart';
import 'presentation/history/saved_page.dart';
import 'presentation/home/diagnose/body_page.dart';
import 'presentation/home/diagnose/bodyitem_page.dart';
import 'presentation/home/diagnose/diagnosis_result_page.dart';
import 'presentation/home/diagnose/loading_page.dart';
import 'presentation/home/diagnose/medical_diagnosis_page.dart';
import 'presentation/home/diagnose/questions_page.dart';
import 'presentation/home/diagnose/symptom_page.dart';
import 'presentation/home/home_page.dart';
import 'presentation/home/setting/accountinfo_page.dart';
import 'presentation/home/setting/privacy_page.dart';
import 'presentation/home/setting/setting_page.dart';
import 'presentation/onboarding/description_pages.dart';
import 'presentation/onboarding/splash_page.dart';
import 'presentation/test/madical_analysis_page.dart';
import 'presentation/test/test_result_page.dart';
import 'presentation/test_view.dart';
import 'utils/firebase_options.dart';
import 'utils/widgets/nav_bar.dart';

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
          initialBinding: Binding(),
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
          initialRoute: LoginPage.id,
        );
      },
    );
  }
}
