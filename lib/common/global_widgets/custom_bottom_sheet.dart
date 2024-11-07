import 'package:flutter/material.dart';


void openModalBottomSheet(BuildContext context,Widget contents) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            contents
          ]
        ),
      );
    },
  );
}
