
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_application_1_se7ety/core/Widgets/custom_dialogs.dart';
// import 'package:flutter_application_1_se7ety/core/functions/routing.dart';
// import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
// import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
// import 'package:flutter_application_1_se7ety/features/Auth/data/specialization_list.dart';
// import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_cubit.dart';
// import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_states.dart';
// import 'package:flutter_application_1_se7ety/features/patient/home/nav_bar.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// class DoctorUploadData_ extends StatefulWidget {
//   const DoctorUploadData_({super.key});

//   @override
//   State<DoctorUploadData_> createState() => _DoctorUploadData_State();
// }

// class _DoctorUploadData_State extends State<DoctorUploadData_> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _bio = TextEditingController();
//   final TextEditingController _address = TextEditingController();
//   final TextEditingController _phone1 = TextEditingController();
//   final TextEditingController _phone2 = TextEditingController();
//   String _specialization = specialization[0];
//   late String _startTime =
//       DateFormat('hh:mm a').format(DateTime(2023, 9, 7, 10, 00));
//   late String _endTime =
//       DateFormat('hh:mm a').format(DateTime(2023, 9, 7, 22, 00));
//   @override
//   void initState() {
//     super.initState();
//     _getUser();
//   }

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String? _imagePath;
//   file? file;
//   String? profileUrl;


//   User? user;
//   String? UserID;


//   Future<void> _getUser() async {
//     user = FirebaseAuth.instance.currentUser;
//    UserID = user?.uid;
//   }
//   final FirebaseStorage _storage =
//   FirebaseStorage.instanceFor(bucket: '');
//   Future<String>  uploadImageToFireStore(file image)async{
//     Reference ref = _storage.ref().child('path');
//     await ref .putFile(image, metadata);
//     String url = await ref . getDownloadURL();
//     return url;
//   }
//   Future<Void>_pickImage()async{
//     _getUser();
//     final PickedFile = await
//     ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile ! = null){
//       setState(() {
//         _imagePath = pickedFile.path;
//         file = file(PickedFile, Path);
//       });
//     }
//     profileUrl = await uploadImageToFireStore(file!);
//   }
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<AuthCubit_, Auth_states>(
//       listener: (context, state) {
//         if (state is UpdateSuccessState) {
//           pushAndRemoveUntil(context, PatientMainPage());
          
//         } else if (state is UpdateErrorState) {
//           Navigator.pop(context);
//           showErrorDialog(context, state.Error);
//         } else {
//           showLoadingDialog(context);
//         }
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('إكمال عملية التسجيل'),
//         ),
//         body: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             children: [],
//           ),
//         )),
//         bottomNavigationBar: Container(
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.only(top: 25.0),
//             child: SizedBox(
//               width: double.infinity,
//               height: 50,
//               child: ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       context.read<AuthCubit_>().updateDoctorData(
//                           uid: UserID ?? '',
//                           image: profileUrl ?? '',
//                           email: user!.email ?? '',
//                           phone1: _phone1.text,
//                           bio: _bio.text,
//                           starTime: _startTime,
//                           endTime: _endTime,
//                           address: _address.text,
//                            specialization: _specialization );
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                       backgroundColor: AppColors.color1,
//                       elevation: 2,
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10))),
//                   child: Text(
//                     "التسجيل",
//                     style: getTitleStyle(fontSize: 16, color: AppColors.white),
//                   )),
//             )),
//       ),
//     );
//   }

//   Widget updateProfileDoctor() {
//     return Form(key: _formKey, child: Column(children: [Stack(alignment: Alignment.bottomRight,children: [CircleAvatar(radius: 50,child: CircleAvatar(radius: 60,backgroundImage: (_imagePath ! =null)?FileImage(file(_imagePath!))as ImageProvider:AssetImage('assets/person.jpg'),),),
//     GestureDetector(onTap: () async {await _pickImage();
      
//     },child: CircleAvatar(radius: 15,backgroundColor: Theme.of(context).scaffoldBackgroundColor,child: Icon(Icons.camera_alt,size: 20,),),)],),Padding(padding: EdgeInsets.fromLTRB(8, 12, 8, 8),child: Row(children: [Text('التخصص',
//                   style: getbodyStyle(color: AppColors.black),)],),) ,Container(padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),decoration: BoxDecoration(color: AppColors.scaffoldBG,borderRadius: BorderRadius.circular(20)),child: DropdownButton(isExpanded: true,
//                   iconEnabledColor: AppColors.color1,icon: Icon(Icons.expand_circle_down_outlined),
//                   value: _specialization,
//                   onChanged:(String?newValue) {
//                     setState(() {
//                       _specialization = newValue ?? specialization[0];
//                     });
                    
