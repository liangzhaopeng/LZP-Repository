import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/message/message_tips.dart';
import 'package:community/message/tips_data.dart';
import 'package:community/network/network_config.dart';
import 'package:community/network/network_request.dart';
import 'package:community/pages/home/goods_page.dart';
import 'package:community/pages/home/housekeeping_page.dart';
import 'package:community/pages/home/introduce_page.dart';
import 'package:community/pages/home/orderfood_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:jpush_flutter/jpush_flutter.dart';

import '../../map/gaodemap.dart';
import '../../utils/as_util.dart';
import 'models/banner_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  String? debugLable = 'Unknown';
  final JPush jpush = JPush();
  int messageTipCount = 0;
  List<TipData> tipData = [];

  @override
  bool get wantKeepAlive => true;

  List<HomeBanner> banners = [];

  @override
  void initState() {
    super.initState();
    _initPlatformState();
    _getBannerData();
    _getTipsList();
  }

  //获取轮播图数据
  _getBannerData() {
    HTTPRqeust.request("banner/list", method: "post").then((response) {
      if (response['code'] == 0) {
        final array = response['data'] as List;
        if (array.isNotEmpty) {
          for (var element in array) {
            banners.add(HomeBanner.fromJson(element));
          }
          setState(() {});
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          _buildBanner(),
          Expanded(
            child: _buildGridView(),
          )
        ],
      ),
    );
  }

  //构建顶部轮播图
  Container _buildBanner() {
    if (banners.isNotEmpty) {
      return Container(
        padding: const EdgeInsets.only(left: 15, top: 15, right: 15),
        height: 240,
        child: Swiper(
          itemCount: banners.length,
          scale: 0.9,
          autoplay: true,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: CachedNetworkImage(
                imageUrl:
                    "${HTTPConfig.baseURL}${banners[index].bannerImageUrl}",
                fit: BoxFit.cover,
              ),
            );
          },
          pagination: const SwiperPagination(),
        ),
      );
    } else {
      return Container();
    }
  }

  //构建四个功能按钮
  GridView _buildGridView() {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 15,
      crossAxisSpacing: 15,
      padding: const EdgeInsets.all(15),
      physics: const BouncingScrollPhysics(),
      children: [
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, HouseKeepingPage.routeName);
            },
            child: const Text(
              'Housekeeping services',
              style: TextStyle(fontSize: 17),
            )),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, OrderFoodPage.routeName);
            },
            child: const Text('Order service', style: TextStyle(fontSize: 17))),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, IntroducePage.routeName);
            },
            child: const Text('Community introduction',
                style: TextStyle(fontSize: 17))),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, GoodsPage.routeName);
            },
            child: const Text('Exchange of goods',
                style: TextStyle(fontSize: 17))),
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, GaodeMapPage.routeName);
            },
            child: const Text('Community Map', style: TextStyle(fontSize: 17))),
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return MessageTips();
              }));
            },
            child: Text('Message tips count: $messageTipCount',
                style: const TextStyle(fontSize: 17))),
      ],
    );
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> _initPlatformState() async {
    String? platformVersion;
    jpush.setAuth(enable: true);
    jpush.setup(
      appKey: "c108efaf9e6923690031cecf", //你自己应用的 AppKey
      channel: "developer-default",
      production: false,
      debug: true,
    );
    jpush.applyPushAuthority(
        NotificationSettingsIOS(sound: true, alert: true, badge: true));
    jpush.getRegistrationID().then((rid) {
      //上传registrationId;
      print("flutter get registration id : $rid");
      _registrationId(rid);
      // setState(() {
      //   debugLable = "flutter getRegistrationID: $rid";
      // });
    });
    try {
      jpush.addEventHandler(
          onReceiveNotification: (Map<String, dynamic> message) async {
        print("print jpush---flutter onReceiveNotification: $message");
        // setState(() {
        //   debugLable = "print jpush---flutter onReceiveNotification: $message";
        // });
      }, onOpenNotification: (Map<String, dynamic> message) async {
        print("print jpush---flutter onOpenNotification: $message");
        // setState(() {
        //   debugLable = "flutter onOpenNotification: $message";
        // });
      }, onReceiveMessage: (Map<String, dynamic> message) async {
        print("print jpush---flutter onReceiveMessage: $message");
        setState(() {
          messageTipCount++;
          debugLable = "flutter onReceiveMessage: ${message["message"]}";
          EasyLoading.showToast(
              "You have a new message tip : ${message["message"]}",
              duration: const Duration(milliseconds: 4000));
        });
      }, onReceiveNotificationAuthorization:
              (Map<String, dynamic> message) async {
        print(
            "print jpush---flutter onReceiveNotificationAuthorization: $message");
        // setState(() {
        //   debugLable = "flutter onReceiveNotificationAuthorization: $message";
        // });
      }, onNotifyMessageUnShow: (Map<String, dynamic> message) async {
        print("print jpush---flutter onNotifyMessageUnShow: $message");
        // setState(() {
        //   debugLable = "flutter onNotifyMessageUnShow: $message";
        // });
      });
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    // setState(() {
    //   debugLable = platformVersion;
    // });
    if (!mounted) return;
  }

  void _registrationId(String registrationId) {
    Map<String, dynamic> params = {
      "id": SpUtil.preferences?.getInt("userId").toString(),
      "registrationId": registrationId
    };
    HTTPRqeust.request("frontUser/update",
            method: "post", isJson: true, params: params)
        .then((value) {
      if (value['code'] == 0) {}
    });
  }

  void _getTipsList() {
    print("userid==${SpUtil.preferences?.getInt("userId").toString()}");
    Map<String, dynamic> params = {
      "userId": SpUtil.preferences?.getInt("userId").toString(),
    };
    HTTPRqeust.request("userPush/list",
            method: "post", isJson: true, params: params)
        .then((value) {
      TipsData tipsData = TipsData.fromJson(value);
      if (tipsData.code == 0) {
        tipData = tipsData.data!;
        setState(() {
          messageTipCount = tipData.length;
        });
        print("size===${tipData.length}");
      }
    });
  }
}
