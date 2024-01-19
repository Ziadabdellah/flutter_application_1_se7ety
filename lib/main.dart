import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_cubit.dart';
import 'package:flutter_application_1_se7ety/features/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart%20';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyCgeWPvwyNFcSQdbbcjuSu6uQbjMbmbGPU",
          appId: "com.example.flutter_application_1_se7ety",
          messagingSenderId: "916091065699",
          projectId: 'se7ety-c04a2'));
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit_(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: AppColors.white,
          snackBarTheme: SnackBarThemeData(backgroundColor: AppColors.redColor),
          appBarTheme: AppBarTheme(
              titleTextStyle: getTitleStyle(color: AppColors.white),
              centerTitle: true,
              elevation: 0.0,
              actionsIconTheme: IconThemeData(color: AppColors.color1),
              backgroundColor: AppColors.color1),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide.none),
            filled: true,
            suffixIconColor: AppColors.color1,
            prefixIconColor: AppColors.color1,
            fillColor: AppColors.scaffoldBG,
            hintStyle: GoogleFonts.poppins(color: AppColors.gray, fontSize: 15),
          ),
          dividerTheme:
              DividerThemeData(color: AppColors.black, indent: 9, endIndent: 9),
          fontFamily: GoogleFonts.cairo().fontFamily),
      home: SplashView(),
      builder: (context, child) {
        return Directionality(textDirection: TextDirection.rtl, child: child!);
      },
      ));
  }
}
