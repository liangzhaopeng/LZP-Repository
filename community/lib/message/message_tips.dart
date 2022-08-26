import 'package:community/message/tips_data.dart';
import 'package:community/utils/xs_dimens.dart';
import 'package:flutter/material.dart';

import '../network/network_request.dart';
import '../utils/as_util.dart';
import '../utils/xs_colors.dart';

class MessageTips extends StatefulWidget {
  static const routeName = "/messageTips";

  MessageTips({Key? key}) : super(key: key);

  @override
  State<MessageTips> createState() => _MessageTipsState();
}

class _MessageTipsState extends State<MessageTips> {
  List<TipData> tipData = [];

  @override
  initState(){
    super.initState();
    // print("tipData===${widget.tipData.length}");
    _getTipsList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message tips'),
      ),
      body: Container(
        color: const Color(0xffF8F9FB),
        padding: EdgeInsets.only(top: XsDimens.adaptWidth(8)),
        child: tipData.isEmpty?const Center(
          child: Text("No data"),
        ):Container(
            color: Colors.white,
            child: ListView.separated(
              itemBuilder: (context, index) {
                if (index < tipData.length) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: XsDimens.adaptWidth(20),
                        right: XsDimens.adaptWidth(20),
                        top: XsDimens.adaptWidth(16),
                        bottom: XsDimens.adaptWidth(16)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: XsDimens.adaptWidth(25)),
                          child: Wrap(
                            children: <Widget>[
                              Text(tipData[index].content!,
                                style: const TextStyle(color: XsColors.titleColor, fontSize: 14.0),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: XsDimens.adaptWidth(16)),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(tipData[index].createTime!, style: const TextStyle(
                                      color: XsColors.textColor,
                                      fontSize: 12,
                                      height: 2.0),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  );
                }
                return Container();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                    color: const Color(0xffE9E9E9),
                    height: 0.5,
                    margin: EdgeInsets.only(left: XsDimens.adaptWidth(6)));
              },
              itemCount: tipData.length,
            )),
      ),
    );
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

        });
        print("size===${tipData.length}");
      }
    });
  }
}