//                   },
//                 items: specialization.map((String value) {
//                     return DropdownMenuItem(value: value,
//                       child: Text(value),);
//                   }
//                   ).toList())),Padding(padding: EdgeInsets.all(8.0),
//                   child: Row(children: [Text('نبذة تعريفية',style: getbodyStyle(color: AppColors.black),)],),)
//                   ,TextFormField(keyboardType: TextInputType.text,maxLines: 5,controller: _bio,style: TextStyle(color: AppColors.black),decoration: InputDecoration(hintText:'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي وخبراتك السابقة...'),
//                   validator: (value) {
//                     if (value!.isEmpty){
//                      return 'من فضلك ادخل النبذة التعريفية';
//                     }else{
//                       return null;
//                     }
//                   },),Padding(padding: EdgeInsets.only(top: 8.0),child: Divider(),),Padding(padding: EdgeInsets.all(8.0),child: Row(children: [Text('عنوان العيادة',style: getbodyStyle(color: AppColors.black),)],),),
//                   TextFormField(keyboardType: TextInputType.text,controller: _address,style: TextStyle(color: AppColors.black),decoration: InputDecoration(hintText:'شارع النادي الاهلي', ),validator: (value) {
//                     if (value!.isEmpty){
//                       return 'من فضلك ادخل عنوان العيادة';
//                     }else {
//                       return null;
//                     }
//                   },)
//                   ,Row(children: [Expanded(child: Padding(padding: EdgeInsets.all(8.0),child: Row(children: [Text('ساعات العمل من',style: getbodyStyle(color: AppColors.black),)],),)),
//                   Expanded(child: Padding(padding: EdgeInsets.all(8.0),child: Row(children: [Text( 'الي', style: getbodyStyle(color: AppColors.black),)],),))],),
//                   Row(children: [Expanded(child: TextFormField(readOnly: true,decoration: InputDecoration(suffixIcon: IconButton(onPressed: () async {await showStartTimePicker();}, icon: Icon(Icons.watch_later,color: AppColors.color1,)),hintText: _startTime),)),SizedBox(width: 10,),
//                   // end Time
                  
//                   Expanded(child: TextFormField(readOnly: true,decoration: InputDecoration(suffixIcon: IconButton(onPressed: () async {
//                     await showEndTimePicker();
//                   }, icon: Icon(Icons.watch_later_outlined,color: AppColors.color1,)),hintText: _endTime),))],),
//                   Padding(padding: EdgeInsets.all(8.0),child: Row(children: [Text('رقم الهاتف 1', style: getbodyStyle(color: AppColors.black),)],),),
//                   TextFormField(keyboardType: TextInputType.text,controller: _phone1,style: TextStyle(color: AppColors.black),decoration: InputDecoration(hintText: '01******'),validator: (value) {
//                     if (value!.isEmpty){
//                       return 'من فضلك ادخل رقم الهاتف ';     

//                     }else{
//                       return null;
//                     }
//                   },), 
//                   Padding(padding: EdgeInsets.all(8.0)
//                   ,child: Row(children: [Text('رقم الهاتف 2 (اختياري)',style: getbodyStyle(color: AppColors.black),)],),),
//                   TextFormField(keyboardType: TextInputType.text,controller: _phone2,style: TextStyle(color: AppColors.black),decoration: InputDecoration(hintText: '01**********'),)
//                   ],));
//   }
//   showStartTimePicker() async {
//     final datepicked = await showTimePicker(context: context,initialTime: TimeOfDay.now(),builder: (context, child) {
//       return Theme(data: ThemeData(timePickerTheme: TimePickerThemeData(helpTextStyle: TextStyle(color: AppColors.color1),backgroundColor: Theme.of(context).scaffoldBackgroundColor),colorScheme: ColorScheme.light(background:Theme.of(context).scaffoldBackgroundColor,primary: AppColors.color1,secondary: AppColors.black,onSecondary: AppColors.black,onPrimary: AppColors.black,onSurface: AppColors.black,surface: AppColors.black ),
//       textButtonTheme: TextButtonThemeData(style:TextButton.styleFrom(foregroundColor: AppColors.color1),)), child: child!);
//     },);
//     if (datepicked! =null){
//       setState(() {
//         _startTime = datepicked.format(context);

