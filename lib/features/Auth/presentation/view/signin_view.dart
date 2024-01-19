import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_se7ety/core/Widgets/custom_dialogs.dart';
import 'package:flutter_application_1_se7ety/core/functions/email_validate.dart';
import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_cubit.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_states.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view/register_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView_ extends StatefulWidget {
  const LoginView_({super.key, required this.index});
  final int index;
  @override
  State<LoginView_> createState() => _LoginView_State();
}

class _LoginView_State extends State<LoginView_> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  bool isVisable = true;
  String handLeUsertype() {
    return widget.index == 0 ? 'دكتور' : 'مريض';
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit_, Auth_states>(
        listener: (context, State) {
          if (State is LoginSuccessState) {
            print('Done');
          } else if (State is LoginErrorState) {
            Navigator.pop(context);
            showErrorDialog(context, State.Error);
          } else {
            showLoadingDialog(context);
          }
        },
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Padding(
                        padding: const EdgeInsets.only(right: 16, left: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/logo.png',
                              width: 190,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'سجل دخول "${handLeUsertype()}"',
                              style: getTitleStyle(),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                              textAlign: TextAlign.end,
                              decoration: InputDecoration(
                                  hintText: 'Ziad.Abdellah@gmail.com',
                                  prefixIcon: Icon(Icons.email)),
                              textInputAction: TextInputAction.next,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' ادخل البريد الالكتروني ';
                                } else if (!emailValidate(value)) {
                                  return 'أدخل بريد إلكتروني متاح';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            TextFormField(
                              textAlign: TextAlign.end,
                              style: TextStyle(color: AppColors.black),
                              obscureText: isVisable,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                helperText: '**********',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    // Add the arrow here
                                    setState(() {
                                      isVisable = !isVisable;
                                    });
                                  },
                                  icon: Icon(isVisable
                                      ? Icons.remove_red_eye
                                      : Icons.visibility_off),
                                ),
                                prefixIcon: Icon(Icons.lock),
                              ),
                              controller: _passwordcontroller,
                              validator: (value) {
                                if (value!.isEmpty) return 'ادخل كلمه المرور';
                                return null;
                              },
                            ),
                            Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(top: 5, right: 10),
                              child: Text(
                                'نسيت كلمه المرور؟',
                                style: getsmallStyle(),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                      onPressed: () async {
                                        if (_formKey.currentState!.validate()) {
                                          // If the form is valid, proceed with login
                                          await context
                                              .read<AuthCubit_>()
                                              .login(_emailController.text,
                                                  _passwordcontroller.text);
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColors.color1,
                                          elevation: 2,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      child: Text(
                                        "تسجيل الدخول",
                                        style: getTitleStyle(
                                            color: AppColors.white),
                                      ))),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'ليس لدي حساب',
                                    style: getbodyStyle(color: AppColors.black),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) => RegisterView_(
                                                index: widget.index)),
                                      );
                                    },
                                    child: Text(
                                      'سجل الان',
                                      style:
                                          getbodyStyle(color: AppColors.color1),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )))),
          ),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }
}
