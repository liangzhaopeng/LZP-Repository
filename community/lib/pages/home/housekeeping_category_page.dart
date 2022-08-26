import 'package:community/network/network_request.dart';
import 'package:community/pages/home/models/category_model.dart';
import 'package:flutter/material.dart';

class HouseKeepingCagetoryPage extends StatefulWidget {
  static const routeName = "/housekeepingcategory";
  const HouseKeepingCagetoryPage({Key? key}) : super(key: key);

  @override
  State<HouseKeepingCagetoryPage> createState() => _HouseKeepingCagetoryPageState();
}

class _HouseKeepingCagetoryPageState extends State<HouseKeepingCagetoryPage> {

  List<HouseCategory> items = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestHosekeepingCategory();
  }

  requestHosekeepingCategory() {
    HTTPRqeust.request('household/category',method: 'post').then((response) {
      if (response['code'] == 0) {
        final array = response['data'] as List;
        if (array.isNotEmpty) {
          for (var element in array) {
            items.add(HouseCategory.fromJson(element));
          }
          setState(() {

          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: ListView.separated(
          itemBuilder: (context,index) {
            return ListTile(
              title: Text(items[index].dictLabel ?? ""),
              onTap: () {
                Navigator.pop(context,{"data":items[index]});
              },
            );
          },
          separatorBuilder: (context,index) {
            return const Divider(height: 1, color: Color(0xffc0c0c0),indent: 15,);
          },
          itemCount: items.length),
    );
  }
}
