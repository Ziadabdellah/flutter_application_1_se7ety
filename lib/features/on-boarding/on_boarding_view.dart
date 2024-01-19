import 'package:flutter/material.dart';
import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
import 'package:flutter_application_1_se7ety/features/on-boarding/onboarding_model.dart';
import 'package:flutter_application_1_se7ety/features/welcome_view.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  var pageController = PageController();
  int pagcontr = 0;
  List<OnBoardingmodel> pages = [
    OnBoardingmodel(
        image: 'assets/on1.png',
        Title: 'ابحث عن دكتور متخصص',
        descriiption:
            'اكتشف مجموعة واسعة من الأطباء الخبراء والمتخصصين في مختلف المجالات.'),
    OnBoardingmodel(
        image: 'assets/on2.png',
        Title: 'سهولة الحجز',
        descriiption: 'احجز المواعيد في أي وقت و في أي مكان.'),
    OnBoardingmodel(
        image: 'assets/on3.png',
        Title: 'معلوماتك آمنة ومشفرة',
        descriiption: 'كن مطمئنًا لأن خصوصيتك وأمانك هما أهم أولوياتنا.'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.white,
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => WelcomeView_()));
              },
              child: Text(
                'تخطي',
                style: TextStyle(fontSize: 18, color: AppColors.color1),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              onPageChanged: (value) {
                setState(() {
                  pagcontr = value;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Spacer(
                      flex: 1,
                    ),
                    Image.asset(
                      pages[index].image,
                      width: 250,
                    ),
                    Spacer(
                      flex: 1,
                    ),
                    Text(
                      pages[index].Title,
                      style: getTitleStyle(),
                    ),
                    Gap(23),
                    Text(
                      pages[index].descriiption,
                      style: getbodyStyle(),
                    ),
                    Spacer(
                      flex: 1,
                    )
                  ],
                );
              },
            )),
            SizedBox(
              height: 50,
              child: Row(
                children: [
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: WormEffect(
                        spacing: 10,
                        dotWidth: 20,
                        dotHeight: 20,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1,
                        dotColor: Color.fromARGB(255, 117, 113, 113),
                        activeDotColor: AppColors.color1),
                  ),
                  Spacer(),
                  if (pagcontr == 2)
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.color1,
                            foregroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => WelcomeView_()));
                        },
                        child: Text(
                          'هيا نبدأ',
                          style: TextStyle(fontSize: 16),
                        ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
