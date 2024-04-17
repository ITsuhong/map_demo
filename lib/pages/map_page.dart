import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config/config.dart';


/*政府端
* 实时监控*/
class GovernmentMonitorPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>GovernmentMonitorState();
}

class GovernmentMonitorState extends State<GovernmentMonitorPage>{
  AMapController? _mapController;

  @override
  Widget build(BuildContext context) {
    ///使用默认属性创建一个地图
    final AMapWidget map = AMapWidget(
      privacyStatement:ConstConfig.amapPrivacyStatement,
      apiKey: ConstConfig.amapApiKeys,
      onMapCreated: onMapCreated,

    );

    return Scaffold(
      appBar: AppBar(title: Text('111'),),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // child: Text('11'),
        child: map,
      ),
    );
  }


  void onMapCreated(AMapController controller) {
    setState(() {
      _mapController = controller;
      getApprovalNumber();
    });
  }

  // 获取审图号
  void getApprovalNumber() async {
    //普通地图审图号
    String? mapContentApprovalNumber =
    await _mapController?.getMapContentApprovalNumber();
    //卫星地图审图号
    String? satelliteImageApprovalNumber =
    await _mapController?.getSatelliteImageApprovalNumber();
  }
}
