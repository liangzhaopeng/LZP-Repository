import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/network/network_config.dart';
import 'package:community/network/network_request.dart';
import 'package:community/pages/home/models/orderfood_model.dart';
import 'package:community/pages/home/orderfood_menu_page.dart';
import 'package:flutter/material.dart';

class OrderFoodPage extends StatefulWidget {
  static const routeName = "/orderfood";
  const OrderFoodPage({Key? key}) : super(key: key);

  @override
  State<OrderFoodPage> createState() => _OrderFoodPageState();
}

class _OrderFoodPageState extends State<OrderFoodPage> {

  List<OrderFood> items = [];
  List<OrderFood> selectItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    requestMenuList();
  }

  requestMenuList() {
    HTTPRqeust.request('menu/list',method: 'post').then((response) {
      if (response['code'] == 0) {
        final array = response['data'] as List;
        for (var ele in array) {
          final food  = OrderFood.fromJson(ele);
          items.add(food);
        }
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Food'),
      ),
      floatingActionButton: GestureDetector(
          onTap: () {
            if (selectItems.isNotEmpty) {
              Navigator.pushNamed(context, OrderFoodMenuPage.routeName, arguments: {"data":selectItems}).then((value) {
                setState(() {

                });
              });
            }
          },
          child: _buildFoodMenuButton()
      ),
      body: _buildGridView(),
    );
  }

  GridView _buildGridView() {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 15, top: 15, right: 15, bottom: 40),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: 0.85
        ),
        itemCount: items.length,
        itemBuilder: (context,index) {
          return _foodItemCell(index);
        },
    );
  }

  Column _foodItemCell(int index) {
    final food = items[index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: CachedNetworkImage(
                    imageUrl: "${HTTPConfig.baseURL}${food.foodImage}",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 10,
                  child: GestureDetector(
                    onTap: (){
                      final food = items[index].toJson();
                      var filterFood = selectItems.where((element) {
                        return element.id == food['id'];
                      });
                      if (filterFood.isNotEmpty) {
                        filterFood.first.num = filterFood.first.num + 1;
                      }else {
                        selectItems.add(OrderFood.fromJson(food));
                      }
                      setState(() {

                      });
                    },
                    child: Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                            color: Color(0x55000000),
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: const Icon(Icons.add,color: Colors.white,)
                    ),
                  ),
                )
              ]
          ),
        ),
        SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: Text('${food.foodName}',maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 15),)),
                Text('\$${food.price}'),
              ],
            )
        ),
      ],
    );
  }

  Stack _buildFoodMenuButton() {
    return Stack(
      children:  [
        Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(color: Colors.blue,borderRadius: BorderRadius.all(Radius.circular(25))),
            child: const Icon(Icons.shopping_cart,color: Colors.white,)
        ),
        _buildBadge()
      ],
    );
  }

  Widget _buildBadge() {
    if (selectItems.isNotEmpty) {
      return Positioned(
        right: 0,
        child: Container(
            width: 20,
            height: 20,
            decoration: const BoxDecoration(color: Colors.red,borderRadius: BorderRadius.all(Radius.circular(10))),
            alignment: Alignment.center,
            child: Text('${selectItems.length}',style: const TextStyle(fontSize: 11, color: Colors.white),)
        ),
      );
    }else {
      return const SizedBox(width: 0, height: 0,);
    }

  }
}
