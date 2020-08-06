import 'package:flutter/material.dart';

class CircleCheckbox extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color activeColor;
  final Color checkColor;
  final bool tristate;
  final MaterialTapTargetSize materialTapTargetSize;

  CircleCheckbox({
    Key key,
    @required this.value,
    this.tristate = false,
    @required this.onChanged,
    this.activeColor,
    this.checkColor,
    this.materialTapTargetSize,
  })  : assert(tristate != null),
        assert(tristate || value != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: Checkbox.width,
        height: Checkbox.width,
        child: Container(
          decoration: new BoxDecoration(
            border: Border.all(
                width: 0,
                color: Theme.of(context).unselectedWidgetColor ??
                    Theme.of(context).disabledColor),
            borderRadius: new BorderRadius.circular(100),
            color: Colors.red
          ),
          child: Checkbox(
            value: value,
            tristate: tristate,
            onChanged: onChanged,
            activeColor: activeColor,
            checkColor: checkColor,
            materialTapTargetSize: materialTapTargetSize,
          ),
        ),
      ),
    );
  }
}