class Goods {
  String? createTime;
  int? id = 0;
  String? goodsName;
  String? goodsDescribe;
  double? price;
  String? goodsImageOne;
  int? userId;
  String? userName;
  int? status;
  List<String>? imageList=[];

  Goods(
      {this.createTime,
        this.id,
        this.goodsName,
        this.goodsDescribe,
        this.price,
        this.goodsImageOne,
        this.userId,
        this.userName,
        this.status,
        this.imageList});

  Goods.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    goodsName = json['goodsName'];
    goodsDescribe = json['goodsDescribe'];
    price = json['price'];
    goodsImageOne = json['goodsImageOne'];
    userId = json['userId'];
    userName = json['userName'];
    status = json['status'];
    imageList = json['imageList'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createTime'] = createTime;
    data['id'] = id;
    data['goodsName'] = goodsName;
    data['goodsDescribe'] = goodsDescribe;
    data['price'] = price;
    data['goodsImageOne'] = goodsImageOne;
    data['userId'] = userId;
    data['userName'] = userName;
    data['status'] = status;
    data['imageList'] = imageList;
    return data;
  }
}