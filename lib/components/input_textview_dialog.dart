import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../common/styles/styles.dart';
import 'highlight_well.dart';

typedef void Confirm(String text);

class TextViewDialog extends StatefulWidget {
  const TextViewDialog({Key? key, required this.confirm}) : super(key: key);
  final Confirm confirm;

  @override
  State<StatefulWidget> createState() {
    return _TextViewDialogState();
  }
}

class _TextViewDialogState extends State<TextViewDialog> {
  TextEditingController _editingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  late FocusScopeNode _scopeNode;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(milliseconds: 300), () {
      _scopeNode.requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (null == _scopeNode) {
      _scopeNode = FocusScope.of(context);
    }
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 160.sp),
          child: Container(
            width: 560.sp,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    '填写备注',
                    style: TextStyle(fontSize: 32.sp),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onSubmitted: (text) {
                      if (widget.confirm != null) {
                        widget.confirm(text);
                      }
                      Get.back();
                    },
                    controller: _editingController,
                    focusNode: _focusNode,
                    maxLines: 2,
                    style: TextStyle(fontSize: 32.sp),
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                        hintText: '备注...', border: InputBorder.none),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: 49,
                  child: Stack(
                    children: <Widget>[
                      Gaps.line,
                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: HighLightWell(
                              child: Container(
                                alignment: Alignment.center,
                                child: const Text(
                                  '取消',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              onTap: () {
                                Get.back();
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: HighLightWell(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  '确认',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              onTap: () {
                                if (widget.confirm != null) {
                                  widget.confirm(_editingController.text);
                                }
                                Get.back();
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
