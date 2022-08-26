import 'dart:io';
import 'dart:ui';

import 'package:community/network/network_request.dart';
import 'package:community/utils/as_util.dart';
import 'package:community/widgets/text_filed_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';
class GoodsReleasePage extends StatefulWidget {
  static const routeName = "/goodsrelease";
  const GoodsReleasePage({Key? key}) : super(key: key);

  @override
  State<GoodsReleasePage> createState() => _GoodsReleasePageState();
}

class _GoodsReleasePageState extends State<GoodsReleasePage> {

  List<AssetEntity> _selectAssets = [];
  final itemWidth = (window.physicalSize.width/window.devicePixelRatio - 60)/3;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _priceController.dispose();
    _descController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  checkParams() {

    if (_nameController.text.isEmpty) {
      EasyLoading.showToast("Enter commodity name");
      return;
    }

    if (_priceController.text.isEmpty) {
      EasyLoading.showToast("Enter the price");
      return;
    }

    if (_descController.text.isEmpty) {
      EasyLoading.showToast("Enter describe");
      return;
    }

    //如果有图片则先上传图片
    if (_selectAssets.isNotEmpty) {
      uploadImages();
    }else {
      EasyLoading.showToast("Upload commodity photos");
      return;
    }

  }

  submitForm(String imageNames) {
    var params = {
      "userId":SpUtil.preferences?.getInt("userId"),
      "goodsName":_nameController.text,
      "goodsDescribe":_descController.text,
      "price":_priceController.text,
      "imageList":imageNames.split(",")
    };


    EasyLoading.show(status: 'Submitting...');
    HTTPRqeust.request("second/hand",method: "post", params: params, isJson: true).then((response) {
      if (response['code'] == 0) {
        EasyLoading.showSuccess("Submit Success");
        Future.delayed(const Duration(seconds: 1),(){
          Navigator.pop(context,{"hasRelease":true});
        });
      }else {
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


    HTTPRqeust.uploadFiles("common/uploads", files, onSendProgress: (count,total){
      EasyLoading.showProgress(count/total,status: 'Uploading...');
    }).then((response) {
      if (response['code'] == 0) {
        EasyLoading.dismiss();
        final fileNames = response['fileNames'] as String;
        submitForm(fileNames);
      }else {
        EasyLoading.showInfo(response['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Goods Release'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(15),
                children:  [
                  TextFieldItem(
                    title: "Name",
                    hintText: "Enter commodity name",
                    controller: _nameController,
                    align: TextAlign.left,
                  ),
                  TextFieldItem(
                    title: "Price",
                    hintText: "Enter commodity price",
                    controller: _priceController,
                    align: TextAlign.left,
                  ),
                  _describeField(),
                  Container(
                    padding: const EdgeInsets.only(top: 15,bottom: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Upload pictures", style: TextStyle(fontSize: 15,color: Colors.black87),),
                        const SizedBox(height: 15,),
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
                    minimumSize: MaterialStateProperty.all<Size>(const Size(double.infinity, 44)),
                    overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent)
                ),
                onPressed: checkParams,
                child: const Text('Submit'),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _describeField() {
    return Container(
      constraints: const BoxConstraints(minHeight: 50),
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
              height:48,
              child: Center(child: Text('Describe', style: TextStyle(fontSize: 15,color: Colors.black87),))
          ),
          const SizedBox(width: 16,),
          Expanded(
            child: TextField(
              maxLines: 8,
              minLines: 1,
              controller: _descController,
              style: const TextStyle(fontSize: 15,),
              decoration: const InputDecoration(
                  hintText: "Enter describe",
                  border: InputBorder.none
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _wrapItems() {
    if (_selectAssets.isEmpty) {
      return [_buildAddButton()];
    }else {
      if (_selectAssets.length < 6) {
        List<Widget> array = <Widget>[];
        var list = _selectAssets.map((e) => _buildImageItem(e)).toList();
        array.addAll(list);
        array.add(_buildAddButton());
        return array;
      }else {
        return _selectAssets.map((e) => _buildImageItem(e)).toList();
      }
    }

  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap:() async {
        final List<AssetEntity>? result = await AssetPicker.pickAssets(
            context,
            pickerConfig: AssetPickerConfig(
                selectedAssets: _selectAssets,
                maxAssets: 6
            )
        );
        if (result != null && result.isNotEmpty) {
          _selectAssets = result;
          if (mounted) {
            setState(() {
            });
          }
        }
      },
      child: Container(
          width:itemWidth,
          height: itemWidth,
          color: Colors.grey,
          child: const Icon(Icons.add)
      ),
    );
  }

  Stack _buildImageItem(AssetEntity entity) {

    return Stack(
      children: [
        AssetEntityImage(entity, isOriginal: false,width: itemWidth, height: itemWidth, fit: BoxFit.cover,),
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
              )
          ),
        )
      ],
    );
  }
}
