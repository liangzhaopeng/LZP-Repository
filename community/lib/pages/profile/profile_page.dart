import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/login/login_page.dart';
import 'package:community/pages/profile/changepassword_page.dart';
import 'package:community/pages/profile/goods_collection_page.dart';
import 'package:community/pages/profile/goods_record_page.dart';
import 'package:community/pages/profile/housekeeping_record_page.dart';
import 'package:community/pages/profile/order_record_page.dart';
import 'package:community/utils/as_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> with AutomaticKeepAliveClientMixin{
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Column(
        children: [
          Expanded(child: _buildListView()),
          Padding(
            padding: const EdgeInsets.only(left: 15,bottom: 40,right: 15),
            child: ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 50)),
                  overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent)
              ),
              onPressed: loginoutAction,
              child: const Text('Logout'),
            ),
          )
        ],
      ),
    );
  }

  ListView _buildListView() {
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        // _buildPersonHeader(),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration:  _buildBoxDecoration(),
          child: ListTile(
            title: const Text('Change password'),
            trailing: const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
            onTap: (){
              Navigator.pushNamed(context, ChangePasswordPage.routeName);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration:  _buildBoxDecoration(),
          child: ListTile(
            title: const Text('Housekeeping records'),
            trailing: const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
            onTap: (){
              Navigator.pushNamed(context, HousekeepingRecordPage.routeName);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration:  _buildBoxDecoration(),
          child: ListTile(
            title: const Text('Order record'),
            trailing: const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
            onTap: (){
              Navigator.pushNamed(context, OrderRecordPage.routeName);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration:  _buildBoxDecoration(),
          child: ListTile(
            title: const Text('My items'),
            trailing: const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, GoodsRecordPage.routeName);
            },
          ),
        ),Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration:  _buildBoxDecoration(),
          child: ListTile(
            title: const Text('Collection items'),
            trailing: const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,),
            onTap: () {
              Navigator.pushNamed(context, GoodsCollectionPage.routeName);
            },
          ),
        ),


      ],
    );
  }

  BoxDecoration _buildBoxDecoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            // 注意点 设置的阴影样式
            blurStyle: BlurStyle.outer,
            blurRadius: 2,
            spreadRadius: 2,
          ),
        ]
    );
  }

  Future<dynamic> loginoutAction() {
    return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Confirm to log out'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () {

                  SpUtil.preferences?.setBool("isLogin", false);
                  SpUtil.preferences?.remove("userId");
                  Navigator.of(context).pushAndRemoveUntil(
                      PageRouteBuilder(
                          pageBuilder: (context, animation, secondAnimation) =>
                          const LoginPage(),
                          transitionsBuilder:
                              (context, animation, sencodAnimation, child) =>
                              FadeTransition(
                                opacity: animation,
                                child: child,
                              )),
                          (route) => false);
                },
                child: const Text('Logout'),
              ),
            ],
          );
        }
    );
  }

  Container _buildPersonHeader() {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration:  _buildBoxDecoration(),
      child: Row(
        children: [
          ClipOval(
            child: CachedNetworkImage(
              imageUrl: "https://img2.baidu.com/it/u=4290982249,3925173898&fm=253&fmt=auto&app=138&f=PNG?w=200&h=200",
              width: 50,
              height: 50,
            ),
          ),
          const SizedBox(width: 16,),
          const Expanded(child: Text('janshky',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)),
          const Icon(Icons.arrow_forward_ios,size: 18,color: Colors.grey,)
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
