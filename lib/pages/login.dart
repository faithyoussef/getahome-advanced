//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
//import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled1/pages/explore.dart';
import 'package:untitled1/pages/extension.dart';
import 'package:untitled1/pages/settings.dart';
//import 'package:wc_form_validators/wc_form_validators.dart';
//import 'package:modal_progress_hud/modal_progress_hud.dart';


import 'home.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  final _passwordController = TextEditingController();
  String? _passwordError;
  final formKey = GlobalKey<FormState>();
  //final _navKey = GlobalKey<NavigatorState>();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  final _emailController = TextEditingController();
  String? _emailError;
  void initstate(){
    initstate();
    requestPermission();
    //getToken();
    //initInfo();
  }


  Future<void>requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: false,
        //authorizationStatus: authorizationStatus,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        sound: true);
    if(settings.authorizationStatus == AuthorizationStatus.authorized){
      print("user granted permission");

    }else if(settings.authorizationStatus == AuthorizationStatus.provisional) {
      print("User granted provisonal permission");
    }else{
      print('user declined or hasnot accepted permission');
    }
  }

  String? mtoken = "";
  static const users = const {
    'dribble@gmail.com': '123545',
    'hunter@gmail.com': 'hunter'
  };


  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name},'
        'Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password doesnot match';
      }
      return null;
    });
  }


  void saveToken(String token) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: '',
        password: ''
      //"token": token
    );
  }
  void getToken() async {
    await FirebaseMessaging.instance.getToken().then(
            (token) {
          setState(() {
            mtoken = token;
            if (kDebugMode) {
              print("My token is $mtoken");
            }
          });
          saveToken(token!);
        }
    );
  }
  static const String routeName = '/list_screen';

  //final _navKey = GlobalKey<NavigatorState>();

late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
       body:  Padding(
           padding: const EdgeInsets.symmetric(
               horizontal: 24.0),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: <Widget>[
             Container(
                 child: TextField(
               keyboardType: TextInputType.emailAddress,
               textAlign: TextAlign.center,
               onChanged: (value) {
                 email = value;
                 //Do something with the user input.
               },
               decoration: InputDecoration(
                   hintText: 'Enter your email'))),
               SizedBox(height: 4,),
                 Container(
                   child: TextField(
                       obscureText: true,
                   textAlign: TextAlign.center,
                   onChanged: (value) {
                     password = value;
                     //Do something with the user input.
                   },
                   decoration: InputDecoration(
                       hintText: 'Enter your Password')),
                   ),
               SizedBox(
                 height: 24.0,
               ),
               ElevatedButton(
                // statesController: ,
                   onPressed: () async {
                     setState(() {
                        context.push(HomePage());
                       showSpinner = true;
                     });
                     try {
                       final newUser = await _auth
                           .createUserWithEmailAndPassword(
                           email: email,
                           password: password);
                       if (newUser != null) {
                         Navigator.pushNamed(context,
                             'HomePage');
                       }
                     } catch (e) {
                       print(e);
                     }
                     setState(() {
                       showSpinner = false;
                     },
                     );
                   }, child: const Text("Sign up",
               style: CupertinoTextField.cupertinoMisspelledTextStyle,),),
               SizedBox(
                 height: 14.0,
               ),
               ElevatedButton(
                 // statesController: ,
                 onPressed: () async {
                   setState(() {
                     context.push(
                     HomePage());
                     showSpinner = true;
                   });
                   try {
                     final newUser = await _auth
                         .createUserWithEmailAndPassword(
                         email: email,
                         password: password);
                     if (newUser != null) {
                       Navigator.pushNamed(context,
                           'HomePage');
                     }
                   } catch (e) {
                     print(e);
                   }
                   setState(() {
                     showSpinner = false;
                   },
                   );
                 }, child: const Text("Sign up anonymously",
                 style: CupertinoTextField.cupertinoMisspelledTextStyle,),),
             ], ),
           ),

         );
        }
  }

