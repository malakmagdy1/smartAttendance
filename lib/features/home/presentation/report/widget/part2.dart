import 'package:flutter/material.dart';

class Part2DetailsReport extends StatelessWidget {
  const Part2DetailsReport({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTimingRow("S", "Holiday", "", Color(0xFFECD614), "00 h 00m"),
        buildTimingRow("S", "08:00", "06:00", Color(0xff00ff00), "10 h 00m"),
        buildTimingRow("M", "08:20", "06:50", Color(0xff00ff00), "09 h 30m"),
        buildTimingRow("T", "10:30", "08:00", Color(0xFFD80000), "08 h 30m"),
        buildTimingRow("W", "10:30", "08:00", Color(0xFFD80000), "08 h 30m"),
        buildTimingRow("T", "10:30", "08:00", Color(0xFFD80000), "08 h 30m"),
        buildTimingRow("F", "Holiday", "", Color(0xFFECD614), "00 h 00m"),
      ],
    );
  }
}
Widget buildTimingRow(
    String day,
    String inTime,
    String outTime,
    Color color,
    String hours,
    ) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        SizedBox(
          width: 20,
          child: Text(
            day,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Container(
            height: 22,
            decoration: BoxDecoration(
              color: color.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(
                    inTime,
                    style: TextStyle(
                      fontSize: 12,
                      color: getInTimeColor(inTime),
                    ),
                  ),
                ),
                const Spacer(),
                if (outTime.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      outTime,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 10),
        Text(hours, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}




Color getPointColor(double hour) {
  if (hour < 9.5) return Color(0xff00ff00);
  if (hour < 10.5) return Color(0xFFECD614);
  return Color(0xFFD80000);
}

Color getInTimeColor(String inTime) {
  if (inTime.isEmpty || inTime.toLowerCase() == "holiday") {
    return Colors.black;
  }

  try {
    final parts = inTime.split(":");
    final hour = int.parse(parts[0]);

    if (hour < 10) {
      return Colors.black;
    } else if (hour == 10) {
      return Colors.
      black;
    }
  } catch (e) {
    return Colors.black;
  }

  return Colors.black;
}