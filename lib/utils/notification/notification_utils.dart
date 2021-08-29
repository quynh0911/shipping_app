import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

showWarningDialog(String message, BuildContext context,
    [Function? onConfirm, String textConfirm = "OK"]) {
  return showCupertinoDialog(
    context: context,
    builder: (context) => CupertinoAlertDialog(
      content: Text(message),
      actions: [
        CupertinoDialogAction(
            child: Text(textConfirm),
            onPressed: () {
              Navigator.pop(context);
              if (onConfirm != null) {
                onConfirm();
              }
            }),
      ],
    ),
  );
}

showConfirmDialog(
    String title, String content, Function onConfirm, BuildContext context,
    [Function? onCancel,
    String textConfirm = "Có",
    String textCancel = "Không"]) {
  return showCupertinoDialog(
      context: context,
      builder: (_) => CupertinoAlertDialog(
            title: Text(title),
            content: Text(content),
            actions: [
              CupertinoDialogAction(
                  child: Text(textCancel),
                  onPressed: () {
                    Navigator.pop(context);
                    if (onCancel != null) {
                      onCancel();
                    }
                  }),
              CupertinoDialogAction(
                  child: Text(textConfirm),
                  onPressed: () async {
                    Navigator.pop(context);
                    onConfirm();
                  })
            ],
          ));
}

showLoading(BuildContext context) =>
    Loader.show(context, progressIndicator: const CircularProgressIndicator());

hideLoading() => Loader.hide();
