import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/network/network_config.dart';
import 'package:community/network/network_request.dart';
import 'package:community/pages/home/models/orderfood_model.dart';
import 'package:community/utils/as_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class OrderFoodMenuPage extends StatefulWidget {
  static const routeName = "/orderfoodmenu";
  const OrderFoodMenuPage({Key? key}) : super(key: key);

  @override
  State<OrderFoodMenuPage> createState() => _OrderFoodMenuPageState();
}

class _OrderFoodMenuPageState extends State<OrderFoodMenuPage> {

  List<OrderFood> selectItems = [];
  double orderAmount = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration.zero,(){
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args != null && args is Map) {
        selectItems = args['data'];
        setState(() {

        });
      }
    });
  }



  _pushOrderSuccess() {
    Map<String, dynamic> params = {
      "modular": "APP",
      "userName": SpUtil.preferences?.getString("loginName"),
      "content": "You have successfully submitted a takeaway order, please wait for the staff to process",
      "userId": SpUtil.preferences?.getInt("userId").toString(),
    };
    HTTPRqeust.request("userPush/add",
        method: "post", isJson: true, params: params)
        .then((value) {
      if (value['code'] == 0) {
        print("发送外卖指定推送消息成功");
      }else{

      }
    });
  }

  submitOrders() {
    var params = {
      "userId":SpUtil.preferences?.getInt("userId"),
      "orderAmount":orderAmount,
      "itemList": selectItems.map((food) {
        final item = {
          "foodId":food.id,
          "foodName":food.foodName,
          "foodNumber":food.num
        };
        return item;
      }).toList()
    };

    EasyLoading.show(status: "Submitting...");
    HTTPRqeust.request("create/order", method: "post", isJson: true, params: params).then((response) {
      if (response['code'] == 0) {
        EasyLoading.showSuccess('Submit Success');
        _pushOrderSuccess();
        setState(() {
          selectItems.clear();
        });
        Future.delayed(Duration.zero,(){
          Navigator.pop(context);
        });
      }else {
        EasyLoading.showInfo(response['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Menu'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: selectItems.length,
                itemBuilder: (context,index) {
                  return _buildListTile(index);
                },
                separatorBuilder: (context,index){
                  return const Divider(height: 1,);
                },
              ),
            ),
            Container(
              height: 44,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(width: 0.5,color: Color(0xffdcdcdd))
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildTotalText(),
                  GestureDetector(
                    onTap: () {
                      if (selectItems.isNotEmpty) {
                        submitOrders();
                      }else {
                        EasyLoading.showToast("Please choose the dishes you want");
                      }
                    },
                    child: const Text('Submit')
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Text _buildTotalText() {
    double total = 0.0;
    for (var food in selectItems) {
      total += (food.price ?? 0.0) * food.num;
    }
    orderAmount = total;
    return Text('Total:\$$total');
  }

  ListTile _buildListTile(int index) {
    final food = selectItems[index];
    return ListTile(
      leading: Container(
          width: 70,
          height: 70,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: CachedNetworkImage(
            imageUrl: "${HTTPConfig.baseURL}${food.foodImage}",
            fit: BoxFit.cover,
          )
      ),
      title: Text('${food.foodName}', maxLines: 2, overflow: TextOverflow.ellipsis,),
      subtitle: Text('\$${food.price}'),
      trailing: SizedBox(
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: (){
                setState(() {
                  food.num += 1;
                });
              },
              child: const Icon(Icons.add_box_outlined)
            ),
            Text('${food.num}'),
            GestureDetector(
              onTap: (){
                setState(() {
                  if (food.num > 1) {
                    food.num -= 1;
                  }else {
                    selectItems.remove(food);
                  }
                });
              },
              child: const Icon(Icons.indeterminate_check_box_outlined)
            )
          ],
        ),
      ),
    );
  }
}
