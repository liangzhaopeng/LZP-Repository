import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

//图片工具类
class ImageUtil {
  static const String IMAGE_PATH = "assets/";

  //获取本地图片路径
  /// name 图片名
  static String getImagePath({required String name}) {
    return IMAGE_PATH + name;
  }

  //获取本地图片资源
  /// name 图片名
  static AssetImage getAssetImage({required String name}) {
    return AssetImage(getImagePath(name: name));
  }

  /*
   * 加载本地图片
   *  name 图片名
   *  width 宽
   *  height 高
   *  color 颜色
   *  colorBlendMode 颜色混合模式
   *  fit 显示模式
   *  alignment 显示位置
   *  repeat 图片重复
   *  matchTextDirection 遵循文本方向
   */
  static Image getLocalImage(
      {required String name,
      double? width,
      double? height,
      Color? color,
      BlendMode? colorBlendMode,
      BoxFit fit = BoxFit.cover,
      AlignmentGeometry alignment = Alignment.center,
      ImageRepeat repeat = ImageRepeat.noRepeat,
      bool matchTextDirection = false}) {
    return Image.asset(getImagePath(name: name),
        width: width,
        height: height,
        color: color,
        colorBlendMode: colorBlendMode,
        fit: fit,
        alignment: alignment,
        repeat: repeat,
        matchTextDirection: matchTextDirection);
  }

  //加载网络图片
  /// name 图片名
  /// placeholderImgName 占位图片名
  /// errorImgName 错误图片名
  /// placeholder 占位图空间
  /// errorWidget 错误图空间
  /// width 宽
  /// height 高
  /// color 颜色
  /// colorBlendMode 颜色混合模式
  /// fit 显示模式
  /// alignment 显示位置
  /// repeat 图片重复
  /// matchTextDirection 遵循文本方向
  /// httpHeaders 网络头信息
  // static CachedNetworkImage getNetworkImage(
  //     {required String url,
  //     String? placeholderImgName,
  //     String? errorImgName,
  //     Widget? placeholder,
  //     Widget? errorWidget,
  //     double? width,
  //     double? height,
  //     BoxFit fit = BoxFit.cover,
  //     AlignmentGeometry alignment = Alignment.center,
  //     ImageRepeat repeat = ImageRepeat.noRepeat,
  //     bool matchTextDirection = false,
  //     Map<String, String>? httpHeaders}) {
  //   //加载中占位图
  //   if (placeholder == null && placeholderImgName.isNotEmpty) {
  //     placeholder = getLocalImage(name: placeholderImgName);
  //   }
  //   //加载失败图片
  //   if (errorWidget == null && errorImgName.isNotEmpty) {
  //     errorWidget = getLocalImage(name: errorImgName);
  //   } else {
  //     errorWidget = placeholder;
  //   }
  //   return CachedNetworkImage(
  //       imageUrl: url,
  //       placeholder: (
  //         BuildContext context,
  //         String url,
  //       ) {
  //         return placeholder;
  //       },
  //       errorWidget: (
  //         BuildContext context,
  //         String url,
  //         dynamic error,
  //       ) {
  //         return errorWidget;
  //       },
  //       width: width,
  //       height: height,
  //       fit: fit,
  //       alignment: alignment,
  //       repeat: repeat,
  //       matchTextDirection: matchTextDirection,
  //       httpHeaders: httpHeaders);
  // }

}