//       });
//     }
//   }
//   showEndTimePicker() async {
//     final timePicker = await showTimePicker(context: context,initialTime: TimeOfDay.fromDateTime(DateTime.now().add(Duration(minutes: 10))),
//    builder: (context, child) {
//      return Theme(data: ThemeData(timePickerTheme: TimePickerThemeData(helpTextStyle: TextStyle(color: AppColors.color1),
//      backgroundColor: Theme.of(context).scaffoldBackgroundColor),
//      colorScheme: ColorScheme.light(background: Theme.of(context).scaffoldBackgroundColor,
//      primary: AppColors.color1,secondary: AppColors.black,onSecondary: AppColors.black,onPrimary: AppColors.black,surface: AppColors.black,
//      onSurface: AppColors.black)), child: child!);
//    }, );
//    if (timepicker ! = null){
//     setState(() {
//       _endTime = timePicker.format(context);
//     });
//    }
//   }
// }











////vssddsvdsvdvdv
///
///
///
///
///
///vsdvdvdv
///
///
///
/// 
/// 
/// 

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1_se7ety/core/functions/routing.dart';
import 'package:flutter_application_1_se7ety/core/utils/colors.dart';
import 'package:flutter_application_1_se7ety/core/utils/styles.dart';
import 'package:flutter_application_1_se7ety/features/Auth/data/specialization_list.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_cubit.dart';
import 'package:flutter_application_1_se7ety/features/Auth/presentation/view-model/auth_states.dart';
import 'package:flutter_application_1_se7ety/features/patient/home/nav_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../../core/Widgets/custom_dialogs.dart';

class DoctorUploadData extends StatefulWidget {
  const DoctorUploadData({super.key});

  @override
  _DoctorUploadDataState createState() => _DoctorUploadDataState();
}

