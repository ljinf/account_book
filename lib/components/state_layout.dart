import 'package:account_book/common/colors/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../common/fonts/fonts.dart';
import '../common/styles/styles.dart';
import '../utils/utils.dart';

class StateLayout extends StatefulWidget {
  const StateLayout(
      {super.key,
      this.image = 'icons/empty_icon',
      this.hintText = '暂无数据',
      this.isLoading = false});

  final String image;
  final String hintText;
  final bool isLoading;

  @override
  _StateLayoutState createState() => _StateLayoutState();
}

class _StateLayoutState extends State<StateLayout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          widget.isLoading
              ? const SpinKitRotatingCircle(color: Color(0xFF333333))
              : (widget.image.isEmpty
                  ? Gaps.empty
                  : Image.asset(
                      Utils.getImagePath(widget.image),
                      width: 120,
                    )),
          Gaps.vGap(16),
          widget.hintText.isEmpty
              ? Gaps.empty
              : Text(
                  widget.hintText,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: AppFonts.font_sp14, color: AppColors.gray),
                  maxLines: 5,
                ),
          Gaps.vGap(30),
        ],
      ),
    );
  }
}
