class Order {
  String? createTime;
  int? id;
  int? userId;
  String? userName;
  double? orderAmount;
  int? orderStatus;
  List<OrderItem>? itemList;

  Order(
      {this.createTime,
        this.id,
        this.userId,
        this.userName,
        this.orderAmount,
        this.orderStatus,
        this.itemList});

  Order.fromJson(Map<String, dynamic> json) {
    createTime = json['createTime'];
    id = json['id'];
    userId = json['userId'];
    userName = json['userName'];
    orderAmount = json['orderAmount'];
    orderStatus = json['orderStatus'];
    if (json['itemList'] != null) {
      itemList = <OrderItem>[];
      json['itemList'].forEach((v) {
        itemList!.add(OrderItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createTime'] = createTime;
    data['id'] = id;
    data['userId'] = userId;
    data['userName'] = userName;
    data['orderAmount'] = orderAmount;
    data['orderStatus'] = orderStatus;
    if (itemList != null) {
      data['itemList'] = itemList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItem {
  int? id;
  int? orderId;
  int? foodId;
  String? foodName;
  int? foodNumber;
  String? foodImage;

  OrderItem(
      {this.id,
        this.orderId,
        this.foodId,
        this.foodName,
        this.foodNumber,
        this.foodImage});

  OrderItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['orderId'];
    foodId = json['foodId'];
    foodName = json['foodName'];
    foodNumber = json['foodNumber'];
    foodImage = json['foodImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['orderId'] = orderId;
    data['foodId'] = foodId;
    data['foodName'] = foodName;
    data['foodNumber'] = foodNumber;
    data['foodImage'] = foodImage;
    return data;
  }
}