import 'package:flutter/material.dart';
import 'package:test_salma/core/widgets/text/custom_text.dart';

import '../../../../../core/theme/palette.dart';

class PrivacyCard extends StatefulWidget {
  final String title;
  final String textt;

  PrivacyCard({required this.title, required this.textt});

  @override
  State<PrivacyCard> createState() => _PrivacyCardState();
}

class _PrivacyCardState extends State<PrivacyCard> {
  int taped = 2; // keep track of max lines

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(color: Palette.appColors.mainColor),
        ),
        trailing: IconButton(
          icon: Icon(taped == 2 ? Icons.arrow_drop_down : Icons.arrow_drop_up),
          color: Palette.appColors.mainColor,
          onPressed: () {
            setState(() {
              taped = (taped == 2)
                  ? 5
                  : 2; // toggle between collapsed & expanded
            });
          },
        ),
        title: CustomText.s16(
          widget.title,
          bold: true,
          color: Palette.appColors.mainColor,
        ),
        subtitle: Text(
          widget.textt,
          maxLines: taped,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
