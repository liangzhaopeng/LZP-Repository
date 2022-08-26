class OrderFood {
  String? createTime;
  int? id;
  String? foodName;
  String? foodIntroduce;
  double? price;
  String? foodImage;
  int num = 1;

  OrderFood(
      {this.createTime,
        this.id,
        this.foodName,
        this.foodIntroduce,
        this.price,
        this.foodImage,
        required this.num});

  OrderFood.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    foodName = json['foodName'];
    foodIntroduce = json['foodIntroduce'];
    price = json['price'];
    foodImage = json['foodImage'];
    num = json['num'] ?? 1;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createTime'] = createTime;
    data['id'] = id;
    data['foodName'] = foodName;
    data['foodIntroduce'] = foodIntroduce;
    data['price'] = price;
    data['foodImage'] = foodImage;
    data['num'] = num;
    return data;
  }
}