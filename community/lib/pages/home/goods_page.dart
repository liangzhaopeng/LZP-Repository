import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/network/network_config.dart';
import 'package:community/network/network_request.dart';
import 'package:community/pages/home/goods_info_page.dart';
import 'package:community/pages/home/goods_release_page.dart';
import 'package:community/pages/home/models/goods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class GoodsPage extends StatefulWidget {

  static const routeName = "/goodspage";

  const GoodsPage({Key? key}) : super(key: key);

  @override
  State<GoodsPage> createState() => _GoodsPageState();
}

class _GoodsPageState extends State<GoodsPage> {

  List<Goods> items = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSecondGoods();
    
  }
  
  getSecondGoods() {
    HTTPRqeust.request("second/list",method: "post").then((value) {
      if (value['code'] == 0) {
        final array  = value['data'] as List;
        items = array.map((e) => Goods.fromJson(e)).toList();
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goods'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, GoodsReleasePage.routeName).then((value) {
            if (value != null && value is Map) {
              final hasRelease = value['hasRelease'] as bool;
              if (hasRelease) {
                getSecondGoods();
              }
            }
          });
        },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:  const EdgeInsets.all(15),
          child: MasonryGridView.count(
              crossAxisCount: 2,
              itemCount: items.length,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, GoodsInfoPage.routeName,arguments: items[index]);
                  },
                  child: waterCard(items[index])
                );
              }
          ),
        ),
      ),
    );
  }

  Widget? waterCard(Goods? goods){
    print("goods--${goods?.goodsName}");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Container(
            constraints: const BoxConstraints(maxHeight: 240),
            child: CachedNetworkImage(
              imageUrl: "${HTTPConfig.baseURL}${goods?.imageList?.first}",
              fit: BoxFit.fitWidth,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${goods?.goodsName} ${goods?.goodsDescribe}", maxLines: 2,overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                Text('\$${goods?.price}',overflow: TextOverflow.ellipsis,),
              ],
            )
        ),
      ],
    );
  }
}
