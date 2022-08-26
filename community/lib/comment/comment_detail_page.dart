
import 'package:community/comment/comment.dart';
import 'package:community/comment/commentmodel.dart';
import 'package:community/comment/pageInfo.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../utils/xs_dimens.dart';
import 'comment_more_cell.dart';

typedef void OnRefresh(int index);

/**
 * 查看全部回复;
 */
class CommentDetailPage extends StatefulWidget {
  // final int recordId;
  final List<OneComment>? list;
  final OnRefresh onRefresh;

  CommentDetailPage({
    required this.list,
    required this.onRefresh,
  });
  @override
  State<StatefulWidget> createState() => _CommentDetailPageState();
}

class _CommentDetailPageState extends State<CommentDetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('comment detail'),
        ),
        body: Container(
        color: Color(0xffF8F9FB),
        padding: EdgeInsets.only(top: XsDimens.adaptWidth(8)),
        child: Container(
            color: Colors.white,
            child: ListView.separated(
              itemBuilder: (context, index) {
                if (index < widget.list!.length) {
                  return CommentMoreCell(
                    model: widget.list![index],
                    onRefresh: (bool isDel) {
                      if (isDel) {
                        if (widget.onRefresh != null) {
                          widget.onRefresh(index);
                        }
                        setState(() {
                          // widget.list.removeAt(index);
                        });
                      }
                    },
                  );
                }
                return Container();
              },
              separatorBuilder: (BuildContext context, int index) {
                return Container(
                    color: Color(0xffE9E9E9),
                    height: 0.5,
                    margin: EdgeInsets.only(left: XsDimens.adaptWidth(20)));
              },
              itemCount: widget.list!.length,
            )),
    ),
      );
  }
}
