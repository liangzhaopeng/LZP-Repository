import 'package:flutter/material.dart';

class CommentReferWidget extends StatelessWidget {
  final List<OscProjectCommentRefer> refers;

  CommentReferWidget({Key? key, required this.refers})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int referCount = refers.length ?? 0;
    Widget emptyWidget = const Divider(
      color: Colors.transparent,
      height: 0,
    );
    if (referCount > 0) {
      Widget referWidget = Text("空布局");
      for (int index = 0; index < referCount; index++) {
        referWidget = buildRefer(refers.elementAt(index), index,
            index == 0 ? emptyWidget : referWidget);
      }
      return referWidget;
    } else {
      return emptyWidget;
    }
  }

  Widget buildRefer(
      OscProjectCommentRefer refer, int index, Widget referWidget) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: 1.0,
          vertical: 1.0),
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.black12, width: 2.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          referWidget,
          buildReferContent(refer, index),
        ],
      ),
    );
  }

  Widget buildReferContent(OscProjectCommentRefer refer, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 2.0, vertical:2.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            " ${index + 1}  ",
            // style: MyTextStyle.COMMENT_REFER_INDEX,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  refer.author,
                  // style: MyTextStyle.COMMENT_REFER_AUTHOR,
                ),
                Offstage(
                  offstage: refer.pubDate.isEmpty,
                  child: Text(
                    refer.pubDate,
                    // style: MyTextStyle.COMMENT_REFER_TIME,
                  ),
                ),
                Text(refer.content,
                    // style: MyTextStyle.LIST_ACTIVITY_CONTENT
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OscProjectCommentRefer {
  String author = "默认作者";
  String pubDate = "2022.08.11 18:54";
  String content = "默认文字";

  // OscProjectCommentRefer({this.author,required this.pubDate,required this.content});

}
