import 'package:community/utils/screen_util.dart';

class XsDimens {
  // 字体大小
  static const double font_10 = 10;
  static const double font_12 = 12;
  static const double font_14 = 14;
  static const double font_16 = 16;
  static const double font_18 = 18;
  static const double font_20 = 20;
  static const double font_24 = 24;

  // 间距
  static const double space_8 = 8;
  static const double space_12 = 12;
  static const double space_16 = 16;
  static const double space_20 = 20; // 左右间距
  static const double space_24 = 24;
  static const double space_32 = 32;
  static const double space_40 = 40;

  static double get sFont10 => ScreenUtils.getInstance().getWidth(font_10);
  static double get sFont12 => ScreenUtils.getInstance().getWidth(font_12);
  static double get sFont14 => ScreenUtils.getInstance().getWidth(font_14);
  static double get sFont16 => ScreenUtils.getInstance().getWidth(font_16);
  static double get sFont18 => ScreenUtils.getInstance().getWidth(font_18);
  static double get sFont20 => ScreenUtils.getInstance().getWidth(font_20);
  static double get sFont24 => ScreenUtils.getInstance().getWidth(font_24);

  static double get sSpace8 => ScreenUtils.getInstance().getWidth(space_8);
  static double get sSpace12 => ScreenUtils.getInstance().getWidth(space_12);
  static double get sSpace16 => ScreenUtils.getInstance().getWidth(space_16);
  static double get sSpace20 => ScreenUtils.getInstance().getWidth(space_20);
  static double get sSpace24 => ScreenUtils.getInstance().getWidth(space_24);
  static double get sSpace32 => ScreenUtils.getInstance().getWidth(space_32);
  static double get sSpace40 => ScreenUtils.getInstance().getWidth(space_40);

  static double adaptWidth(double num) =>
      ScreenUtils.getInstance().getWidth(num);
}
