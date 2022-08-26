import 'package:flutter/material.dart';

class CustomCellRow extends StatefulWidget {
  final String title;
  final String content;
  final Color? contentColor;
  const CustomCellRow({
    Key? key,
    required this.title,
    required this.content,
    this.contentColor
  }) : super(key: key);

  @override
  State<CustomCellRow> createState() => _TransportCellRowState();
}

class _TransportCellRowState extends State<CustomCellRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('${widget.title}：',style: const TextStyle(letterSpacing: 1, fontSize: 16, color: Color(0xff333333)),),
        Expanded(
            child: Text(widget.content, style: TextStyle(fontSize: 16, color: widget.contentColor ?? Color(0xff666666)),)
        ),
      ],
    );
  }
}