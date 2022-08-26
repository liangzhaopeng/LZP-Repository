import 'dart:async';

import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_location/amap_flutter_location.dart';
import 'package:amap_flutter_location/amap_location_option.dart';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:permission_handler/permission_handler.dart';

import 'dart:async';
import 'dart:io' if (dart.library.html) 'dart:html' show Platform;


class GaodeMapPage extends StatefulWidget {
  static const routeName = "/GaodeMapPage";
  const GaodeMapPage({Key? key}) : super(key: key);

  @override
  _GaodeMapPageState createState() => _GaodeMapPageState();
}

class _GaodeMapPageState extends State<GaodeMapPage> {

   Map<String, Object>? _locationResult;

  late StreamSubscription<Map<String, Object>> _locationListener;

  final AMapFlutterLocation _locationPlugin = AMapFlutterLocation();
  PermissionStatus? permissionStatus;

  static const AMapApiKey amapApiKeys = AMapApiKey(
      iosKey: 'c016786d8fafbac0616da040188968fb',
      androidKey: 'c016786d8fafbac0616da040188968fb');

  @override
  void initState() {
    super.initState();
    AMapFlutterLocation.updatePrivacyShow(true, true);
    AMapFlutterLocation.updatePrivacyAgree(true);
    AMapFlutterLocation.setApiKey("c016786d8fafbac0616da040188968fb", "c016786d8fafbac0616da040188968fb");
    ///注册定位结果监听
    _locationListener = _locationPlugin
        .onLocationChanged()
        .listen((Map<String, Object> result) {
      setState(() {
        print("print --- $_locationResult");
        print("print --- $_locationResult");
        _locationResult = result;
        if(_locationResult!=null){
          double? latitude = _locationResult!['latitude'] as double;
          double? longitude = _locationResult!['longitude'] as double;
          currentLocation = CameraPosition(
            target: LatLng(latitude, longitude),
            zoom: 15,
          );
          _stopLocation();
          print("print --- latitude===$latitude---longitude===$longitude");
        }
      });
    });

    _requestPermission();
  }

  Future<void> _requestPermission() async {
    final status = await Permission.location.request();
    permissionStatus = status;
    switch (status) {
      case PermissionStatus.denied:
        print("print=--- 拒绝");
        break;
      case PermissionStatus.granted:
        print("print=---  开始定位");
        _startLocation();
        break;
      case PermissionStatus.limited:
        print("print=---  限制");
        break;
      default:
        print("print=---  其他状态");
        _startLocation();
        break;
    }
  }


  ///开始定位
  void _startLocation() {
    if (null != _locationPlugin) {
      ///开始定位之前设置定位参数
      _setLocationOption();
      _locationPlugin.startLocation();
      print("print=---  开始定位");
    }
  }
   ///停止定位
   void _stopLocation() {
     if (null != _locationPlugin) {
       _locationPlugin.stopLocation();
     }
   }

  ///设置定位参数
  void _setLocationOption() {
    if (null != _locationPlugin) {
      print("print=---  设置定位参数");
      AMapLocationOption locationOption = AMapLocationOption();
      ///是否单次定位
      locationOption.onceLocation = false;
      ///是否需要返回逆地理信息
      locationOption.needAddress = true;
      ///逆地理信息的语言类型
      locationOption.geoLanguage = GeoLanguage.DEFAULT;
      locationOption.desiredLocationAccuracyAuthorizationMode =
          AMapLocationAccuracyAuthorizationMode.ReduceAccuracy;
      locationOption.fullAccuracyPurposeKey = "AMapLocationScene";
      ///设置Android端连续定位的定位间隔
      locationOption.locationInterval = 3000;
      ///设置Android端的定位模式<br>
      ///可选值：<br>
      ///<li>[AMapLocationMode.Battery_Saving]</li>
      ///<li>[AMapLocationMode.Device_Sensors]</li>
      ///<li>[AMapLocationMode.Hight_Accuracy]</li>
      locationOption.locationMode = AMapLocationMode.Hight_Accuracy;
      ///设置iOS端的定位最小更新距离<br>
      locationOption.distanceFilter = -1;
      ///设置iOS端期望的定位精度
      /// 可选值：<br>
      /// <li>[DesiredAccuracy.Best] 最高精度</li>
      /// <li>[DesiredAccuracy.BestForNavigation] 适用于导航场景的高精度 </li>
      /// <li>[DesiredAccuracy.NearestTenMeters] 10米 </li>
      /// <li>[DesiredAccuracy.Kilometer] 1000米</li>
      /// <li>[DesiredAccuracy.ThreeKilometers] 3000米</li>
      locationOption.desiredAccuracy = DesiredAccuracy.Best;
      ///设置iOS端是否允许系统暂停定位
      locationOption.pausesLocationUpdatesAutomatically = false;
      ///将定位参数设置给定位插件
      _locationPlugin.setLocationOption(locationOption);
    }
  }

