//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/explore.dart';
import 'package:untitled1/pages/home.dart';
import 'package:untitled1/pages/login.dart';
import 'package:untitled1/pages/messages.dart';
import 'package:untitled1/pages/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:untitled1/utils/constants.dart';
//import 'package:webview_flutter/webview_flutter.dart';

import 'inject.dart';
import 'package:provider/provider.dart';
import 'themes/color.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);
     /** if (kDebugMode) {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);//disable false
    }else{
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
          FirebaseCrashlytics.instance.crash();**/
  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
      /**  return CircularProgressIndicator(backgroundColor: Colors.cyanAccent,
      valueColor: AlwaysStoppedAnimation(Colors.blueAccent),
      strokeWidth: 9,);**/
  }
    //  FirebaseMessaging.onBackgroundMessage((message) => _firebaseMessagingBackgroundHandler());
  //if (!firebase.apps.length) {
  //  firebase.initializeApp(clientCredentials);
  //}
  await initApp();
  runApp(MyApp(),
  );
}

void initstate(){
   initstate();
  //requestPermission();
  //getToken();
 // initInfo();
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
       initialRoute: 'welcome screen',
      debugShowCheckedModeBanner: false,
      title: 'get a home',
      theme: ThemeData(
        primaryColor: AppColors.kPrimary,
      ),
     home: FutureBuilder(
       builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot)
    {
      if (snapshot.hasError) {
        print("Error");
      }
      if (snapshot.connectionState == ConnectionState.done) {
        return const login();
      }else{
        return const login();

      }},),
     routes: <String, WidgetBuilder>{
         'welcome_screen' :(context)=> login(),
         'homepage' :(context) => HomePage(),
      'explorer' :(context) => ExplorePage(),
      'messages' :(context) => messages(),
     }
    );
  }

}