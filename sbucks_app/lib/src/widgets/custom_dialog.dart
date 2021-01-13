import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

enum DialogAction { yes, abort }

class CustomDialog {
  static Future<DialogAction> common(BuildContext context,
      {Widget title,
      Widget widget,
      Function function,
      bool barrierDismissible = true}) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (BuildContext context) {
          return AlertDialog(
            contentPadding: EdgeInsets.symmetric(horizontal: 0),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                title,
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                widget,
              ],
            ),
            // shape:
            //     RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          );
        });

    return (action != null) ? action : DialogAction.abort;
  }

  static Future<DialogAction> optionDialog(BuildContext context,
      {Widget widget,
      Function function,
      String yesText = 'YES',
      String noText = 'NO'}) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: widget,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(noText),
              ),
              FlatButton(
                onPressed: () {
                  function();
                },
                child: Text(yesText),
              )
            ],
          );
        });

    return (action != null) ? action : DialogAction.abort;
  }

  static Future<DialogAction> yesAbortDialog({
    BuildContext context,
    String body,
    Function function,
  }) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              body,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('No'),
              ),
              FlatButton(
                onPressed: () {
                  function();
                },
                child: const Text(
                  'Yes',
                ),
              )
            ],
          );
        });

    return (action != null) ? action : DialogAction.abort;
  }

  static Future<DialogAction> unauthorizedDialog({
    BuildContext context,
    String body,
    Function function,
  }) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Text(
              body,
            ),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  function();
                },
                child: const Text(
                  'OK',
                ),
              )
            ],
          );
        });

    return (action != null) ? action : DialogAction.abort;
  }

  static Future<DialogAction> infoDialog({
    BuildContext context,
    String body,
    Function function,
  }) async {
    final action = await showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Container(
                  height: 180.0,
                  width: 150.0,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 30.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              color: Theme.of(context).primaryColor),
                        ),
                        Text(
                          body,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        FlatButton(
                            child: Center(
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    fontSize: 14.0,
                                    color: Theme.of(context).primaryColor),
                              ),
                            ),
                            onPressed: () => function(),
                            color: Colors.transparent)
                      ],
                    ),
                  )));
        });

    return (action != null) ? action : DialogAction.abort;
  }
}