  @override
  void dispose() {
    ///移除定位监听
    if (null != _locationListener) {
      _locationListener.cancel();
    }
    ///销毁定位
    if (null != _locationPlugin) {
      _locationPlugin.destroy();
    }
    super.dispose();
  }

  //当前位置;
  CameraPosition? currentLocation;
  // LatLng mapCenter = const LatLng(39.909187, 116.397451);
  AMapController? mapController;
  Map<String, Marker> _markers = <String, Marker>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "MAP",
          style: TextStyle(),
        ),
      ),
      body: currentLocation == null
          ? const Text("定位失败")
          : Center(
          child: SizedBox(
            child: AMapWidget(
              //比例尺是否显示
              scaleEnabled:true,
              apiKey: amapApiKeys,
              // 初始化地图中心店
              initialCameraPosition: currentLocation!,
              //定位小蓝点
              myLocationStyleOptions: MyLocationStyleOptions(
                true,
              ),
              // 普通地图normal,卫星地图satellite,夜间视图night,导航视图 navi,公交视图bus,
              mapType: MapType.normal,
              // 缩放级别范围
              minMaxZoomPreference: const MinMaxZoomPreference(3, 25),
              // 隐私政策包含高德 必须填写
              privacyStatement: const AMapPrivacyStatement(
                  hasAgree: true, hasContains: true, hasShow: true),
              // 地图创建成功时返回AMapController
              onMapCreated: (AMapController controller) {
                mapController = controller;
              },
              onPoiTouched: _onPoiTouched,
              //创建地图时，给marker属性赋值一个空的set，否则后续无法添加marker
              markers: Set<Marker>.of(_markers.values),
            ),
          )),
    );
  }

  //点击地图后显示地理位置;
   void _onPoiTouched(AMapPoi poi) {
     print("print --- ${poi.name}");
     print("print --- ${poi.latLng?.latitude}");
     print("print --- ${poi.latLng?.longitude}");
     print("print --- ${_calcDistance(currentLocation!.target.latitude, currentLocation!.target.longitude, poi.latLng!.latitude, poi.latLng!.longitude)}");
     EasyLoading.showToast("您的位置距离此处距离为${_calcDistance(currentLocation!.target.latitude, currentLocation!.target.longitude, poi.latLng!.latitude, poi.latLng!.longitude)} 米");
     //add maker;
     _add(poi.latLng!.latitude,poi.latLng!.longitude,poi.name!);
   }

   void _add(double latitude, double longitude,String localName) {
     final int markerCount = _markers.length;
     LatLng markPostion = LatLng(latitude,longitude);
     final Marker marker = Marker(
       position: markPostion,
       icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
       infoWindow: InfoWindow(title: '您点击的地理位置为$localName'),
       onTap: (markerId) => _onMarkerTapped(markerId),
       onDragEnd: (markerId, endPosition) =>
           _onMarkerDragEnd(markerId, endPosition),
     );
     setState(() {
       _markers[marker.id] = marker;
     });
   }

   void _onMarkerTapped(String markerId) {
     final Marker? tappedMarker = _markers[markerId];
     final String? title = tappedMarker!.infoWindow.title;
     print('$title 被点击了,markerId: $markerId');
     // setState(() {
     //   selectedMarkerId = markerId;
     // });
   }
   void _onMarkerDragEnd(String markerId, LatLng position) {
     final Marker? tappedMarker = _markers[markerId];
     final String? title = tappedMarker!.infoWindow.title;
     print('$title markerId: $markerId 被拖拽到了: $position');
   }
   double _calcDistance(double latitudeA,double longitudeA,double latitudeB,double longitudeB){
     double earthR = 6371000;
     double x = cos(latitudeA * pi/180 )* cos(latitudeB * pi /180)*cos((latitudeA - latitudeB)* pi/180);
     double y = sin(latitudeA * pi/180) * sin(latitudeB * pi/180);
     double s = x+y;
     if(s>1){
       s=1;
     }else if(s < -1){
       s = -1;
     }
     double alpha = acos(s);
     double distance = alpha*earthR;
     return distance;
   }

   // Widget showPoiInfo(AMapPoi poi) {
   //   return Container(
   //     alignment: Alignment.center,
   //     color: const Color(0x8200CCFF),
   //     child: Text(
   //       '您点击了 ${poi.name}',
   //       style: const TextStyle(fontWeight: FontWeight.w600),
   //     ),
   //   );
   // }
}
