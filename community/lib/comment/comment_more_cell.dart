
import 'package:community/comment/comment_dialog_page.dart';
import 'package:community/comment/commentmodel.dart';
import 'package:flutter/material.dart';

import '../utils/image_util.dart';
import '../utils/xs_colors.dart';
import '../utils/xs_dimens.dart';

typedef OnRefresh = void Function(bool isDel);
/**
 * 查看全部小评论的item
 */
class CommentMoreCell extends StatefulWidget {
  final OneComment model;
  final OnRefresh? onRefresh;

  const CommentMoreCell({
    Key? key,
    required this.model,
    this.onRefresh,
  }) : assert(model != null, 'model不能为空');

  @override
  _CommentMoreCellState createState() => _CommentMoreCellState();
}

class _CommentMoreCellState extends State<CommentMoreCell>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // this.detailAction(context);
      },
      child: Container(
        padding: EdgeInsets.only(
            left: XsDimens.adaptWidth(20),
            right: XsDimens.adaptWidth(20),
            top: XsDimens.adaptWidth(16),
            bottom: XsDimens.adaptWidth(16)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 44,
              height: 44,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                  color: Color(0xffEEEEEE), // Color(0xffE6F1FF),
                  borderRadius: BorderRadius.all(Radius.circular(22))),
              child: ClipOval(
                child: ImageUtil.getLocalImage(
                        name: 'me_head_default.png',
                        width: 42,
                        height: 42,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(
              width: XsDimens.adaptWidth(8),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        // color: Colors.red,
                        margin: EdgeInsets.only(top: XsDimens.adaptWidth(8)),
                        child: Text(
                          widget.model.userName!,
                          style: const TextStyle(
                              color: XsColors.titleColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container()
                      // widget.model.accountId == userModel.id
                      //     ? GestureDetector(
                      //         onTap: moreAction,
                      //         child: ImageUtil.getLocalImage(
                      //           name: 'neighbour_del.png',
                      //           width: 18,
                      //           height: 20,
                      //           fit: BoxFit.cover,
                      //         ),
                      //       )
                      //     : Container(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: XsDimens.adaptWidth(25)),
                    child: Wrap(
                      children: <Widget>[
                        Text(
                          widget.model.content!,
                          style: const TextStyle(
                              color: XsColors.titleColor, fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: XsDimens.adaptWidth(16)),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.model.createTime!,
                            style: const TextStyle(
                                color: XsColors.textColor,
                                fontSize: 12,
                                height: 2.0),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// 弹出举报/删除
  void moreAction() {
    // ShowAlertDialog.popDialog(
    //     context,
    //     ShowAlertDialog(
    //       items: ['取消', '删除'],
    //       title: '确定删除这条评论吗？',
    //       content: null,
    //       onTap: (index) {
    //         if (index == 1) {
    //           this.deleteAction();
    //         }
    //       },
    //     ));
  }

  /// 删除
  Future<void> deleteAction() async {
    // Map<String, dynamic> params = {"id": widget.model.id};
    // var api = await BaseConfig.shared.delComment;
    // DioManager.getInstance().getJson(api, params, (data, errorCode, message) {
    //   if (errorCode == 1000) {
    //     if (widget.onRefresh != null) {
    //       widget.onRefresh(true);
    //     }
    //   } else {
    //     if (message == null) {
    //       ToastUtil.show('请求失败');
    //     } else {
    //       ToastUtil.show(message);
    //     }
    //   }
    // }, (error) {
    //   ToastUtil.show('请求失败，请检查网络');
    // });
  }

  /// 弹出评论界面
  void commentAction() {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return CommentDialogPage((String content){

          });
        }));
  }
}
