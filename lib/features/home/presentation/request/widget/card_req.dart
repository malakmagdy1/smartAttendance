import 'package:flutter/material.dart';

import '../presentation/req_details.dart';
import 'get_status_color.dart';

class Cardrequst extends StatelessWidget {
  final Map<String, String> item;

  const Cardrequst({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // screen width
    final screenWidth = MediaQuery.of(context).size.width;

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
                Expanded(
                  // <-- Prevent overflow for long names
                  child: Text(
                    item['name'] ?? '',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      overflow: TextOverflow.ellipsis, // truncate if too long
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                  height: 30,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Reqdetails(item: item),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.grey,
                      shadowColor: Colors.grey,
                      elevation: 4,
                      // controls shadow intensity
                      shape: const StadiumBorder(),
                      // keeps rounded pill shape
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

            // Instead of fixed SizedBox(width: ..) use Expanded
            Row(
              children: [
                const Expanded(child: Text("Application Submission Date")),
                Text(
                  item['submissionDate'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Expanded(child: Text("The required date")),
                Text(
                  item['requiredDate'] ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Expanded(child: Text("Type of excuse")),
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
