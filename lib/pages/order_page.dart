// ignore_for_file: override_on_non_overriding_member
import 'package:flutter/material.dart';
import '../navgetion/hilaliRotermanger.dart';
import '../utils/cls_BasePage_appBar.dart';
import 'order_details.dart';

class OrdersPage extends BasePage {
  const OrdersPage({super.key}) : super(title: 'طلباتي');

  @override
  int getCurrentIndex() => 1;

  @override
  Widget buildBody(BuildContext context) {
    final orders = [
      {'id': '12345', 'date': '2024-01-15', 'total': '150 ر.س', 'status': 'مكتمل'},
      {'id': '12346', 'date': '2024-01-14', 'total': '200 ر.س', 'status': 'قيد التوصيل'},
    ];
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      itemBuilder: (context, index) {
        final order = orders[index];
        return Card(
          child: ListTile(
            leading: const Icon(Icons.shopping_bag, color: Color(0xFF6997AE)),
            title: Text('طلب #${order['id']}'),
            subtitle: Text('${order['date']} - ${order['total']}'),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: _getStatusColor(order['status']!),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                order['status']!,
                style: const TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
            onTap: () => HilaliRouter.navigateTo(
              const OrderDetailsPage(),
              arguments: {'order': order},
            ),
          ),
        );
      },
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'مكتمل': return Colors.green;
      case 'قيد التوصيل': return Colors.orange;
      default: return Colors.grey;
    }
  }
}