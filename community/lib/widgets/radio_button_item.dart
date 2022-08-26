import 'package:flutter/material.dart';

class RadioButtonItem extends StatefulWidget {
  final String title;
  final int groupValue;
  final List <FMRadioModel> datas;
  final ValueChanged? onChange;

  const RadioButtonItem({
    Key? key,
    required this.title,
    this.groupValue = 0,
    required this.datas,
    this.onChange
  }) : super(key: key);

  @override
  State<RadioButtonItem> createState() => _RadioButtonItemState();
}

class _RadioButtonItemState extends State<RadioButtonItem> {

  late int groupValue;

  @override
  initState(){
    super.initState();
    groupValue = widget.groupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
      constraints: const BoxConstraints(
        minHeight: 50.0,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 1),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(widget.title, style: const TextStyle(fontSize: 15,color: Colors.black87),),
          Row(
            children: _buildRows(),
          )
        ],
      ),
    );
  }

  List<Row> _buildRows() {
    List<Row> rows = [];
    for (var element in widget.datas) {
      rows.add(_buildRow(element));
    }
    return rows;
  }

  Row _buildRow(FMRadioModel model) {
    return Row(
      children: [
        _radio(model),
        Text(model.text, style: const TextStyle(fontSize: 15,color: Colors.black54)),
      ],
    );
  }

  Radio _radio(FMRadioModel model){
    return Radio(
      value: model.index,
      groupValue: groupValue,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: Theme.of(context).primaryColor,
      onChanged: (index){
        // print(value);
        if (widget.onChange != null) {
          widget.onChange!(index);
        }
        setState(() {
          groupValue = index;
        });
      },
    );
  }
}
class FMRadioModel extends Object {

  int index;
  String text;

  FMRadioModel(this.index, this.text);
}