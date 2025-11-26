اريد  التنقل بي الكود حقي بي اسمي وتحسين بثيه الواجهات بي والتنقل بين الواجهات بي الكود حقي لا تضبف تحسينات الي كود التنقل لا اريد تمرير ال context 
class HilaliRouter {
  static final GlobalKey<NavigatorState> navigatorKey = 
      GlobalKey<NavigatorState>();

  // الانتقال إلى صفحة جديدة مع تحسينات
  static Future<T?> navigateTo<T>(Widget page, 
      {Object? arguments, bool fullscreenDialog = false}) async {
    return await navigatorKey.currentState?.push<T>(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.easeInOut;
          
          var tween = Tween(begin: begin, end: end).chain(
            CurveTween(curve: curve)
          );
          
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        settings: RouteSettings(arguments: arguments),
        fullscreenDialog: fullscreenDialog,
      ),
    );
  }

  // استبدال الصفحة الحالية
  static Future<T?> replaceWith<T>(Widget page, 
      {Object? arguments}) async {
    return await navigatorKey.currentState?.pushReplacement<T, T>(
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(arguments: arguments),
      ),
    );
  }

  // الانتقال مع إزالة كل الصفحات السابقة
  static Future<T?> navigateAndRemoveUntil<T>(Widget page, 
      {Object? arguments}) async {
    return await navigatorKey.currentState?.pushAndRemoveUntil<T>(
      MaterialPageRoute(
        builder: (context) => page,
        settings: RouteSettings(arguments: arguments),
      ),
      (route) => false,
    );
  }

  // الرجوع إلى الصفحة السابقة
  static void goBack<T>([T? result]) {
    navigatorKey.currentState?.pop<T>(result);
  }

  // الحصول على السياق الحالي
  static BuildContext? get currentContext {
    return navigatorKey.currentState?.context;
  }
}




-----------------------------------------ملف نسيت كلمه المرور
import 'package:flutter/material.dart';
import 'package:hw_navegtion_manager/pages/home_page.dart';

import '../navgetion/hilaliRotermanger.dart';
import '../widgets_castom/custom_button.dart';
import 'profail.dart';

class IforgotPassword extends StatefulWidget {
  const IforgotPassword({super.key});
  @override
  State<IforgotPassword> createState() => _InputWidgetsDState();
}

class _InputWidgetsDState extends State<IforgotPassword> {
  final _formkey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 145, 179, 235),
        title: const Text('استرجاع الحساب  '),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            HilaliRouter.navigateTo(
              const ProfileScreen(),
              arguments: {'message': 'مرحباً من الصفحة الملف الشخصي!'},
            );
          },
          child: Icon(Icons.person, color: Colors.deepPurple),
        ),
      ),

      body: Container(
        child: Center(
          key: _formkey,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' اكتب بيانات المستخدم الصحيحة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'كتابة الاسم الكامل سيتم المطابقة ',
                          prefix: Icon(Icons.person),
                        ),
                        controller: _nameController,
                      ),
                      const SizedBox(height: 12),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: 'البريد الألكتروني  ',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 12),
                      const TextField(
                        decoration: InputDecoration(
                          labelText: '   رقم الهاتـف ',
                          prefixIcon: Icon(Icons.lock),
                        ),
                      ),
                      const SizedBox(height: 90),

                      //-----------------------------------
                      CustomButton(
                        text: 'تسجيل الدخول   ',
                        onPressed: () {
                          HilaliRouter.navigateTo(
                            const HomePage(),
                            arguments: {'message': 'مرحباً '},
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //   اfixed لا يقبل اكثر من 3 عناصر فقط نحوله الي shefting النوع التبلقائي
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.orange.shade50,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),

          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'favorite',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'profile'),
        ],
      ),
    );
  }
}
----------------------------------الصفحه الرسميه اريد لها تحسين وعمل كود البتون نافجيشن بار بي اختصار لكل الواجهات 
import 'package:flutter/material.dart';
import '../navgetion/hilaliRotermanger.dart' show HilaliRouter;
import '../theme/app_colors.dart';
import '../widgets_castom/custom_button.dart' show CustomButton;
import 'profail.dart';
import 'second_page.dart';
import 'seting.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 151, 174),
        title: const Text(  'مرحباً بك في التطبيق'),
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            HilaliRouter.navigateTo(const ProfileScreen());
          },
          child: Icon(Icons.person, color: const Color.fromARGB(222, 30, 26, 26),)
        ),
      ),

      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          

            const SizedBox(height: 32),

            // أزرار التنقل
            Column(
              children: [
                CustomButton(
                  text: 'انتقل إلى الصفحة الملف الشخصي',
                  onPressed: () {
                    HilaliRouter.navigateTo(const ProfileScreen(),
                      arguments: {'message': 'مرحباً من الصفحة الرئيسية!'},
                    );
                  },
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'انتقل الئ الصفحة الاعدادات',
                  onPressed: () {
                    HilaliRouter.replaceWith(const SecondPage());
                  },
                  backgroundColor: AppColors.accent,
                ),
                const SizedBox(height: 16),
                CustomButton(
                  text: 'انتقل وإزالة السجل',
                  onPressed: () {
                    HilaliRouter.navigateAndRemoveUntil(const SecondPage());
                  },
                  backgroundColor: AppColors.secondary,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}-------------------------------البتون الجاهز import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final bool isFullWidth;
  final double borderRadius;
  final double elevation;

  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.isFullWidth = true,
    this.borderRadius = 12.0,
    this.elevation = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : null,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

