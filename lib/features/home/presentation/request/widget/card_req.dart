import 'package:flutter/material.dart';

import '../presentation/req_details.dart';
import 'get_status_color.dart';

class Cardrequst extends StatelessWidget {
  final Map<String, String> item;

  const Cardrequst({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF395486)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage("assets/icons/person.jpeg"),
                ),
                const SizedBox(width: 10),
                Text(
                  item['name'] ?? '',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: OutlinedButton(
                    onPressed: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Reqdetails(item:item),
                      ),
                    );},
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.grey, width: 1.0),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                    ),
                    child: const Text(
                      "Request Details",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text("Application Submission Date"),
                const SizedBox(width: 54),
                Text(
                  item['submissionDate'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text("The required date"),
                const SizedBox(width: 137),
                Text(
                  item['requiredDate'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Text("Type of excuse"),
                const SizedBox(width: 160),
                Text(
                  item['type'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                item['status'] ?? '',
                style: TextStyle(
                  color: getStatusColor(item['status'] ?? ''),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}