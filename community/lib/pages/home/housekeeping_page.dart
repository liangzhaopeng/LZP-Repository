import 'dart:io';
import 'dart:ui';

import 'package:community/network/network_request.dart';
import 'package:community/pages/home/housekeeping_category_page.dart';
import 'package:community/utils/as_util.dart';
import 'package:community/widgets/click_item.dart';
import 'package:community/widgets/text_filed_item.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
import 'package:community/pages/home/models/category_model.dart';

class HouseKeepingPage extends StatefulWidget {
  static const routeName = "/housekeeping";

  const HouseKeepingPage({Key? key}) : super(key: key);

  @override
  State<HouseKeepingPage> createState() => _HouseKeepingPageState();
}

class _HouseKeepingPageState extends State<HouseKeepingPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _remarkController = TextEditingController();
  List<AssetEntity> _selectAssets = [];
  final itemWidth =
      (window.physicalSize.width / window.devicePixelRatio - 60) / 3;

  HouseCategory? selectCategory;

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _numberController.dispose();
    _priceController.dispose();
    _remarkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HouseKeeping'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children: [
                  ClickItem(
                    title: "Category",
                    content:
                        selectCategory?.dictLabel ?? "Select service category",
                    onTap: () {
                      Navigator.pushNamed(
                              context, HouseKeepingCagetoryPage.routeName)
                          .then((res) {
                        if (res != null && res is Map) {
                          setState(() {
                            selectCategory = res['data'];
                          });
                        }
                      });
                    },
                  ),
                  TextFieldItem(
                    title: "Name",
                    hintText: "Enter your name",
                    controller: _nameController,
                  ),
                  TextFieldItem(
                    title: "Room number",
                    hintText: "Enter room number",
                    controller: _numberController,
                  ),
                  TextFieldItem(
                    title: "Price",
                    hintText: "Enter the price",
                    controller: _priceController,
                  ),
                  TextFieldItem(
                    title: "Remarks",
                    hintText: "Enter remarks",
                    controller: _remarkController,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Upload pictures",
                          style: TextStyle(fontSize: 15, color: Colors.black87),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Wrap(
                          spacing: 15,
                          runSpacing: 15,
                          children: _wrapItems(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(
                        const Size(double.infinity, 44)),
                    overlayColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.transparent)),
                onPressed: checkParams,
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }

  checkParams() {
    if (selectCategory == null) {
      EasyLoading.showToast("Select service category");
      return;
    }
    if (_nameController.text.isEmpty) {
      EasyLoading.showToast("Enter your name");
      return;
    }
    if (_numberController.text.isEmpty) {
      EasyLoading.showToast("Enter room number");
      return;
    }
    if (_priceController.text.isEmpty) {
      EasyLoading.showToast("Enter the price");
      return;
    }

    //如果有图片则先上传图片
    if (_selectAssets.isNotEmpty) {
      uploadImages();
    } else {
      submitForm();
    }
  }

  _pushSuccess() {
    Map<String, dynamic> params = {
      "modular": "APP",
      "userName": SpUtil.preferences?.getString("loginName"),
      "content": "You have successfully submitted an order for housekeeping services, please wait for the staff to process",
      "userId": SpUtil.preferences?.getInt("userId").toString(),
    };
    HTTPRqeust.request("userPush/add",
            method: "post", isJson: true, params: params)
        .then((value) {
      if (value['code'] == 0) {
        print("发送指定推送消息成功");
      }else{

      }
    });
  }

  submitForm({String? imageNames}) {
    var params = {
      "householdCategory": selectCategory?.dictValue,
      "userId": SpUtil.preferences?.getInt("userId"),
      "userName": _nameController.text,
      "houseNumber": _numberController.text,
      "householdPrice": _priceController.text,
      "remark": _remarkController.text
    };
    if (imageNames != null) {
      params["imageList"] = imageNames.split(",");
    }

    EasyLoading.show(status: 'Submitting...');
    HTTPRqeust.request("household/service",
            method: "post", params: params, isJson: true)
        .then((response) {
      if (response['code'] == 0) {
        EasyLoading.showSuccess("Submit Success");
        //成功后发送一条请求告知发送推送;
        _pushSuccess();
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pop(context);
        });
      } else {
        EasyLoading.showInfo(response['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  uploadImages() async {
    List<File> files = [];
    for (var asset in _selectAssets) {
      var file = await asset.file;
      files.add(file!);
    }

    HTTPRqeust.uploadFiles("common/uploads", files,
        onSendProgress: (count, total) {
      EasyLoading.showProgress(count / total, status: 'Uploading...');
    }).then((response) {
      if (response['code'] == 0) {
        EasyLoading.dismiss();
        final fileNames = response['fileNames'] as String;
        submitForm(imageNames: fileNames);
      } else {
        EasyLoading.showInfo(response['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  List<Widget> _wrapItems() {
    if (_selectAssets.isEmpty) {
      return [_buildAddButton()];
    } else {
      if (_selectAssets.length < 6) {
        List<Widget> array = <Widget>[];
        var list = _selectAssets.map((e) => _buildImageItem(e)).toList();
        array.addAll(list);
        array.add(_buildAddButton());
        return array;
      } else {
        return _selectAssets.map((e) => _buildImageItem(e)).toList();
      }
    }
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: () async {
        final List<AssetEntity>? result = await AssetPicker.pickAssets(context,
            pickerConfig:
                AssetPickerConfig(selectedAssets: _selectAssets, maxAssets: 6));
        if (result != null && result.isNotEmpty) {
          _selectAssets = result;
          if (mounted) {
            setState(() {});
          }
        }
      },
      child: Container(
          width: itemWidth,
          height: itemWidth,
          color: Colors.grey,
          child: const Icon(Icons.add)),
    );
  }

  Stack _buildImageItem(AssetEntity entity) {
    return Stack(
      children: [
        AssetEntityImage(
          entity,
          isOriginal: false,
          width: itemWidth,
          height: itemWidth,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 5,
          right: 5,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectAssets.remove(entity);
                });
              },
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: Theme.of(context).canvasColor.withOpacity(0.5),
                ),
                child: const Icon(Icons.close, size: 18.0),
              )),
        )
      ],
    );
  }
}
