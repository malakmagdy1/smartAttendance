import 'package:flutter/material.dart';

class RowRadio extends StatefulWidget {
  final String title;
  final String optionO;
  final String optionT;
  final String initialOption;

  const RowRadio({
    super.key,
    required this.title,
    required this.optionO,
    required this.optionT,
    required this.initialOption,
  });

  @override
  State<RowRadio> createState() => _RowRadioState();
}

class _RowRadioState extends State<RowRadio> {
  late final String currentOption;

  void initState() {
    super.initState();
    currentOption = widget.initialOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Radio<String>(
                  value: widget.optionO,
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                  },
                ),
                Text(widget.optionO),
              ],
            ),
            const SizedBox(width: 60), // spacing between options
            Row(
              children: [
                Radio<String>(
                  value: widget.optionT,
                  groupValue: currentOption,
                  onChanged: (value) {
                    setState(() {
                      currentOption = value!;
                    });
                  },
                ),
                Text(widget.optionT),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
