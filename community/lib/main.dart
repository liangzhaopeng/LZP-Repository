import 'package:community/routes/routes.dart';
import 'package:community/tabcontroller/tab_controller.dart';
import 'package:community/utils/as_util.dart';
import 'package:community/utils/custom_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'login/login_page.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  //强制竖屏
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    SpUtil.getInstance().then((value) {

      runApp(const MyApp());
      configLoading();
    });
  });
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final isLogin = SpUtil.preferences?.getBool("isLogin") ?? false;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Community Service',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      builder: (context, child) => FlutterEasyLoading(
        child: Scaffold(
          body: GestureDetector(
            onTap: () {
              SystemChannels.textInput.invokeMethod('TextInput.hide');
            },
            child: child,
          ),
        ),
      ),
      routes: routes,
      home: isLogin ? const MyTabbarController() : const LoginPage(),
    );
  }
}

