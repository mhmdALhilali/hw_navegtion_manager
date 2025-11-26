import 'package:flutter/material.dart';
import '../navgetion/hilaliRotermanger.dart';
import '../pages/home_page.dart';
import '../pages/order_page.dart';
 
abstract class BasePage extends StatelessWidget {
  final String? title;
  final Color? appBarColor;
  final Widget? leading;
  final List<Widget>? actions;

  const BasePage({
    super.key,
    this.title,
    this.appBarColor = const Color(0xFF6997AE),
    this.leading,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: buildBody(context),
      bottomNavigationBar: _buildBottomNavBar(getCurrentIndex()),
    );
  }

  AppBar? _buildAppBar() {
    if (title == null) return null;
    
    return AppBar(
      backgroundColor: appBarColor,
      title: Text(title!),
      centerTitle: true,
      elevation: 0,
      leading: leading ?? _defaultLeading(),
      actions: actions,
    );
  }

  Widget? _defaultLeading() {
    return IconButton(
      icon: const Icon(Icons.arrow_back, color: Colors.white),
      onPressed: HilaliRouter.goBack,
    );
  }

  // يجب تنفيذ هذه الدوال في الصفحات
  Widget buildBody(BuildContext context);
  int getCurrentIndex();

  BottomNavigationBar _buildBottomNavBar(int currentIndex) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.orange.shade50,
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: _onNavItemTapped,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'الرئيسية'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag), label: 'طلباتي'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'السلة'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'الملف'),
      ],
    );
  }

  void _onNavItemTapped(int index) {
    switch (index) {
      case 0:
        HilaliRouter.navigateAndRemoveUntil(const HomePage());
        break;
      case 1:
        HilaliRouter.navigateTo(const OrdersPage());
        break;
      case 3:
        HilaliRouter.navigateTo(const ProfileScreen() as Widget);
        break;
    }
  }
}