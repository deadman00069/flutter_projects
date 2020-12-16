import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:heavy_bucket/constants/states_name.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  String selectedValue='loda';

  List<DropdownMenuItem> items = [];

  void loadData() {
    for (int i = 0; i < state.length; i++) {
      items.add(
        DropdownMenuItem(
          child: Text(state[i]),
          value: state[i],
        ),
      );
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SearchableDropdown.single(
              items: items,
              value: selectedValue,
              hint: "Select one",
              searchHint: "Select one",
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                  print(selectedValue);
                });
              },
              isExpanded: true,
            ),
            SizedBox(height: 100,),
            Text(selectedValue),
          ],
        ),
      ),
    );
  }
}
