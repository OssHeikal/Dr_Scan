import 'package:dr_scan_graduation_project/presentation/home/diagnose/loading_page.dart';
import 'package:dr_scan_graduation_project/utils/constants.dart';
import 'package:dr_scan_graduation_project/utils/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/utils/widgets/nav_bar.dart';
import 'package:dr_scan_graduation_project/utils/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuestionsPage extends StatefulWidget {
  const QuestionsPage({Key? key}) : super(key: key);
  static String id = 'QuestionsPage';

  @override
  State<QuestionsPage> createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  final controller = PageController(viewportFraction: 0.9, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 90,
          ),
          const Text(
            'Diagnosis',
            style: TextStyle(
                fontSize: 24, fontFamily: kRoboto, fontWeight: FontWeight.w700),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 22, left: 42, bottom: 22),
            child: ProgressBar(
                ticks: 3,
                first1: true,
                second1: false,
                first2: true,
                second2: false,
                first3: false,
                second3: false),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 50),
            child: Text(
              """Please answer these Questions to            
                get accurate info ..""",
              style: TextStyle(
                  color: Color(0xff818181),
                  fontSize: 15,
                  fontFamily: kRoboto,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const SizedBox(
            height: 11,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                SizedBox(
                  height: 370,
                  width: 366,
                  child: PageView(
                    clipBehavior: Clip.none,
                    controller: controller,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: kBlackColor.withOpacity(.1),
                              blurRadius: 15,
                              spreadRadius: 3,
                              offset: const Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: kWhiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 29,
                            ),
                            const Text(
                              '1/3',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: kRoboto,
                                color: Color(0xff818181),
                              ),
                            ),
                            const SizedBox(
                              height: 31,
                            ),
                            const Center(
                              child: Text(
                                """ Do you have this pain 
           everyday ?""",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: kRoboto,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomButton(
                              text: 'Yes',
                              size: 16,
                              width: 269,
                              height: 47,
                              color: kPrimaryColor,
                              borderRadius: 16,
                              fontweight: FontWeight.w400,
                              textColor: kWhiteColor,
                              borderColor: kPrimaryColor,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            CustomButton(
                              text: 'No',
                              size: 16,
                              width: 269,
                              height: 47,
                              color: kPrimaryColor,
                              borderRadius: 16,
                              fontweight: FontWeight.w400,
                              textColor: kWhiteColor,
                              borderColor: kPrimaryColor,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            CustomButton(
                              text: 'Don’t Know',
                              size: 16,
                              width: 269,
                              height: 47,
                              color: kPrimaryColor,
                              borderRadius: 16,
                              fontweight: FontWeight.w400,
                              textColor: kWhiteColor,
                              borderColor: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(.1),
                              blurRadius: 15,
                              spreadRadius: 3,
                              offset: const Offset(0, 0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: kWhiteColor,
                        ),
                        margin: const EdgeInsets.only(left: 14, right: 14),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 29,
                            ),
                            const Text(
                              '1/3',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                fontFamily: kRoboto,
                                color: Color(0xff818181),
                              ),
                            ),
                            const SizedBox(
                              height: 31,
                            ),
                            const Center(
                              child: Text(
                                """Are you pregnant ?""",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: kRoboto,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
                            ),
                            CustomButton(
                              text: 'Yes',
                              size: 16,
                              width: 269,
                              height: 47,
                              color: kPrimaryColor,
                              borderRadius: 16,
                              fontweight: FontWeight.w400,
                              textColor: kWhiteColor,
                              borderColor: kPrimaryColor,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            CustomButton(
                              text: 'No',
                              size: 16,
                              width: 269,
                              height: 47,
                              color: kPrimaryColor,
                              borderRadius: 16,
                              fontweight: FontWeight.w400,
                              textColor: kWhiteColor,
                              borderColor: kPrimaryColor,
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            CustomButton(
                              text: 'Don’t Know',
                              size: 16,
                              width: 269,
                              height: 47,
                              color: kPrimaryColor,
                              borderRadius: 16,
                              fontweight: FontWeight.w400,
                              textColor: kWhiteColor,
                              borderColor: kPrimaryColor,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, previousPage());
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 40, top: 35),
                  child: Row(
                    children: const [
                      Icon(
                        FontAwesomeIcons.angleLeft,
                        color: kPrimaryColor,
                        size: 20,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Back',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 16,
                            fontFamily: kRoboto,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 32, left: 119),
                child: CustomButton(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          context = context;
                          return const LoadingPage();
                        },
                      );
                    },
                    text: 'Next',
                    size: 16,
                    width: 124,
                    height: 47,
                    color: kPrimaryColor,
                    borderRadius: 12,
                    textColor: kWhiteColor,
                    borderColor: kPrimaryColor),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: NavBar(
        istabbed2: true,
        istabbed: false,
        istabbed3: false,
        istabbed1: false,
      ),
    );
  }

  nextPage() {
    controller.animateToPage(controller.page!.toInt() + 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }

  previousPage() {
    controller.animateToPage(controller.page!.toInt() - 1,
        duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
  }
}
