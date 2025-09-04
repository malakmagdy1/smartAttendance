import 'package:flutter/material.dart';

Widget customSquareRadio<T>({
  required T value,
  required T? groupValue,
  required String label,
  required VoidCallback onTap,
}) {
  final isSelected = value == groupValue;
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: isSelected ? const Color(0xFF395486) : Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),

            child:
            isSelected
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 10),
          Text(label, style: const TextStyle(fontSize: 16)),
        ],
      ),
    ),
  );
}

void ShowFilterSheet({
  required BuildContext context,
  required bool sortNewestFirst,
  required String? filterStatus,
  required Function(bool) onSortChanged,
  required Function(String?) onFilterChanged,
}) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    isScrollControlled: false,
    constraints: BoxConstraints(
      maxHeight: MediaQuery.of(context).size.height * 0.5,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 16,
            top: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Divider(
                thickness: 5,
                color: Color(0xFF606060),
                indent: 160,
                endIndent: 160,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  const Text(
                    "Filter Requests:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 22,
                      color: Color(0xFF395486),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sort By:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              customSquareRadio<bool>(
                value: true,
                groupValue: sortNewestFirst,
                label: "Newest First",
                onTap: () {
                  onSortChanged(true);
                  Navigator.pop(context);
                },
              ),
              customSquareRadio<bool>(
                value: false,
                groupValue: sortNewestFirst,
                label: "Oldest First",
                onTap: () {
                  onSortChanged(false);
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),

              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Status:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              customSquareRadio<String?>(
                value: "Approved",
                groupValue: filterStatus,
                label: "Approved",
                onTap: () {
                  onFilterChanged("Approved");
                  Navigator.pop(context);
                },
              ),
              customSquareRadio<String?>(
                value: "Pending",
                groupValue: filterStatus,
                label: "Pending",
                onTap: () {
                  onFilterChanged("Pending");
                  Navigator.pop(context);
                },
              ),
              customSquareRadio<String?>(
                value: "Rejected",
                groupValue: filterStatus,
                label: "Rejected",
                onTap: () {
                  onFilterChanged("Rejected");
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}