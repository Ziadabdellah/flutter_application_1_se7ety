import 'package:flutter/material.dart';
import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view/signin_view.dart';
import 'package:gap/gap.dart';

class WelcomeView_ extends StatelessWidget {
  const WelcomeView_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/welcome_bg.png'),
                  fit: BoxFit.cover,
                  opacity: 9)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 100, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'اهلا بيك',
                style: getTitleStyle(fontSize: 38),
              ),
              Text(
                'احجز الآن مع صحتي  بسهولة',
                style: getbodyStyle(),
              ),
            ],
          ),
        ),
        Positioned(
            bottom: 80,
            left: 25,
            right: 25,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.color1.withOpacity(0.6),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 15,
                          color: Colors.grey.withOpacity(0.4),
                          offset: Offset(4, 4))
                    ]),
                child: Column(children: [
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    'سجل الآن',
                    style: getbodyStyle(fontSize: 20, color: AppColors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(children: [
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginView_(index: 0),
                            ));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(9),
                        child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              color: AppColors.scaffoldBG.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'دكتور',
                              style: getTitleStyle(color: AppColors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginView_(index: 1),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(9),
                          child: Container(
                            height: 75,
                            decoration: BoxDecoration(
                                color: AppColors.scaffoldBG.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                'مريض',
                                style: getTitleStyle(color: AppColors.black),
                              ),
                            ),
                          ),
                        )),
                    SizedBox(
                      height: 15,
                    )
                  ])
                ])))
      ]),
    );
  }
}
