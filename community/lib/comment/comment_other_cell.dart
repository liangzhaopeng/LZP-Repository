

import 'package:community/comment/commentmodel.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/**
 * 大评论下面的小评论
 */
class CommentOtherCell extends StatefulWidget {
  final OneComment model;
  const CommentOtherCell({
    Key? key,
    required this.model,
  }) : assert(model != null, 'model不能为空');
  @override
  _CommentOtherCellState createState() => _CommentOtherCellState();
}

class _CommentOtherCellState extends State<CommentOtherCell>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
      child: RichText(
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          // text: '富文本：',
          // style: DefaultTextStyle.of(context).style,
          children: [
            // <InlineSpan>
            // InlineSpan、TextSpan
            TextSpan(
              text: widget.model.userName ?? '',
              style: const TextStyle(color: Color(0xff2f82ff), height: 1.0),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  headAction();
                },
            ),
            TextSpan(
              text: '：${widget.model.content}',
              style: const TextStyle(
                  color: Color(0xff999999), height: 1.0, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void headAction() {}
}
