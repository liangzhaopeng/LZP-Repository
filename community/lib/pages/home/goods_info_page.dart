import 'package:cached_network_image/cached_network_image.dart';
import 'package:community/comment/comment_cell.dart';
import 'package:community/comment/commentmodel.dart';
import 'package:community/network/network_config.dart';
import 'package:community/pages/home/models/goods_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../comment/comment_dialog_page.dart';
import '../../comment/pageInfo.dart';
import '../../network/network_request.dart';
import '../../utils/as_util.dart';

class GoodsInfoPage extends StatefulWidget {
  static const routeName = "/goodsinfo";

  const GoodsInfoPage({Key? key}) : super(key: key);

  @override
  State<GoodsInfoPage> createState() => _GoodsInfoPageState();
}

class _GoodsInfoPageState extends State<GoodsInfoPage> {
  Goods? goods;
  int mCommentSum = 0;
  PageInfo pageInfo = PageInfo(pageNumber: 1, pageSize: 20, total: 0);
  // 刷新加载控制器
  final RefreshController _refreshController = RefreshController(initialRefresh: false);
  List<OneComment>? dataSource = [];

  @override
  void initState() {
    super.initState();
    print("print---initState");
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments;
      if (args is Goods) {
        setState(() {
          goods = args;
          _getThumbSum();
          _getCommentList(false);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Goods Info'),
        ),
        body: SmartRefresher(
          ///可在此通过header:和footer:指定个性效果
          //允许下拉
          enablePullDown: true,
          //允许上拉加载
          enablePullUp: true,
          //控制器
          controller: _refreshController,
          //刷新回调方法
          onRefresh: refresh,
          //加载下一页回调
          onLoading: loadMore,
          child: _List(),
        ));
  }
  Widget _List(){
    return ListView(
      padding: const EdgeInsets.all(15),
      children: [
        Text(
          goods?.goodsName ?? "",
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          '\$${goods?.price}',
          style: const TextStyle(fontSize: 17),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          goods?.goodsDescribe ?? "",
          style: const TextStyle(fontSize: 17),
        ),
        _bulidPhotos(),
        _buildCommentAndLike(),
        const Text("Comment list", style: TextStyle(color: Colors.black, fontSize: 14)),
        _buildComment(),
      ],
    );
  }

  /// 刷新
  void refresh() {
    pageInfo.pageNumber = 1;
    dataSource = [];
      _getCommentList(false);
  }

  /// 加载更多
  void loadMore() {
    if (pageInfo.total! > pageInfo.pageSize * pageInfo.pageNumber) {
      pageInfo.pageNumber += 1;
      _getCommentList(true);
    } else {
      EasyLoading.showInfo("no more data");
      _refreshController.loadNoData();
    }
  }

  ///获取评论列表
  void _getCommentList(bool isLoadMore) {
    print("----${goods?.id}");
    print("----${pageInfo.pageNumber} ");
    print("----${pageInfo.pageSize} ");
    var params = {
      'currentPage': pageInfo.pageNumber, //  页码
      'pageSize': pageInfo.pageSize, // 一页大小
      "pId":0,
      "secondHandId": goods?.id,
    };
    HTTPRqeust.request("comment/list", method: "post", isJson: true, params: params).then((value) {
      CommentModel commentModel = CommentModel.fromJson(value);
      if (commentModel.code == 0) {
        List<OneComment>? list = commentModel.data?.list;
        pageInfo.total = commentModel.data?.total;
        if(isLoadMore){
          dataSource?.addAll(list!);
        }else {
          dataSource?.clear();
          dataSource?.addAll(list!);
        }
        if (isLoadMore) {
          print("print 加载更多---$isLoadMore");
          _refreshController.loadComplete();
        } else {
          print("print 加载更多---$isLoadMore");
          _refreshController.refreshCompleted();
        }
        if(mounted){
          setState(() {});
        }
      } else {
        EasyLoading.showInfo(value['msg']);
      }
    }).onError((error, stackTrace) {});
  }

  Widget _buildCommentAndLike() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 10, 10, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              //评论事件
              Navigator.of(context).push(PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return CommentDialogPage((String content) {
                      //首页评论事件---TODO 1
                      _addComment(content);
                    });
                  }));
            },
            child: Container(
              // 设置点击按钮样式
              height: 30,
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              margin: const EdgeInsets.only(bottom: 12, right: 10),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                  color: Colors.blue),
              child: const Text(
                "Post comments",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
          ),
          GestureDetector(
            //收藏按钮样式
            onTap: () {
              print("点击收藏按钮");
              _relevantAndThumbUp("1");
            },
            child: Container(
              height: 25,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 16, right: 10),
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
              print("点赞按钮点击事件");
              _relevantAndThumbUp("2");
            },
            child: Container(
              height: 25,
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 16, right: 10),
              child: const Icon(
                //设置点赞按钮图标
                Icons.thumb_up,
                color: Colors.blue,
                size: 25,
              ),
            ),
          ),
          Text(mCommentSum.toString(),
              style: const TextStyle(color: Colors.black, fontSize: 14)),
        ],
      ),
    );
  }

  void _getThumbSum() {
    var params = {"secondHandId": goods?.id, "type": "2"};
    HTTPRqeust.request("collection/sum",
            method: "post", isJson: true, params: params)
        .then((value) {
      if (value['code'] == 0) {
        print("11");
        final data = value['data'] as int;
        print(data);
        setState(() {
          mCommentSum = data;
        });
      } else {
        EasyLoading.showInfo(value['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  /// type  : 1收藏 2点赞
  void _relevantAndThumbUp(String type) {
    print("点击按钮收藏/点赞按钮---$goods?.id");
    var params = {
      "userId": SpUtil.preferences?.getInt("userId"),
      "secondHandId": goods?.id,
      "type": type
    };
    EasyLoading.show(status: "Submitting...");
    HTTPRqeust.request("collection/relevant",
            method: "post", isJson: true, params: params)
        .then((value) {
      if (value['code'] == 0) {
        if (type == "1") {
          EasyLoading.showSuccess(' Success');
        } else {
          //点赞成功刷新;
          _getThumbSum();
          _refreshController.requestRefresh();
          EasyLoading.showSuccess(' Success');
        }
        print("11");
        final data = value['data'] as OneComment;
        print(data);
      } else {
        EasyLoading.showInfo(value['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }

  void _addComment(String content, {int pId = 0}) {
    var params = {
      "pId": pId, //如果是评论下加评论 这个传第一个评论的id
      "secondHandId": goods?.id, //帖子id
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
        _refreshController.requestRefresh();
      } else {
        EasyLoading.showInfo(value['msg']);
      }
    }).onError((error, stackTrace) {
      EasyLoading.dismiss();
    });
  }


  Widget _bulidPhotos() {
    final images =
        goods?.imageList?.map((e) => HTTPConfig.baseURL + e).toList();
    if (images != null) {
      return Column(
        children: images!.map((e) {
          return Container(
              margin: const EdgeInsets.only(top: 15),
              child: CachedNetworkImage(imageUrl: e));
        }).toList(),
      );
    } else {
      return const Padding(padding: EdgeInsets.zero);
    }
  }

  Widget _buildComment() {
    // return Container();
    if (dataSource != null) {
      return Column(
        children: dataSource!.map((e) {
          return Container(
              margin: const EdgeInsets.only(top: 6),
              child: CommentCell(
                model: e,
                onRefresh: () {
                  print('刷新列表');
                  _refreshController.requestRefresh();
                }, tId:goods?.id as int
              ));
        }).toList(),
      );
    } else {
      return const Padding(padding: EdgeInsets.zero);
    }
  }
}
