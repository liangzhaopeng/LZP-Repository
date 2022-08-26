class TipsData {
  String? msg;
  int? code;
  List<TipData>? data;

  TipsData({this.msg, this.code, this.data});

  TipsData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    code = json['code'];
    if (json['data'] != null) {
      data = <TipData>[];
      json['data'].forEach((v) { data!.add( TipData.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['msg'] = msg;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TipData {
  String? searchValue;
  String? createBy;
  String? createTime = "";
  String? updateBy;
  String? updateTime;
  String? remark;
  int? id;
  String? modular;
  int? userId;
  String? userName;
  String? content= "";

  TipData({this.searchValue, this.createBy, this.createTime, this.updateBy, this.updateTime, this.remark,  this.id, this.modular, this.userId, this.userName, this.content});

  TipData.fromJson(Map<String, dynamic> json) {
    searchValue = json['searchValue'];
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    remark = json['remark'];
    id = json['id'];
    modular = json['modular'];
    userId = json['userId'];
    userName = json['userName'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['searchValue'] = searchValue;
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['remark'] = remark;
    data['id'] = id;
    data['modular'] = modular;
    data['userId'] = userId;
    data['userName'] = userName;
    data['content'] = content;
    return data;
  }
}