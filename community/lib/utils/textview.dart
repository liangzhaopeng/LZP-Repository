import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextViewEnum { none, border }
typedef OnSend = void Function(String value);

class TextView extends StatefulWidget {
  final int maxCount;
  final String hintText;
  final TextViewEnum textViewEnum;
  final FocusNode? focusNode;
  final String title;
  final bool isMust;
  final bool isHiddenTitle;
  final TextEditingController? textEditingController;
  final TextInputAction textInputAction;
  final bool autofocus;
  final TextStyle textStyle;
  final TextStyle tipStyle;
  final TextStyle hintTextStyle;
  final TextStyle tvStyle;
  final Color tvBgColor;
  final OnSend? onSend;
  final OnSend? onComplete;
  final OnSend? onChange;
  final Alignment botAlignment;
  final double height;
  final bool isFulCount;

  TextView({
    this.height = 150,
    this.maxCount = 100,
    this.hintText = '请输入',
    this.textViewEnum = TextViewEnum.none,
    this.textStyle = const TextStyle(),
    this.onSend,
    this.onChange,
    this.focusNode,
    this.title="",
    this.isFulCount = false,
    this.isMust = false,
    this.isHiddenTitle = true,
    this.textEditingController,
    this.textInputAction = TextInputAction.done,
    this.autofocus = false,
    this.hintTextStyle = const TextStyle(
      fontSize: 14,
      color: Colors.grey,
      textBaseline: TextBaseline.alphabetic,
    ),
    this.tipStyle = const TextStyle(fontSize: 12, color: Color(0xff9E9E9E)),
    this.tvStyle = const TextStyle(
      color: Color(0xff333333),
      fontSize: 14,
      height: 1.5,
      textBaseline: TextBaseline.alphabetic,
    ),
    this.tvBgColor = const Color(0xfff3f3f3),
    this.onComplete,
    this.botAlignment = Alignment.bottomRight,
  });
  @override
  State<StatefulWidget> createState() {
    return _TextViewState();
  }
}

class _TextViewState extends State<TextView> {
  _TextViewState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.isHiddenTitle
            ? Container()
            : Container(
                padding: const EdgeInsets.only(left: 20),
                height: 56,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    widget.isMust
                        ? const Text(
                            '*',
                            style: TextStyle(color: Colors.red),
                          )
                        : Container(),
                    Text(
                      widget.title,
                      style: widget.textStyle,
                    ),
                  ],
                ),
              ),
        textViewBuild(),
      ],
    );
  }

  Widget textViewBuild() {
    return Container(
      height: widget.height,
      margin: const EdgeInsets.only(left: 20, top: 0, right: 20, bottom: 0),
      decoration: BoxDecoration(
        color: widget.tvBgColor,
        border: Border.all(
          color: borderColor(),
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              textInputAction: widget.textInputAction,
              onSubmitted: (String value) {
                print('value$value');
                widget.onSend??(value);
              },
              focusNode: widget.focusNode,
              keyboardType: TextInputType.multiline,
              maxLines: null, // 不限制行数
              maxLength: widget.isFulCount ? null : widget.maxCount,
              maxLengthEnforcement: MaxLengthEnforcement
                  .enforced, // 当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红。
              style: widget.tvStyle,
              autofocus: widget.autofocus, // 自动获取光标
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.only(
                    left: 16, right: 16, top: 16, bottom: 8),
                counterText: "",
                hintText: widget.hintText, // widget.autofocus ? '' :
                hintStyle: widget.hintTextStyle,
                border: const OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(5)), // 设置边框四个角的弧度
                  borderSide: BorderSide.none, // 用来配置边框的样式
                ), // border: InputBorder.none,
              ),
              // cursorHeight: 15,
              onChanged: (String value) {
                widget.onChange??(value);
              },
              controller: widget.textEditingController, // 监听文本变化
              onEditingComplete: () {
                //输入完成
                widget.onComplete??('');
                print('object');
              },
            ),
          ),
          Container(
            // height: 30,
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 8),
            alignment: widget.botAlignment,
            child: widget.isFulCount &&
                    widget.textEditingController!.text.length > widget.maxCount
                ? RichText(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    text: TextSpan(
                      children: [
                        // <InlineSpan>
                        // InlineSpan、TextSpan
                        TextSpan(
                          text: "${widget.textEditingController!.text.length}",
                          style: const TextStyle(
                              color: Color(0xffFF6060),
                              fontSize: 12,
                              height: 1.0),
                        ),
                        TextSpan(
                          text: "/${widget.maxCount}",
                          style: const TextStyle(
                              color: Color(0xff9E9E9E),
                              height: 1.0,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  )
                : Text(
              //TODO
                    '${widget.textEditingController!.text.length}/${widget.maxCount}',
                    style: widget.tipStyle,
                  ),

            // widget.isFulCount
          ),
        ],
      ),
      // ),
    );
  }

  Color borderColor() {
    switch (widget.textViewEnum) {
      case TextViewEnum.none:
        return Colors.transparent;
      case TextViewEnum.border:
        return Colors.grey;
      default:
        return Colors.white;
    }
  }

  /// 隐藏键盘
  void hideKeyboard() {
    widget.focusNode?.unfocus();
  }

  /// 显示键盘
  void showSoftKey() {
    FocusScope.of(context).requestFocus(widget.focusNode);
  }
}
