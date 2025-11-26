// ignore_for_file: override_on_non_overriding_member
import 'package:flutter/material.dart';
import '../navgetion/hilaliRotermanger.dart';
import '../utils/cls_BasePage_appBar.dart';
import '../widgets_castom/custom_button.dart';
 
class HomePage extends BasePage {
  const HomePage({super.key});
  
  @override
  int getCurrentIndex() => 0; //الفورم الرئيسية 
  
  @override
  AppBar buildAppBar() {

    return AppBar(
      backgroundColor: const Color(0xFF6997AE),
      title: const Text('مرحباً بك في التطبيق'),
      centerTitle: true,
      
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.person, color: Colors.white),
        onPressed: () => HilaliRouter.navigateTo(const ProfileScreen() as Widget),
      ),
    );
  }
  

  @override
  Widget buildBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.home_filled, size: 80, color: Color(0xFF6997AE)),
          const SizedBox(height: 20),
          const Text(
            'الصفحة الرئيسية',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          const SizedBox(height: 32),
          Column(
            children: [
              CustomButton(
                text: 'الملف الشخصي',
                onPressed: () => HilaliRouter.navigateTo(
                  const ProfileScreen() as Widget,
                  arguments: {'message': 'مرحباً من الصفحة الرئيسية!'},
                ),
              ),
              const SizedBox(height: 16),
              ],
          ),
        ],
      ),
    );
  }
}

class ProfileScreen {
  
  const ProfileScreen();
}

