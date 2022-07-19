import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todov2/routes/routes.dart';
import './Views/FrontPage.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // initialRoute: RoutesClass.getHomeRoute(),
      // getPages: RoutesClass.routes,
      home: AddNotesScreen(
        index: hashCode,
      ),
    );
  }
}
