// ignore_for_file: unrelated_type_equality_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/network/network_config.dart';
import 'package:community/pages/profile/models/houserkeeping_model.dart';
import 'package:community/widgets/custom_cell_row.dart';
import 'package:flutter/material.dart';

class HousekeepingRecordCell extends StatelessWidget {
  HousekeepingRecordCell({Key? key, required this.record}) : super(key: key);

  HousekeepingRecord record;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15,top: 8,right: 15,bottom: 8),
      margin: const EdgeInsets.only(left: 15,top: 8,right: 15,bottom: 8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow:const [
            BoxShadow(
                color: Colors.black12,
                offset: Offset(0,1),
                blurRadius: 2,
                spreadRadius: 1
            )
          ]
      ),
      child: Column(
        children: [
          CustomCellRow(title: "Category", content: record.categoryName ?? ""),
          CustomCellRow(title: "Name", content: record.userName ?? ""),
          CustomCellRow(title: "Room Number", content: record.houseNumber ?? ""),
          CustomCellRow(title: "Price", content: "\$${record.householdPrice}"),
          CustomCellRow(title: "Status", content: record.householdStatus == "1" ? 'waiting' : 'delivered'),
          CustomCellRow(title: "Remark", content: record.remark ?? ""),
          _buildPhotos()
        ],
      ),
    );
  }

  Widget _buildPhotos() {
    if (record.imageList != null && record.imageList!.isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Photos:', style: TextStyle(letterSpacing: 1, fontSize: 16, color: Color(0xff333333)),),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: record.imageList?.length,
              itemBuilder: (context,index){
                return Container(
                  padding: const EdgeInsets.all(5),
                  width: 100,
                  height: 100,
                  child: CachedNetworkImage(
                    imageUrl: "${HTTPConfig.baseURL}${record.imageList?[index]}",
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
        ],
      );
    }else {
      return Padding(padding: EdgeInsets.zero);
    }
  }
}

