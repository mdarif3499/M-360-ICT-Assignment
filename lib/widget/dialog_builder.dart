import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';


class DialogBuilder {
  final BuildContext context;

  DialogBuilder(this.context);
  void showLoadingIndicator() {

    showPlatformDialog(
        context: context,
        androidBarrierDismissible: false,
        builder: (_) => AlertDialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 130),
              contentPadding: const EdgeInsets.only(top: 10.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0.0))),
              content: Builder(
                builder: (context) {
                  // Get available height and width of the build area of this widget. Make a choice depending on the size.
                  var height = MediaQuery.of(context).size.height;
                  var width = MediaQuery.of(context).size.width;
                  return Container(
                    height: 100,
                    width: width - 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: const <Widget>[
                        // Cupertino activity indicator with custom radius and disabled animation.
                        CupertinoActivityIndicator(
                            radius: 20.0, color: Color(0xff781efd)),
                        SizedBox(height: 10),
                        Text(
                          'Loading',
                          style: TextStyle(color: Colors.black),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),);
  }

  void hideOpenDialog() {
    Navigator.pop(context);
  }
}

