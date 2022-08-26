import 'package:flutter/material.dart';

class CommonUtil {
  ///value: 文本内容；fontSize : 文字的大小；fontWeight：文字权重；maxWidth：文本框的最大宽度；maxLines：文本支持最大多少行 ；locale：当前手机语言；textScaleFactor：手机系统可以设置字体大小（默认1.0）
  static Size calculateTextSize(String value, fontSize, FontWeight fontWeight,
      double maxWidth, int? maxLines,
      {double height = 1.0}) {
    //过滤文本
// value = filterText(value);
    TextPainter painter = TextPainter(

        ///AUTO：华为手机如果不指定locale的时候，该方法算出来的文字高度是比系统计算偏小的。
        locale: WidgetsBinding.instance.window.locale,
        maxLines: maxLines,
        textDirection: TextDirection.ltr,
        textScaleFactor: 1.0, // textScaleFactor, //字体缩放大小
        text: TextSpan(
            text: value,
            style: TextStyle(
              fontWeight: fontWeight,
              fontSize: fontSize,
              height: height,
            )));
    painter.layout(maxWidth: maxWidth);

    ///文字的宽度:painter.width
    return Size(painter.width, painter.height);
  }
}
