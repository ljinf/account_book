class BillRecordResponse extends Object {
  int? code;
  List<BillRecordModel>? data;

  String? msg;

  BillRecordResponse({
    this.code,
    this.data,
    this.msg,
  });

  factory BillRecordResponse.fromJson(Map<String, dynamic> srcJson) {
    var dataList = <BillRecordModel>[];

    if (srcJson['deta'] != null) {
      for (var item in srcJson['data']) {
        dataList.add(BillRecordModel.fromJson(item));
      }
    }

    return BillRecordResponse(
      code: srcJson['code'],
      msg: srcJson['msg'],
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() => {
        'code': code,
        'data': data,
        'msg': msg,
      };
}

class BillRecordModel extends Object {
  int? id;

  double? money;

  String? remark;

  String? categoryName;

  String? image;

  /// 类型 1支出 2收入
  int? type;

  /// 是否已同步
  int? isSync;

  /// 是否已删除
  int? isDelete;

  String? createTime;

  int? createTimestamp;

  String? updateTime;

  int? updateTimestamp;

  BillRecordModel(
      {this.id,
      this.money,
      this.remark,
      this.type,
      this.categoryName,
      this.image,
      this.createTime,
      this.createTimestamp,
      this.updateTime,
      this.updateTimestamp,
      this.isSync,
      this.isDelete});

  factory BillRecordModel.fromJson(Map<String, dynamic> json) =>
      BillRecordModel(
          id: json['id'] as int,
          money: (json['money'] as num).toDouble(),
          remark: json['remark'] as String,
          type: json['type'] as int,
          categoryName: json['categoryName'] as String,
          image: json['image'] as String,
          createTime: json['createTime'] as String,
          createTimestamp: json['createTimestamp'] as int,
          updateTime: json['updateTime'] as String,
          updateTimestamp: json['updateTimestamp'] as int,
          isSync: json['isSync'] as int,
          isDelete: json['isDelete'] as int);

  Map<String, dynamic> toJson() => {
        'id': id,
        'money': money,
        'remark': remark,
        'categoryName': categoryName,
        'image': image,
        'type': type,
        'isSync': isSync,
        'isDelete': isDelete,
        'createTime': createTime,
        'createTimestamp': createTimestamp,
        'updateTime': updateTime,
        'updateTimestamp': updateTimestamp,
      };
}
