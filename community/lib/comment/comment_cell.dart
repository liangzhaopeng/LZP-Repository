
import 'package:community/comment/comment_detail_page.dart';
import 'package:community/comment/comment_other_cell.dart';
import 'package:community/comment/commentmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../network/network_request.dart';
import '../utils/as_util.dart';
import '../utils/image_util.dart';
import '../utils/xs_colors.dart';
import '../utils/xs_dimens.dart';
import 'comment_dialog_page.dart';

typedef OnRefresh = void Function();

class CommentCell extends StatefulWidget {
  final OneComment model;
  final OnRefresh onRefresh;
  int tId;//帖子ID;
  // final OnRefesh
  CommentCell({
    Key? key,
    required this.model,
    required this.onRefresh,
    required this.tId
  }) : assert(model != null, 'model不能为空');
  @override
  _CommentCellState createState() => _CommentCellState();
}

class _CommentCellState extends State<CommentCell>
    with WidgetsBindingObserver, TickerProviderStateMixin {

  ScrollController mCommentScrollController =  ScrollController();
  int? userId = SpUtil.preferences?.getInt("userId");

  @override
  Widget build(BuildContext context) {
    print('object');
    print('object');

    return MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
      context: context,
      child: GestureDetector(
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
                    Container(
                      margin: EdgeInsets.only(top: XsDimens.adaptWidth(8)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  widget.model.userName!,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: XsColors.titleColor,
                                      fontSize: 16.0),
                                ),
                                Text(
                                    widget.model.userId == userId
                                        ? "(myself)"
                                        : '',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 12.0)),
                              ]),
                         /* widget.model.userId == userId
                              ? GestureDetector(
                                  onTap: moreAction,
                                  child: ImageUtil.getLocalImage(
                                    name: 'neighbour_del.png',
                                    width: 16,
                                    height: 16,
                                    color: Theme.of(context).primaryColor,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              :*/
                          Container(),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: XsDimens.adaptWidth(25),
                          bottom: XsDimens.adaptWidth(16)),
                      child: Wrap(
                        children: <Widget>[
                          Text(
                            widget.model.content ?? '',
                            style: const TextStyle(
                                color: XsColors.titleColor,
                                fontSize: 14.0,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.model.createTime!,
                          style: const TextStyle(
                              color: XsColors.textColor,
                              fontSize: 12.0,
                              height: 2.0),
                        ),
                        GestureDetector(
                          onTap: commentAction,
                          child: Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.only(
                                  left: XsDimens.adaptWidth(10),
                                  top: XsDimens.adaptWidth(10),
                                  right: 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  ImageUtil.getLocalImage(
                                    name: 'comment_normal.png',
                                    width: 17,
                                    height: 17,
                                    fit: BoxFit.cover,
                                  ),
                              /*    widget.model.replyCount == 0
                                      ? Container()
                                      : Container(
                                          padding: EdgeInsets.only(
                                              left: XsDimens.adaptWidth(8)),
                                          child: Text(
                                            widget.model.replyCount == 0
                                                ? ''
                                                : "${widget.model.replyCount}",
                                            style: const TextStyle(
                                                color: XsColors.textColor),
                                          ),
                                        ),*/
                                ],
                              )),
                        ),
                      ],
                    ),
                    widget.model == null || widget.model.commentList == null
                        ? Container()
                        : Container(
                                padding: EdgeInsets.only(
                                    top: XsDimens.adaptWidth(16)),
                                child: commentOtherBuild(
                                    widget.model.commentList!))
                          ,
                    widget.model == null || widget.model.commentList == null
                        ? Container()
                        : widget.model.commentList!.length > 2
                            ? GestureDetector(
                              onTap: (){
                                moreCommentAction();
                              },
                              child: Container(
                                  height: XsDimens.adaptWidth(24),
                                  width: double.infinity,
                                  padding: EdgeInsets.only(
                                      left: XsDimens.adaptWidth(20)),
                                  alignment: Alignment.centerLeft,
                                  decoration: const BoxDecoration(
                                    color: Color(0x1AFF9A52),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(4)),
                                  ),
                                  child: Text(
                                    'Total ${widget.model.commentList == null ? 0 : widget.model.commentList!.length} replies',
                                    style: const TextStyle(
                                        color: Color(0xffF97D24), fontSize: 12),
                                  ),
                                ),
                            )
                            : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commentOtherBuild(List<OneComment> childComment) {
    // return Container();
    return MediaQuery.removePadding(
      removeTop: true,
      removeBottom: true,
      context: context,
      child: GestureDetector(
        onTap: () {
          moreCommentAction();
        },
        child: DecoratedBox(
          decoration: const BoxDecoration(
            color: Color(0xffF9F9F9),
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
          ),
          child: Container(
            padding: EdgeInsets.only(
                top: XsDimens.adaptWidth(16),
                bottom: XsDimens.adaptWidth(16),
                left: XsDimens.adaptWidth(16),
                right: XsDimens.adaptWidth(11)), //, bottom: 5
            child: ListView.builder(
              itemBuilder: (context, index) {
                if (index < 2) {
                  return Container(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: CommentOtherCell(
                        model: childComment[index],
                      ));
                }
                return Container();
              },
              itemCount: childComment.length < 3 ? childComment.length : 3,
              shrinkWrap: true, //范围内进行包裹（内容多高ListView就多高）
              physics: const NeverScrollableScrollPhysics(), //禁止滚动
            ),
          ),
        ),
      ),
    );
  }

  /// 弹出举报/删除
  void moreAction() {
   /* ShowAlertDialog.popDialog(
        context,
        ShowAlertDialog(
          items: ['取消', '删除'],
          title: '确定删除这条评论吗？',
          content: null,
          onTap: (index) {
            if (index == 1) {
              this.deleteAction();
            }
          },
        ));*/

  }
  /// 弹出评论界面
  void commentAction() {
    Navigator.of(context).push(PageRouteBuilder(
        opaque: false,
        pageBuilder: (context, animation, secondaryAnimation) {
          return CommentDialogPage((String content){
            //单独回复事件
            print("点击发送后的文字为$content");
            _addComment(content,pId:widget.model.id);
          });
        }));
  }

  void _addComment(String content, {int? pId = 0}) {
    var params = {
      "pId": pId, //如果是评论下加评论 这个传第一个评论的id
      "secondHandId": widget.tId, //帖子id
      //登录id;
      "userId": SpUtil.preferences?.getInt("userId"),
      //登录名;
      "userName": SpUtil.preferences?.getString("loginName"),
      "content": content
    };
    EasyLoading.show(status: "Submitting...");
    HTTPRqeust.request("comment/add", method: "post", isJson: true, params: params).then((value) {
      if (value['code'] == 0) {
        EasyLoading.showSuccess(' Success');
        Navigator.pop(context);
        widget.onRefresh();
      } else {
        EasyLoading.showInfo(value['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }


  /// 更多回复
  void moreCommentAction() {
    print("点击更多回复...");
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
      return CommentDetailPage(
          list: widget.model.commentList,
          onRefresh: (int index) {
            setState(() {
              widget.model.commentList!.removeAt(index);
            });
          }
          // recordId: widget.model.recordId,
          );
    }));
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
  /// 举报
  void alertAction() {}
}
