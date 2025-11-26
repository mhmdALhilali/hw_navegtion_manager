// ignore_for_file: override_on_non_overriding_member

import 'package:flutter/material.dart';
import '../navgetion/hilaliRotermanger.dart';
import '../utils/cls_BasePage_appBar.dart';

class OrderDetailsPage extends BasePage {
  const OrderDetailsPage({super.key}) : super(
    title: 'تفاصيل الطلب',
    appBarColor: const Color(0xFF91B3EB),
  );
  @override
  int getCurrentIndex() => 1;
  @override
  Widget buildBody(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as Map?;
    final order = args?['order'] ?? {};

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailItem('رقم الطلب', order['id'] ?? '--'),
          _buildDetailItem('التاريخ', order['date'] ?? '--'),
          _buildDetailItem('المجموع', order['total'] ?? '--'),
          _buildDetailItem('الحالة', order['status'] ?? '--'),
          const Spacer(),
          ElevatedButton(
            onPressed: HilaliRouter.goBack,
            child: const Text('العودة للطلبات'),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}
