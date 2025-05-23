import 'package:flutter/material.dart';

import '../common/colors/colors.dart';

class HighLightWell extends StatefulWidget {
  const HighLightWell(
      {super.key,
      required this.child,
      required this.onTap,
      this.borderRadius,
      this.isForeground = false,
      this.hightColor = AppColors.gray_c,
      this.alignment = Alignment.center,
      this.isPressingEffect = true});

  final Widget child;
  final GestureTapCallback onTap;
  final BorderRadius? borderRadius;
  final bool isForeground;
  final Color hightColor;
  final AlignmentGeometry alignment;

  /// 是否有按压效果 默认true
  final isPressingEffect;

  @override
  _HighLightWellState createState() => _HighLightWellState();
}

class _HighLightWellState extends State<HighLightWell>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isDown = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: widget.onTap,
        onTapDown: (d) {
          // 手指按下
          isDown = true;
          _controller.forward();
        },
        onTapUp: (d) {
          // 手势抬起
          isDown = false;
          _prepareToIdle();
          // Future.delayed(Duration(milliseconds: 10), () {
          //   _prepareToIdle();
          // });
        },
        onTapCancel: () {
          // 取消
          isDown = false;
          _prepareToIdle();
        },
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            return Container(
              foregroundDecoration: BoxDecoration(
                  color: widget.isForeground
                      ? isDown
                          ? widget.hightColor.withOpacity(0.5)
                          : Colors.transparent
                      : null,
                  shape: BoxShape.rectangle,
                  borderRadius: widget.borderRadius),
              decoration: BoxDecoration(
                  color: widget.isPressingEffect
                      ? widget.hightColor.withOpacity(0.5 * _controller.value)
                      : null,
                  shape: BoxShape.rectangle,
                  borderRadius: widget.borderRadius),
              child: widget.child,
            );
          },
        ));
  }

  void _prepareToIdle() {
    if (widget.isPressingEffect == false) return;
    late AnimationStatusListener listener;
    listener = (AnimationStatus statue) {
      if (statue == AnimationStatus.completed) {
        _controller.removeStatusListener(listener);
        toStart();
      }
    };
    _controller.addStatusListener(listener);
    if (!_controller.isAnimating) {
      _controller.removeStatusListener(listener);
      toStart();
    }
  }

  void toStart() {
    if (widget.isPressingEffect == false) return;
    _controller.stop();
    _controller.reverse();
  }
}
