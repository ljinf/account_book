import 'package:flutter/material.dart';

/// 组头
class BillRecordGroup {
  BillRecordGroup(this.date, this.expenMoney, this.incomeMoney) : super();

  /// 日期
  String? date;

  /// 当天总支出金额
  double expenMoney = 0;

  /// 当日总收入
  double incomeMoney = 0;
}

/// 月份记录
class BillRecordMonth {
  BillRecordMonth(this.expenMoney, this.incomeMoney, this.recordList,
      {this.isBudget = 0, this.budget = 0.0})
      : super();

  /// 当月总支出金额
  double expenMoney = 0;

  /// 当月总收入
  double incomeMoney = 0;

  /// 是否有预算
  int isBudget = 0;

  /// 预算金额
  double budget = 0;

  /// 账单记录
  List recordList=[];
}
