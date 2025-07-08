import 'package:flutter/material.dart';

class CDialogBox {
  static Future<void> dialogBox({required BuildContext context, required Widget content}) async {
    return showDialog(
      context: context,
      builder: (_) {
        return Dialog(
          child: Container(
            color: Colors.amber,
            height: 200,
            width: 200,
            child: content,
          ),
        );
      },
    );
  }
}
