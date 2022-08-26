class HousekeepingRecord {
  String? createTime;
  int? id;
  String? householdCategory;
  String? categoryName;
  int? userId;
  String? userName;
  String? houseNumber;
  double? householdPrice;
  String? remark;
  int? householdStatus;
  List<String>? imageList;

  HousekeepingRecord(
      {this.createTime,
        this.id,
        this.householdCategory,
        this.categoryName,
        this.userId,
        this.userName,
        this.houseNumber,
        this.householdPrice,
        this.remark,
        this.householdStatus,
        this.imageList});

  HousekeepingRecord.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    householdCategory = json['householdCategory'];
    categoryName = json['categoryName'];
    userId = json['userId'];
    userName = json['userName'];
    houseNumber = json['houseNumber'];
    householdPrice = json['householdPrice'];
    remark = json['remark'];
    householdStatus = json['householdStatus'];
    imageList = json['imageList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createTime'] = createTime;
    data['id'] = id;
    data['householdCategory'] = householdCategory;
    data['categoryName'] = categoryName;
    data['userId'] = userId;
    data['userName'] = userName;
    data['houseNumber'] = houseNumber;
    data['householdPrice'] = householdPrice;
    data['remark'] = remark;
    data['householdStatus'] = householdStatus;
    data['imageList'] = imageList;
    return data;
  }
}