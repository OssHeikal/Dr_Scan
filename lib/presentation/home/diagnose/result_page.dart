import 'package:dr_scan_graduation_project/presentation/home/diagnose/advanced_options_page.dart';
import 'package:dr_scan_graduation_project/presentation/home/diagnose/body_page.dart';

import 'package:dr_scan_graduation_project/presentation/home/home_page.dart';
import 'package:dr_scan_graduation_project/utils/constants.dart';
import 'package:dr_scan_graduation_project/utils/widgets/custom_button.dart';
import 'package:dr_scan_graduation_project/utils/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key}) : super(key: key);

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(microseconds: 0), () {
      showSlidingBottomSheet(context, builder: (context) {
        return SlidingSheetDialog(
            elevation: 8,
            cornerRadius: 32,
            minHeight: 686,
            builder: (context, state) {
              return Container(
                height: 686,
                width: 400,
                decoration: const BoxDecoration(
                  color: Color(0xffFAFAFA),
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, right: 225),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: kRoboto,
                          color: kBlackColor,
                        ),
                        child: Text('Your Result is '),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 27, right: 210),
                      child: DefaultTextStyle(
                        style: TextStyle(
                          fontSize: 15,
                          fontFamily: kRoboto,
                          color: kBlackColor,
                        ),
                        child: Text('You may suffer from '),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      width: 327,
                      height: 265,
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xff0A0A0A).withOpacity(.12)),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            left: 21, top: 15, right: 60, bottom: 26),
                        child: DefaultTextStyle(
                          style: TextStyle(
                            height: 1.5,
                            fontSize: 17,
                            color: Color(0xff979797),
                            fontFamily: kRoboto,
                          ),
                          child: Text(
                              """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed doeiusmod tempor sit amet, consectetur adipiscing elit, sed doeiusmod tempor"""),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 49,
                    ),
                    CustomButton(
                        onTap: () {
                          setState(() {
                            isSaved = true;
                          });
                        },
                        text: isSaved
                            ? 'Saved successfully '
                            : 'Save your result',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: isSaved ? kThirdColor : kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: isSaved ? kThirdColor : kPrimaryColor),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                        text: 'Go back home',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: kPrimaryColor),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.pushNamed(context, BodyPage.id);
                        },
                        text: 'Do another Diagnosis test ',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: kPrimaryColor),
                    const SizedBox(
                      height: 18,
                    ),
                    CustomButton(
                        onTap: () {
                          Navigator.pop(context);
                          showSlidingBottomSheet(context, builder: (context) {
                            return SlidingSheetDialog(
                                elevation: 8,
                                cornerRadius: 32,
                                minHeight: 686,
                                builder: (context, state) {
                                  return AdvancedOptionsPage(
                                    test: false,
                                  );
                                });
                          });
                        },
                        text: 'Advanced options',
                        size: 16,
                        width: 327,
                        height: 47,
                        color: kPrimaryColor,
                        borderRadius: 16,
                        textColor: kWhiteColor,
                        borderColor: kPrimaryColor),
                  ],
                ),
              );
            });
      });
    });

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
                first3: true,
                second3: false),
          ),
        ],
      ),
    );
  }
}