class _DoctorUploadDataState extends State<DoctorUploadData> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _bio = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _phone1 = TextEditingController();
  final TextEditingController _phone2 = TextEditingController();
  String _specialization = specialization[0];

  late String _startTime =
      DateFormat('hh:mm a').format(DateTime(2023, 9, 7, 10, 00));
  late String _endTime =
      DateFormat('hh:mm a').format(DateTime(2023, 9, 7, 22, 00));

  @override
  void initState() {
    super.initState();
    _getUser();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? _imagePath;
  File? file;
  String? profileUrl;

  User? user;
  String? UserID;

  Future<void> _getUser() async {
    user = FirebaseAuth.instance.currentUser;
    UserID = user?.uid;
  }

 
final _storage = FirebaseStorage.instanceFor(bucket: "gs://my-custom-bucket");
  Future<String> uploadImageToFireStore(File image) async {
    Reference ref = _storage.ref().child('Doctors/${_auth.currentUser!.uid}');
    SettableMetadata metadata = SettableMetadata(contentType: 'image/jpeg');
    await ref.putFile(image, metadata);
    String url = await ref.getDownloadURL();
    return url;
  }

  Future<void> _pickImage() async {
    _getUser();
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        file = File(pickedFile.path);
      });
    }
    profileUrl = await uploadImageToFireStore(file!);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit_, Auth_states>(
      listener: (context, state) {
        if (state is UpdateSuccessState) {
          pushAndRemoveUntil(context, const PatientMainPage());
        } else if (state is UpdateErrorState) {
          Navigator.pop(context);
          showErrorDialog(context, state.Error);
        } else {
          showLoadingDialog(context);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('إكمال عملية التسجيل'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                updateProfileDoctor(),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.only(top: 25.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit_>().updateDoctorData(
                      uid: UserID ?? '',
                      image: profileUrl ?? '',
                      specialization: _specialization,
                      email: user!.email ?? '',
                      phone1: _phone1.text,
                      bio: _bio.text,
                      
                      endTime: _endTime,
                      address: _address.text,
                       starTime: _startTime, startTime:_startTime );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.color1,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "التسجيل",
                style: getTitleStyle(fontSize: 16, color: AppColors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget updateProfileDoctor() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 50,
                // backgroundColor: AppColors.lightBg,
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: (_imagePath != null)
                      ? FileImage(File(_imagePath!)) as ImageProvider
                      : const AssetImage('assets/person.jpg'),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await _pickImage();
                },
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: const Icon(
                    Icons.camera_alt_rounded,
                    size: 20,
                    // color: AppColors.color1,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
            child: Row(
              children: [
                Text(
                  'التخصص',
                  style: getbodyStyle(color: AppColors.black),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            decoration: BoxDecoration(
                color: AppColors.scaffoldBG,
                borderRadius: BorderRadius.circular(20)),
            child: DropdownButton(
              isExpanded: true,
              iconEnabledColor: AppColors.color1,
              icon: const Icon(Icons.expand_circle_down_outlined),
              value: _specialization,
              onChanged: (String? newValue) {
                setState(() {
                  _specialization = newValue ?? specialization[0];
                });
              },
              items: specialization.map((String value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'نبذة تعريفية',
                  style: getbodyStyle(color: AppColors.black),
                )
              ],
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            maxLines: 5,
            controller: _bio,
            style: TextStyle(color: AppColors.black),
            decoration: const InputDecoration(
                hintText:
                    'سجل المعلومات الطبية العامة مثل تعليمك الأكاديمي وخبراتك السابقة...'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل النبذة التعريفية';
              } else {
                return null;
              }
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Divider(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'عنوان العيادة',
                  style: getbodyStyle(color: AppColors.black),
                )
              ],
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _address,
            style: TextStyle(color: AppColors.black),
            decoration: const InputDecoration(
              hintText: '5 شارع مصدق - الدقي - الجيزة',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل عنوان العيادة';
              } else {
                return null;
              }
            },
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'ساعات العمل من',
                        style: getbodyStyle(color: AppColors.black),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'الي',
                        style: getbodyStyle(color: AppColors.black),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              // ---------- Start Time ----------------
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          await showStartTimePicker();
                        },
                        icon: Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.color1,
                        )),
                    hintText: _startTime,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),

              // ---------- End Time ----------------
              Expanded(
                child: TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () async {
                          await showEndTimePicker();
                        },
                        icon: Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.color1,
                        )),
                    hintText: _endTime,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'رقم الهاتف 1',
                  style: getbodyStyle(color: AppColors.black),
                )
              ],
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _phone1,
            style: TextStyle(color: AppColors.black),
            decoration: const InputDecoration(
              hintText: '+20xxxxxxxxxx',
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return 'من فضلك ادخل الرقم';
              } else {
                return null;
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  'رقم الهاتف 2 (اختياري)',
                  style: getbodyStyle(color: AppColors.black),
                )
              ],
            ),
          ),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: _phone2,
            style: TextStyle(color: AppColors.black),
            decoration: const InputDecoration(
              hintText: '+20xxxxxxxxxx',
            ),
          ),
        ],
      ),
    );
  }

  showStartTimePicker() async {
    final datePicked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData(
      //       timePickerTheme: TimePickerThemeData(
      //           helpTextStyle: TextStyle(color: AppColors.color1),
      //           backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      //       colorScheme: ColorScheme.light(
      //         background: Theme.of(context).scaffoldBackgroundColor,
      //         primary: AppColors.color1, // header background color
      //         secondary: AppColors.black,
      //         onSecondary: AppColors.black,
      //         onPrimary: AppColors.black, // header text color
      //         onSurface: AppColors.black, // body text color
      //         surface: AppColors.black, // body text color
      //       ),
      //       textButtonTheme: TextButtonThemeData(
      //         style: TextButton.styleFrom(
      //           foregroundColor: AppColors.color1, // button text color
      //         ),
      //       ),
      //     ),
      //     child: child!,
      //   );
      // },
    );

    if (datePicked != null) {
      setState(() {
        _startTime = datePicked.format(context);
      });
    }
  }

  showEndTimePicker() async {
    final timePicker = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(
          DateTime.now().add(const Duration(minutes: 15))),
      // builder: (context, child) {
      //   return Theme(
      //     data: ThemeData(
      //       timePickerTheme: TimePickerThemeData(
      //           helpTextStyle: TextStyle(color: AppColors.color1),
      //           backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      //       colorScheme: ColorScheme.light(
      //         background: Theme.of(context).scaffoldBackgroundColor,
      //         primary: AppColors.color1, // header background color
      //         secondary: AppColors.black,
      //         onSecondary: AppColors.black,
      //         onPrimary: AppColors.black, // header text color
      //         onSurface: AppColors.black, // body text color
      //         surface: AppColors.black, // body text color
      //       ),
      //       textButtonTheme: TextButtonThemeData(
      //         style: TextButton.styleFrom(
      //           foregroundColor: AppColors.color1, // button text color
      //         ),
      //       ),
      //     ),
      //     child: child!,
      //   );
      // },
    );

    if (timePicker != null) {
      setState(() {
        _endTime = timePicker.format(context);
      });
    }
  }
}