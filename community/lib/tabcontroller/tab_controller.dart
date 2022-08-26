import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:community/pages/home/home_page.dart';
import 'package:community/pages/profile/profile_page.dart';
import 'package:community/map/gaodemap.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';

final List<Permission> needPermissionList = [
  Permission.location,
  Permission.storage,
  Permission.phone,
];

void _checkPermissions() async {
  Map<Permission, PermissionStatus> statuses =
      await needPermissionList.request();
  statuses.forEach((key, value) {
    print('$key premissionStatus is $value');
  });
}

class MyTabbarController extends StatefulWidget {
  static const routeName = "/myTabbarVC";

  const MyTabbarController({Key? key}) : super(key: key);

  @override
  State<MyTabbarController> createState() => _MyTabbarControllerState();
}

class _MyTabbarControllerState extends State<MyTabbarController> {


  @override
  void initState() {
    super.initState();
    AMapFlutterLocation.setApiKey(
        "c016786d8fafbac0616da040188968fb", "c016786d8fafbac0616da040188968fb");
    // initPlatformState();
  }

  int _selectedIndex = 0;
  final PageController _pageController = PageController();
  final _pages = [const HomePage(), const ProfilePage()];

  @override
  dispose() {
    if (kDebugMode) {
      print("主页面销毁");
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _checkPermissions();
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("community"),
      //   leading: ElevatedButton(
      //     onPressed: () {
      //       Navigator.pushNamed(context, GaodeMapPage.routeName);
      //     },
      //     child: const Text("map"),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'sos',
        backgroundColor: Colors.red,
        child: const Icon(Icons.sos),
        onPressed: () {
          launchUrlString("tel:10086");
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // drawer: DrawLayout(),
      body: PageView.builder(
        itemBuilder: (ctx, index) {
          return _pages[index];
        },
        itemCount: _pages.length,
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: (_selectedIndex == 0 ? Colors.blue : Colors.black54),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 0;
                });
                _pageController.jumpToPage(_selectedIndex);
              },
            ),
            const SizedBox(), //中间位置空出
            IconButton(
              icon: Icon(
                Icons.person,
                color: (_selectedIndex == 1 ? Colors.blue : Colors.black54),
              ),
              onPressed: () {
                setState(() {
                  _selectedIndex = 1;
                });
                _pageController.jumpToPage(_selectedIndex);
              },
            ),
          ], //均分底部导航栏横向空间
        ),
      ),
    );
  }


  List<BottomNavigationBarItem> bottomItems() {
    return [
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            size: 24,
            color: Colors.black54,
          ),
          activeIcon: Icon(
            Icons.home,
            size: 24,
            color: Colors.blue,
          ),
          label: "Home"),
      const BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            size: 24,
            color: Colors.black54,
          ),
          activeIcon: Icon(
            Icons.person,
            size: 24,
            color: Colors.blue,
          ),
          label: "Proflile"),
    ];
  }
}

class DrawLayout extends StatelessWidget {
  static const routeName = "/DrawLayout";

  static const AMapPrivacyStatement amapPrivacyStatement =
      AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);

  ///先将申请的Android端可以和iOS端key设置给AMapApiKey
  static const AMapApiKey amapApiKeys = AMapApiKey(
      androidKey: 'c016786d8fafbac0616da040188968fb',
      iosKey: 'c016786d8fafbac0616da040188968fb');

  ///在创建地图时设置apiKey属性·
  AMapWidget map = const AMapWidget(
    ///配置apiKey,设置为null或者不设置则优先使用native端配置的key
    apiKey: amapApiKeys,
    privacyStatement: amapPrivacyStatement,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: map,
    );
  }
}