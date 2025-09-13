import 'package:flutter/material.dart';

import '../../../../../core/theme/palette.dart';
import '../presentation/task_details_screen.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({super.key});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  // Track each checkbox separately
  List<bool> isCheckedList = [false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/profile.png"),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "Hello, Farida",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Palette.appColors.mainColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              // Generate multiple tasks dynamically
              CustomRow(
                title: "Finish Your Homework",
                value: isCheckedList[0],
                onChanged: (newVal) {
                  setState(() {
                    isCheckedList[0] = newVal!;
                  });
                },
              ),
              CustomRow(
                title: "Read Your Book",
                value: isCheckedList[1],
                onChanged: (newVal) {
                  setState(() {
                    isCheckedList[1] = newVal!;
                  });
                },
              ),
              CustomRow(
                title: "Practice Flutter",
                value: isCheckedList[2],
                onChanged: (newVal) {
                  setState(() {
                    isCheckedList[2] = newVal!;
                  });
                },
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, TaskDetailsScreen.routeName);
                },
                child: Text("In Progress"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRow extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;

  const CustomRow({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: Palette.appColors.mainColor,
          onChanged: onChanged,
        ),
        Text(title),
      ],
    );
  }
}
