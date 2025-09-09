import 'package:flutter/material.dart';

Color getStatusColor(String status) {
  switch (status) {
    case 'Approved':
      return const Color(0xff00ff000);

    case 'Rejected':
      return Colors.red;
    case 'Pending':
      return Colors.orange;
    default:
      return Colors.grey;
  }
}