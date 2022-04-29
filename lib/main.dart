import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app_flutter_mvvm/view/view.dart';
import 'package:news_app_flutter_mvvm/viewmodel/services/news_viewmodel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  MyApp({Key? key}) : super(key: key);

  final controller = Get.put(NewsViewModel());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'News App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black
          )
      ),
       home: FutureBuilder(
         future: _initialization,
         builder: (context, snapshot){
           if(snapshot.hasError){
             return const Center(child: Text('Unexpected error occured'));
           } else if(snapshot.hasData){
             return const HomeView();
           } else {
             return const Center(child:CircularProgressIndicator());
           }
         }
       ),
        //home: const HomeView(),
    );
  }
}
