class HouseCategory {
  int? dictCode;
  int? dictSort;
  String? dictLabel;
  String? dictValue;
  String? dictType;
  String? cssClass;
  String? listClass;
  String? isDefault;
  String? status;

  HouseCategory({this.dictCode, this.dictSort, this.dictLabel, this.dictValue, this.dictType, this.cssClass, this.listClass, this.isDefault, this.status});

  HouseCategory.fromJson(Map<String, dynamic> json) {
    dictCode = json['dictCode'];
    dictSort = json['dictSort'];
    dictLabel = json['dictLabel'];
    dictValue = json['dictValue'];
    dictType = json['dictType'];
    cssClass = json['cssClass'];
    listClass = json['listClass'];
    isDefault = json['isDefault'];
    status = json['status'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dictCode'] = dictCode;
    data['dictSort'] = dictSort;
    data['dictLabel'] = dictLabel;
    data['dictValue'] = dictValue;
    data['dictType'] = dictType;
    data['cssClass'] = cssClass;
    data['listClass'] = listClass;
    data['isDefault'] = isDefault;
    data['status'] = status;

    return data;
  }
}