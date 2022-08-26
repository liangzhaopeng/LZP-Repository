import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/network/network_config.dart';
import 'package:community/network/network_request.dart';
import 'package:community/pages/home/models/order_model.dart';
import 'package:community/utils/as_util.dart';
import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

class OrderRecordPage extends StatefulWidget {
  static const routeName = "/orderrecord";
  const OrderRecordPage({Key? key}) : super(key: key);

  @override
  State<OrderRecordPage> createState() => _OrderRecordPageState();
}

class _OrderRecordPageState extends State<OrderRecordPage> {

  List<Order> orders = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestOrderRecords();
  }
  
  requestOrderRecords() {
    Map<String,dynamic> params = {
      "userId":SpUtil.preferences?.getInt("userId")
    };
    
    HTTPRqeust.request("order/list", method: "post", params: params).then((response) {
      if (response['code'] == 0) {
        final array = response['data'] as List;
        orders = array.map((e) => Order.fromJson(e)).toList();
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Record'),
      ),
      body: GroupListView(
        sectionsCount: orders.length,
        countOfItemInSection: (section) => orders[section].itemList?.length ?? 0,
        groupHeaderBuilder: (context, section) {
          return Container(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${orders[section].createTime}',style: const TextStyle(fontSize: 16, color: Colors.black87),),
                Text('${orders[section].orderAmount}'),
              ],
            ),
          );
        },
        sectionSeparatorBuilder: (context,section) {
          return const Divider(height: 15, indent: 15, color: Color(0xffc0c0c0),);
        },
        itemBuilder: (context,indexPath) {
          return _buildListTile(orders[indexPath.section].itemList?[indexPath.index]);
        },
      ),
    );
  }

  ListTile _buildListTile(OrderItem? food) {

    return ListTile(
      leading: Container(
          width: 44,
          height: 44,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: CachedNetworkImage(
            imageUrl: "${HTTPConfig.baseURL}${food?.foodImage}",
            fit: BoxFit.cover,
          )
      ),
      title: Text('${food?.foodName}', maxLines: 2, overflow: TextOverflow.ellipsis,),
      trailing: Text('x${food?.foodNumber}'),
    );
  }
}
