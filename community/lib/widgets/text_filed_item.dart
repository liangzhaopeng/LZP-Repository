import 'package:flutter/material.dart';

class TextFieldItem extends StatelessWidget {
  const TextFieldItem({
    Key? key,
    this.controller,
    required this.title,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.hintText = '',
    this.filedStyle,
    this.align,
    this.focusNode,
  }): super(key: key);

  final TextEditingController? controller;
  final String title;
  final String hintText;
  final bool enabled;
  final TextInputType keyboardType;
  final TextStyle? filedStyle;
  final TextAlign? align;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final Row child = Row(
      children: <Widget>[
        Text(title, style: const TextStyle(fontSize: 15,color: Colors.black87),),
        const SizedBox(width: 16,),
        Expanded(
          child: Semantics(
            label: hintText.isEmpty ? title : hintText,
            child: TextField(
              textAlign: align ?? TextAlign.right,
              enabled: enabled,
              focusNode: focusNode,
              keyboardType: keyboardType,
              // inputFormatters: _getInputFormatters(),
              controller: controller,
              style: filedStyle,
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none, //去掉下划线
                //hintStyle: TextStyles.textGrayC14
              ),
            ),
          ),
        ),
        const SizedBox(width: 8,)
      ],
    );

    return Container(
      height: 50.0,
      // margin: const EdgeInsets.only(left: 16.0),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 1),
        ),
      ),
      child: child,
    );
  }

  // List<TextInputFormatter>? _getInputFormatters() {
  //   if (keyboardType == const TextInputType.numberWithOptions(decimal: true)) {
  //     return <TextInputFormatter>[UsNumberTextInputFormatter()];
  //   }
  //   if (keyboardType == TextInputType.number || keyboardType == TextInputType.phone) {
  //     return <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly];
  //   }
  //   return null;
  // }
}
