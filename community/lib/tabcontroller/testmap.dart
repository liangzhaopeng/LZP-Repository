import 'package:flutter/material.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:amap_flutter_base/amap_flutter_base.dart';


class showMap extends StatefulWidget {

  String? title;
  String? subTitle;

  showMap({Key? key}) : super(key: key);

  @override
  State<showMap> createState() => _showMapState();
}

class _showMapState extends State<showMap> {
  ///是否支持缩放手势
  bool _zoomGesturesEnabled = true;

  ///是否支持滑动手势
  bool _scrollGesturesEnabled = true;




  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(39.909187, 116.397451),
    zoom: 10.0,
  );

  List<Widget> _approvalNumberWidget = <Widget>[];
  @override
  Widget build(BuildContext context) {

     const AMapPrivacyStatement amapPrivacyStatement =
    AMapPrivacyStatement(hasContains: true, hasShow: true, hasAgree: true);
    ///先将申请的Android端可以和iOS端key设置给AMapApiKey
     const AMapApiKey amapApiKeys = AMapApiKey(
        androidKey: 'c016786d8fafbac0616da040188968fb',
        iosKey: 'c016786d8fafbac0616da040188968fb');

    final AMapWidget map = AMapWidget(
      apiKey: amapApiKeys,
      privacyStatement: amapPrivacyStatement,
      // initialCameraPosition: _kInitialPosition,
      onMapCreated: onMapCreated,
      zoomGesturesEnabled: _zoomGesturesEnabled,
    );

    return ConstrainedBox(
      constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: map,
          ),
          Positioned(
              right: 10,
              bottom: 15,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: _approvalNumberWidget),
              ))
        ],
      ),
    );
  }

  AMapController? _mapController;
  void onMapCreated(AMapController controller) {
    setState(() {
      _mapController = controller;
      getApprovalNumber();
    });
  }

  /// 获取审图号
  void getApprovalNumber() async {
    //普通地图审图号
    String? mapContentApprovalNumber =
    await _mapController?.getMapContentApprovalNumber();
    //卫星地图审图号
    String? satelliteImageApprovalNumber =
    await _mapController?.getSatelliteImageApprovalNumber();
    setState(() {
      if (null != mapContentApprovalNumber) {
        _approvalNumberWidget.add(Text(mapContentApprovalNumber));
      }
      if (null != satelliteImageApprovalNumber) {
        _approvalNumberWidget.add(Text(satelliteImageApprovalNumber));
      }
    });
    print('地图审图号（普通地图）: $mapContentApprovalNumber');
    print('地图审图号（卫星地图): $satelliteImageApprovalNumber');
  }
}
