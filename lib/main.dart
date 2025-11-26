import 'package:flutter/material.dart';
import 'package:hw_navegtion_manager/pages/loginpage.dart';
import 'navgetion/hilaliRotermanger.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'تطبيق التنقل المحسن',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        scaffoldBackgroundColor: AppColors.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.secondary,
          elevation: 0,
          centerTitle: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
          ),
        ),
        fontFamily: 'Cairo', // يمكن تغيير الخط حسب الحاجة
      ),
      navigatorKey: HilaliRouter.navigatorKey,
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
