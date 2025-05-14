import 'package:flutter/material.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

  /*static KeyboardActionsConfig getKeyboardActionsConfig(List<FocusNode> list) {
    return KeyboardActionsConfig(
      keyboardActionsPlatform: KeyboardActionsPlatform.IOS,
      keyboardBarColor: Colors.grey[200],
      nextFocus: true,
      actions: List.generate(
          list.length,
              (i) => KeyboardActionsItem(
              focusNode: list[i],
              // closeWidget: const Padding(
              //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              //   child: Text("关闭"),
              // ),
              toolbarButtons: [
                    (node) {
                  return GestureDetector(
                    onTap: () => node.unfocus(),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.close),
                    ),
                  );
                }
              ]
          )),
    );
  }*/

  static String formatDouble(double toFormat) {
    return (toFormat * 10) % 10 != 0 ? "$toFormat" : "${toFormat.toInt()}";
  }
}