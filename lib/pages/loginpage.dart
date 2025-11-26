// 📁 pages/login_page.dart
import 'package:flutter/material.dart';
import '../navgetion/hilaliRotermanger.dart';
import '../utils/Cls_validetion.dart';
import '../utils/cls_user.dart';
import '../widgets_castom/custom_button.dart';
import 'home_page.dart';
import 'iforgot.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  void _handleLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // إنشاء مستخدم وهمي (في التطبيق الحقيقي بيكون من API)
      final user = UserModel(
        id: '1',
        name: 'أحمد محمد',
        email: _emailController.text,
        phone: '+966 55 123 4567',
        profileImage: null,
      );

      // حفظ بيانات المستخدم في السيرفيس
      UserService.setUser(user);

      // الانتقال للصفحة الرئيسية مع بيانات المستخدم
      HilaliRouter.navigateAndRemoveUntil(
        const HomePage(),
        arguments: {
          'user': user.toMap(),
          'message': 'تم تسجيل الدخول بنجاح!'
        },
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تسجيل الدخول'),
        backgroundColor: const Color(0xFF6997AE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'البريد الإلكتروني',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: ValidationUtils.validateEmail,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'كلمة المرور',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: ValidationUtils.validatePassword,
              ),
              const SizedBox(height: 30),
              CustomButton(
                text: 'تسجيل الدخول',
                onPressed: _handleLogin,
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => HilaliRouter.navigateTo(const IforgotPassword()),
                child: const Text('نسيت كلمة المرور؟'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


