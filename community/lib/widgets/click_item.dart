import 'package:flutter/material.dart';

class ClickItem extends StatelessWidget {

  const ClickItem({
    Key? key,
    this.onTap,
    required this.title,
    this.content = '',
    this.textAlign = TextAlign.start,
    this.maxLines = 1
  }): super(key: key);

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final int maxLines;


  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      //为了数字类文字居中
      crossAxisAlignment: maxLines == 1 ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 15,color: Colors.black87),),
        const SizedBox(width: 16,),
        Expanded(
          flex: 4,
          child: Text(
            content,
            maxLines: maxLines,
            textAlign: maxLines == 1 ? TextAlign.right : textAlign,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 15,color: Colors.black54),
          ),
        ),
        // const SizedBox(width: 8,),
        buildArrow()
      ],
    );

    /// 分隔线
    child = Container(
      // margin: const EdgeInsets.only(left: 15.0),
      padding: const EdgeInsets.fromLTRB(0, 15.0, 0, 15.0),
      constraints: const BoxConstraints(
        minHeight: 50.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 1),
        ),
      ),
      child: child,
    );

    return InkWell(
      onTap: onTap,
      child: child,
    );
  }

  Widget buildArrow() {
    if ((onTap != null)) {
      return const Padding(
        padding: EdgeInsets.only(left: 8),
        child: Icon(Icons.arrow_forward_ios,size: 17,color: Colors.black26),
      );
    } else {
      return const Padding(padding: EdgeInsets.zero);
    }
  }
}

