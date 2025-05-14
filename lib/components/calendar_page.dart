import 'package:account_book/common/colors/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../common/styles/styles.dart';
import '../utils/tips.dart';
import 'highlight_well.dart';

typedef void CalendarMonthCallback(String year, String month);

/// 月份选择弹框
class CalendarMonthDialog extends StatefulWidget {
  const CalendarMonthDialog(
      {super.key,
      this.nowYear = -1,
      this.nowMonth = -1,
      this.minYear = 1971,
      this.maxYear = 2055,
      required this.checkTap});

  // 当前年月
  final int nowYear;
  final int nowMonth;

  // 最小和最大年份
  final int minYear;
  final int maxYear;

  // 确认回调
  final CalendarMonthCallback checkTap;

  @override
  State<StatefulWidget> createState() {
    return _CalendarMonthDialogState();
  }
}

class _CalendarMonthDialogState extends State<CalendarMonthDialog>
    with SingleTickerProviderStateMixin {
  // 当选选择年份
  late int _selectedYear;

  // 当选选择月份
  late int _selectedMonth;

  /// 容器宽度
  final double _width = 560.sp;

  /// 主轴间距
  final double _spacing = 16.sp;

  /// 纵轴间距
  final double _runSpacing = 16.sp;

  /// 左右间距
  final double _leftAndRightSpace = 30;

  @override
  void initState() {
    super.initState();
    // 如果没有配置时间，设置成当前的时间
    if (widget.nowYear == -1 || widget.nowMonth == -1) {
      _selectedYear = DateTime.now().year;
      _selectedMonth = DateTime.now().month;
    } else {
      _selectedYear = widget.nowYear;
      _selectedMonth = widget.nowMonth;
    }
  }

  @override
  Widget build(BuildContext context) {
    double itemWidth = (_width - _leftAndRightSpace * 2 - _spacing * 3) / 4;
    return Material(
      // 创建透明层
      type: MaterialType.transparency, //透明类型
      child: Center(
          child: Container(
              width: _width,
              decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  _buildTitle(),
                  Container(
                    alignment: Alignment.center,
                    margin:
                        EdgeInsets.symmetric(horizontal: _leftAndRightSpace),
                    child: Wrap(
                      spacing: _spacing,
                      runSpacing: _runSpacing,
                      alignment: WrapAlignment.center, // 沿主轴方向居中
                      children: _buildMonth(itemWidth),
                    ),
                  ),
                  _buildBottom(context)
                ],
              ))),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: _leftAndRightSpace),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Text('$_selectedYear-${_selectedMonth.toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 16)),
          Positioned(
            left: 20,
            child: HighLightWell(
              child: const SizedBox(
                width: 44,
                height: 44,
                child: Icon(Icons.chevron_left),
              ),
              onTap: () {
                if (_selectedYear <= widget.minYear) {
                  Tips.showToast('$widget.minYear年是最小年份');
                } else {
                  setState(() {
                    _selectedYear -= 1;
                  });
                }
              },
            ),
          ),
          Positioned(
            right: 20,
            child: HighLightWell(
              child: const SizedBox(
                height: 44,
                width: 44,
                child: Icon(Icons.chevron_right),
              ),
              onTap: () {
                if (_selectedYear >= widget.maxYear) {
                  Tips.showToast('$widget.maxYear年是最大年份');
                } else {
                  setState(() {
                    _selectedYear += 1;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _buildMonth(double itemWidth) {
    return List.generate(
        12,
        (int index) => Container(
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedMonth = index + 1;
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  width: itemWidth,
                  height: itemWidth,
                  decoration: BoxDecoration(
                    color: index + 1 == _selectedMonth
                        ? AppColors.app_main
                        : Colors.white,
                    borderRadius: BorderRadius.circular(itemWidth / 2),
                  ),
                  child: Text(
                    '${index + 1}月',
                    style: TextStyle(
                        fontSize: 16,
                        color: index + 1 == _selectedMonth
                            ? Colors.white
                            : Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ));
  }

  Widget _buildBottom(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
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
                    // NavigatorUtils.goBack(context);
                  },
                ),
              ),
              Gaps.hGapLine(gap: 0.3),
              Expanded(
                flex: 1,
                child: HighLightWell(
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text(
                      '确认',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  onTap: () {
                    widget.checkTap('$_selectedYear',
                        _selectedMonth.toString().padLeft(2, '0'));

                    // NavigatorUtils.goBack(context);
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
