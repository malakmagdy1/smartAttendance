import 'package:flutter/material.dart';

import '../widget/get_status_color.dart';

class Reqdetails extends StatelessWidget {
  final Map<String, String> item;

  const Reqdetails({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        leading: Center(
          child: Container(
            width: 40,
            height: 40,
            margin: const EdgeInsets.only(left: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF395486), size: 20),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        title: const Text(
          "Request Details",
          style: TextStyle(color: Color(0xFF395486)),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 48,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: getStatusColor(item['status'] ?? 'Approved'),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    item['status'] ?? 'Approved',
                    style: TextStyle(
                      color: getStatusColor(item['status'] ?? 'Approved'),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF395486)),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Type Of Excuse : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF606060),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          item['type'] ?? 'Health Excuse',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          "The Submission Date : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF606060),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          item['submissionDate'] ?? '22 Dec 2025',
                          style: const TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    const Divider(thickness: 1, color: Color(0xFF606060)),

                    const SizedBox(height: 20),
                    const Text(
                      "Reason :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF606060),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      item['reason'] ?? 'No reason provided.',
                      style: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "The Required Date :",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF606060),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "From : ${item['requiredDate'] ?? '27 Dec 2025'}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "To   : ${item['toDate'] ?? ''}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Divider(thickness: 1, color: Color(0xFF606060)),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Text(
                          "File :",
                          style: TextStyle(
                            color: Color(0xFF606060),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Spacer(),
                        Text(
                          "Show File",
                          style: TextStyle(
                            fontSize: 17,
                            color: Color(0xFF395486),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}