import 'package:account_book/pages/bill/account/account_book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/colors/colors.dart';
import '../../components/highlight_well.dart';
import '../bill/list/bill_list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  /// 当前显示页面
  int _currentIndex = 0;

  final _pageController = PageController();

  final _pages = <Widget>[BillListPage(), AccountBookPage()];

  DateTime _lastTime = DateTime.now();

  Future<bool> _isExit() {
    if (DateTime.now().difference(_lastTime) >
        const Duration(milliseconds: 2500)) {
      _lastTime = DateTime.now();
      EasyLoading.showToast('再次点击退出应用');
      return Future.value(false);
    }
    EasyLoading.dismiss();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    // 获取屏幕尺寸
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    ScreenUtil.init(context, designSize: Size(width, height));

    return WillPopScope(
      onWillPop: _isExit,
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: Scaffold(
          bottomNavigationBar: BottomAppBar(
            // 悬浮按钮，与其他菜单栏的结合方式
            // shape: CircularNotchedRectangle(),
            // FloatingActionButton和BottomAppBar 之间的差距
            // notchMargin: 0.0,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _buildBottomItem(0, '账单', Icons.description),
                _buildBottomItem(-1, '记账', null),
                _buildBottomItem(1, '统计', Icons.pie_chart),
                // _buildBottomItem(2, '账户', Icons.account_balance_wallet),
                // _buildBottomItem(3, '我的', Icons.account_box),
              ],
            ),
          ),
          // 使用PageView的原因参看 https://zhuanlan.zhihu.com/p/58582876
          //在子页State中继承AutomaticKeepAliveClientMixin并重写wantKeepAlive 返回true
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            physics: defaultTargetPlatform == TargetPlatform.iOS
                ? NeverScrollableScrollPhysics() // 禁止滑动
                : AlwaysScrollableScrollPhysics(),
            children: _pages,
          ),
        ),
      ),
    );
  }

  void onTap(int index) {
    _pageController.jumpToPage(index);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _buildBottomItem(int index, String title, IconData? data) {
    //未选中样式
    TextStyle textStyle =
        const TextStyle(fontSize: 12.0, color: AppColors.gray);
    TextStyle selectedTextStyle =
        const TextStyle(fontSize: 12.0, color: AppColors.black);
    Color iconColor = AppColors.gray;
    Color selectedIconColor = AppColors.black;
    double iconSize = 25;

    return data != null
        ? Expanded(
            flex: 1,
            child: HighLightWell(
              isPressingEffect: false,
              onTap: () {
                if (index != _currentIndex) {
                  onTap(index);
                }
              },
              child: Container(
                height: 49,
                padding: const EdgeInsets.only(top: 5.5),
                child: Column(
                  children: <Widget>[
                    Icon(
                      data,
                      size: iconSize,
                      color: _currentIndex == index
                          ? selectedIconColor
                          : iconColor,
                    ),
                    Text(
                      title,
                      style: _currentIndex == index
                          ? selectedTextStyle
                          : textStyle,
                    )
                  ],
                ),
              ),
            ),
          )
        : Expanded(
            flex: 1,
            child: Container(
              height: 49,
              child: OverflowBox(
                minHeight: 49,
                maxHeight: 80,
                child: HighLightWell(
                  onTap: () {
                    // NavigatorUtils.push(context, BillRouter.bookkeepPage,
                    //     transition: TransitionType.cupertinoFullScreenDialog);
                  },
                  isPressingEffect: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      Positioned(
                        top: 0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(48 / 2),
                            border: Border.all(width: 2, color: Colors.white),
                            boxShadow: const [
                              BoxShadow(
                                  color: AppColors.line,
                                  blurRadius: 0,
                                  offset: Offset(0, -1)),
                            ],
                          ),
                          child: HighLightWell(
                            onTap: () {
                              // NavigatorUtils.push(
                              //     context, BillRouter.bookkeepPage,
                              //     transition:
                              //         TransitionType.cupertinoFullScreenDialog);
                            },
                            isForeground: true,
                            borderRadius: BorderRadius.circular(48 / 2),
                            child: const SizedBox(
                              width: 44,
                              height: 44,
                              child: CircleAvatar(
                                backgroundColor: AppColors.app_main,
                                child: Icon(Icons.add, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 17,
                        child: Text(
                          title,
                          style: textStyle,
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
