import 'package:community/network/network_request.dart';
import 'package:community/pages/profile/models/houserkeeping_model.dart';
import 'package:community/pages/profile/widgets/housekeeping_record_cell.dart';
import 'package:community/utils/as_util.dart';
import 'package:community/widgets/custom_cell_row.dart';
import 'package:flutter/material.dart';

class HousekeepingRecordPage extends StatefulWidget {
  static const routeName = "/housekeepingrecord";
  const HousekeepingRecordPage({Key? key}) : super(key: key);

  @override
  State<HousekeepingRecordPage> createState() => _HousekeepingRecordPageState();
}

class _HousekeepingRecordPageState extends State<HousekeepingRecordPage> {

  List<HousekeepingRecord> records = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHouseholdRecord();
  }
  
  //获取家政服务记录
  getHouseholdRecord() {
    Map<String,dynamic> params = {
      "userId":SpUtil.preferences?.getInt("userId")
    };

    HTTPRqeust.request('household/list',method: 'post', params: params).then((response) {
      if (response['code'] == 0) {
        final array = response['data'] as List;
        records = array.map((e) => HousekeepingRecord.fromJson(e)).toList();
        setState(() {

        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record'),
      ),
      body: ListView.builder(

        itemCount: records.length,
        itemBuilder: (context,index) {
          return HousekeepingRecordCell(record: records[index],);
        }
      ),
    );
  }
}
