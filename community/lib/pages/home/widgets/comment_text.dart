
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CommentText extends StatelessWidget {
  bool keyboard = true; //键盘的弹起、收回状态
  TextEditingController editingController = TextEditingController(); //输入框的编辑

  CommentText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).padding.bottom; // 这个很简单，就是获取高度，获取的底部安全区域的高度
    return Container(
      child: AnimatedPadding(
        //可以添加一个动画效果
        padding: MediaQuery.of(context).viewInsets, //边距（必要）
        duration: const Duration(milliseconds: 100), //动画时常 （必要）
        child: Container(
          color: Colors.white,
          ///评论位置颜色
          padding: EdgeInsets.only(bottom: keyboard ? 0 : height),
          //距离底部边界距离，这个是为了适配全面屏的，keyboard，bool类型，代表键盘的弹起和收回。true谈起，false收回，这个值怎么获取下面会有提到。
          child: SizedBox(
            // height: keyboard ? 60 : 60, //设置输入框谈起和收回时的高度
            // width: double.infinity, //设置宽度
            child: Flex(
              //控件横向排版弹性布局
              direction: Axis.horizontal,
              crossAxisAlignment: CrossAxisAlignment.end, //剧右边显示
              children: <Widget>[
                Expanded(
                  //设置输入框
                  flex: 1,
                  child: Container(
                    // height: double.infinity,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      //设置边框、圆角效果
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 0.5, color: Colors.grey)),
                    child: Expanded(
                      child: TextField(
                        maxLines: null,
                        minLines: 1,
                        //最大行数
                        keyboardType: TextInputType.multiline,
                        controller: editingController,
                        //绑定TextEditController更好操作
                        style: const TextStyle(
                          //设置字体、颜色
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        autocorrect: true,
                        decoration: const InputDecoration(
                          //设置提示内容，字体颜色、大小等
                          border: InputBorder.none,
                          hintText: "请发表你的评论",
                          hintStyle: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                        onChanged: (text) {
                          // 获取时时输入框的内容
                        },
                      ),
                    ),
                  ),
                ),
                Offstage(
                  //控件隐藏控件
                  offstage: !keyboard, //键盘弹起，发布按钮显示、反之隐藏
                  child: GestureDetector(
                    onTap: () {
                      // 点击发布按钮判断输入框内容是否为空，并提示用户
                      if (editingController.text.isEmpty) {
                        EasyLoading.showToast("请填写评论信息");
                        return;
                      }
                      editingController.text = ""; //不为空，点击发布后，清空内容
                      FocusScope.of(context)
                          .requestFocus(FocusNode()); //关闭键盘
                    },
                    child: Container(
                      // 设置点击按钮样式
                      height:30,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      margin: const EdgeInsets.only(bottom: 12, right: 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8.0),
                          ),
                          color: Colors.blue),
                      child: const Text("发布", style: TextStyle(color: Colors.white, fontSize: 14),),
                    ),
                  ),
                ),
                GestureDetector(
                  //点赞按钮样式
                  onTap: () {
                    // 点赞收藏点击事件
                    EasyLoading.showToast("收藏按钮点击事件");
                  },
                  child: Container(
                    height: 25,
                    alignment: Alignment.center,
                    margin:  const EdgeInsets.only(bottom: 16, right: 10),
                    child: const Icon(
                      //设置点赞按钮图标
                      Icons.favorite_border,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                ),
                GestureDetector(
                  //点赞按钮样式
                  onTap: () {
                    // 点赞按钮点击事件
                    EasyLoading.showToast("点赞按钮点击事件");
                  },
                  child: Container(
                    height: 25,
                    alignment: Alignment.center,
                    margin:  const EdgeInsets.only(bottom: 16, right: 10),
                    child: const Icon(
                      //设置点赞按钮图标
                      Icons.thumb_up,
                      color: Colors.blue,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}