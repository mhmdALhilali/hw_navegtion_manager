import 'package:flutter/material.dart';
import 'package:hw_navegtion_manager/pages/home_page.dart';
import '../navgetion/hilaliRotermanger.dart';
import '../utils/Cls_validetion.dart';
import '../widgets_castom/custom_button.dart';

class IforgotPassword extends StatefulWidget {
  const IforgotPassword({super.key});
  
  @override
  State<IforgotPassword> createState() => _IforgotPasswordState();
}

class _IforgotPasswordState extends State<IforgotPassword> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  void _validateAndSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      HilaliRouter.navigateTo(
        const HomePage(),
        arguments: {'message': 'تم استرجاع الحساب بنجاح!'},
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF91B3EB),
        title: const Text('استرجاع الحساب'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.deepPurple),
          onPressed: HilaliRouter.goBack,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'اكتب بيانات المستخدم الصحيحة',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                      const SizedBox(height: 25),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'الاسم الكامل',
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        controller: _nameController,
                        validator: ValidationUtils.validateName, // ✅ استخدام الدالة المشتركة
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'البريد الإلكتروني',
                          prefixIcon: Icon(Icons.email),
                          border: OutlineInputBorder(),
                        ),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: ValidationUtils.validateEmail, // ✅ استخدام الدالة المشتركة
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'رقم الهاتف',
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(),
                        ),
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        validator: ValidationUtils.validatePhone, // ✅ استخدام الدالة المشتركة
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'استرجاع الحساب',
                        onPressed: _validateAndSubmit,
                        backgroundColor: const Color(0xFF91B3EB),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}