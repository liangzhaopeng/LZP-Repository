import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../utils/common_util.dart';
import '../utils/screen_util.dart';
import '../utils/textview.dart';
import '../utils/xs_dimens.dart';

typedef OnSendText = void Function(String content);

/**
 * 发表评论弹窗
 */
//微博详情评论界面
class CommentDialogPage extends StatefulWidget {

  final OnSendText onSendText;
  const CommentDialogPage(this.onSendText);
  @override
  _CommentDialogPageState createState() => _CommentDialogPageState();

}

class _CommentDialogPageState extends State<CommentDialogPage> {
  FocusNode focusNode = FocusNode();
  TextEditingController textEditingController = TextEditingController();
  String content = '';
  double textViewHeight = 118;
  @override
  void initState() {
    super.initState();
    // 设置默认文本
    // textEditingController.text = "hello world!";
    // 除了能监听文本变化外，它还可以设置默认值、选择文本
    textEditingController.addListener(() {
      print(textEditingController.text);
      setState(() {
        content = textEditingController.text;
      });
    });
    // 监听焦点变化
    focusNode.addListener(() {
      // 获得焦点时focusNode.hasFocus值为true，失去焦点时为false
      print(focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    FocusScope.of(context).requestFocus(focusNode);

    return WillPopScope(
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Scaffold(
            backgroundColor: const Color.fromRGBO(0, 0, 0, 0.8),
            body:
                Align(
              //对齐底部
              alignment: Alignment.bottomCenter,
              // child: Container(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0))),
                width: ScreenUtils.getInstance().screenWidth,
                height: XsDimens.adaptWidth(
                    32.0 + 40 + textViewHeight), // 250 190
                padding: EdgeInsets.only(
                    top: XsDimens.adaptWidth(16),
                    bottom: XsDimens.adaptWidth(16)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextView(
                      height: XsDimens.adaptWidth(textViewHeight),
                      hintText: 'Write comment......',
                      hintTextStyle:
                          const TextStyle(fontSize: 14, color: Color(0xff9E9E9E)),
                      textViewEnum: TextViewEnum.none,
                      botAlignment: Alignment.bottomLeft,
                      tvBgColor: const Color(0xffF9F9F9),
                      focusNode: focusNode,
                      textInputAction: TextInputAction.send,
                      autofocus: true,
                      maxCount: 300,
                      isFulCount: true,
                      textEditingController: textEditingController,
                      onChange: (String value) {
                        print("onChange : ${value}");
                        double width =
                            ScreenUtils.getInstance().screenWidth - 40.0 - 32;
                        Size size = CommonUtil.calculateTextSize(
                            content, 14.0, FontWeight.normal, width, null,
                            height: 1.5);
                        print("this.textViewHeight 2: $textViewHeight");
                        textViewHeight = (size.height + 46 + 24) > 118
                            ? (size.height + 46 + 24) > 178
                                ? 178
                                : (size.height + 46 + 24)
                            : 118;
                        setState(() {});
                        print("this.textViewHeight : ${textViewHeight}");
                      },
                      onSend: (String value) {
                        content = value;
                        // sendAction();
                      },
                    ),
                    GestureDetector(
                      onTap: sendAction,
                      child: Container(
                        height: XsDimens.adaptWidth(32),
                        decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(24))),
                        margin: EdgeInsets.only(
                            right: XsDimens.adaptWidth(20),
                            top: XsDimens.adaptWidth(8)),
                        padding: EdgeInsets.only(
                            top: XsDimens.adaptWidth(8),
                            bottom: XsDimens.adaptWidth(8),
                            left: XsDimens.adaptWidth(20),
                            right: XsDimens.adaptWidth(20)),
                        child: const Text(
                          'Post',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onWillPop: () {
          // 先把键盘收起来 在返回 ???
          focusNode.unfocus();
          Navigator.pop(context);
          return Future.value(false);
        });
  }

  /// 发送
  Future sendAction() async {
    if (content.isEmpty) {
      EasyLoading.showToast('The comment is empty. Please write something more～');
      return;
    }
    if (content.length > 300) {
      EasyLoading.showToast('Comment exceeds the maximum number of words');
      return;
    }
    widget.onSendText(content);
  }

  Future requestSuccess() async {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showSoftKey() {
    FocusScope.of(context).requestFocus(focusNode);
  }

  void hideSoftKey() {
    focusNode.unfocus();
  }
}
