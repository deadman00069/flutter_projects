import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoe/model/task_data.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTextTitle;
    return Container(
      height: 300.0,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 32.0,
            ),
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff63C9FE),
                fontSize: 32.0,
              ),
            ),
            TextField(
              textAlign: TextAlign.center,
              onChanged: (newValue) {
                newTextTitle = newValue;
              },
              decoration: InputDecoration(
                hintText: 'Type here',
                hintStyle: TextStyle(
                  color: Colors.black12,
                ),
              ),
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.0,
              ),
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                /*...*/
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTextTitle);
                Navigator.pop(context);
              },
              child: Text(
                "Add",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
