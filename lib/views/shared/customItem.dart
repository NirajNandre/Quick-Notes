import 'package:flutter/material.dart';
import 'package:quicknotes/views/shared/appstyle.dart';
class CustomItem extends StatefulWidget {
  final String label;
  final bool isToggleOn;
  final Function(bool) onToggle;

  const CustomItem({
    Key? key,
    required this.label,
    required this.isToggleOn,
    required this.onToggle,
  }) : super(key: key);

  @override
  State<CustomItem> createState() => _CustomItemState();
}

class _CustomItemState extends State<CustomItem> {
  bool _isToggleOn = false;

  @override
  void initState() {
    super.initState();
    _isToggleOn = widget.isToggleOn;
  }

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(widget.label, style: appstyle(15, Colors.black, FontWeight.w400),),
      trailing: Switch(
        value: _isToggleOn,
        onChanged: (value) {
          setState(() {
            _isToggleOn = value;
          });
          widget.onToggle(value);
        },
      ),
    );
  }
}