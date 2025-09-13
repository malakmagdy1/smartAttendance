import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/bottom_sheet.dart';
import '../widget/card_req.dart';
import 'add_request.dart';

class RequestScreen extends StatefulWidget {
  const RequestScreen({super.key});

  @override
  State<RequestScreen> createState() => _RequestScreenState();
}

class _RequestScreenState extends State<RequestScreen> {
  List<Map<String, String>> allRequests = [];
  List<Map<String, String>> filteredRequests = [];

  bool sortNewestFirst = true;
  String? filterStatus;

  @override
  void initState() {
    super.initState();
    allRequests = [
      {
        "name": "arida Ahmed",
        "submissionDate": "22 Aug 2025",
        "requiredDate": "2 Aug 2025",
        "type": "Health Excuse",
        "status": "Approved",
      },    {
        "name": "Farida Ahmed",
        "submissionDate": "22 May 2025",
        "requiredDate": "27 May 2025",
        "type": "Health Excuse",
        "status": "Rejected",
      },    {
        "name": "Farida Ahmed",
        "submissionDate": "22 Feb 2025",
        "requiredDate": "27 Feb 2025",
        "type": "Health Excuse",
        "status": "Pending",
      },
      {
        "name": "Farida Ahmed",
        "submissionDate": "22 Dec 2025",
        "requiredDate": "27 Dec 2025",
        "type": "Health Excuse",
        "status": "Approved",
      },
      {
        "name": "Earida Ahmed",
        "submissionDate": "10 Nov 2025",
        "requiredDate": "14 Nov 2025",
        "type": "Health Excuse",
        "status": "Rejected",
      },
    ];applyFilters();
  }

  void applyFilters() {
    List<Map<String, String>> updated = [...allRequests];
    if (filterStatus != null) {
      updated = updated.where((item) => item['status'] == filterStatus).toList();
    }

    updated.sort((a, b) {
      final dateA = DateTime.parse(_formatDate(a['submissionDate']!));
      final dateB = DateTime.parse(_formatDate(b['submissionDate']!));
      return sortNewestFirst ? dateB.compareTo(dateA) : dateA.compareTo(dateB);
    });

    setState(() {
      filteredRequests = updated;
    });
  }

  String _formatDate(String date) {
    final parts = date.split(' ');
    final day = parts[0];
    final month = {
      'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04',
      'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08',
      'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12',
    }[parts[1]]!;
    final year = parts[2];
    return "$year-$month-$day";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Requests",
          style: TextStyle(
            color: Color(0xFF395486),
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          SafeArea(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        ShowFilterSheet(
                          context: context,
                          sortNewestFirst: sortNewestFirst,
                          filterStatus: filterStatus,
                          onSortChanged: (bool newValue) {
                            setState(() {
                              sortNewestFirst = newValue;
                              applyFilters();
                            });
                          },
                          onFilterChanged: (String? newStatus) {
                            setState(() {
                              filterStatus = newStatus;
                              applyFilters();
                            });
                          },
                        );
                      },
                      icon: SvgPicture.asset(
                        'assets/icons/mage_filter.svg',
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                if (filteredRequests.isEmpty)
                  const Center(child: Text("No results"))
                else
                  ...filteredRequests.map((item) => Cardrequst(item: item)),
              ],
            ),
          ),

          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.height * 0.65,
            child: SizedBox(
              width: 60,
              height: 60,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddNewRequestScreen(),
                    ),
                  );
                },
                backgroundColor: const Color(0xFF395486),
                shape: const CircleBorder(),
                child: const Icon(Icons.add, size: 30, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}