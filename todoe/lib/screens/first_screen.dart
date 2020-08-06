import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todoe/model/task_data.dart';
import 'add_task_screen.dart';
import 'package:todoe/widgets/custom_list_tile.dart';
import 'package:provider/provider.dart';

class StartingScreen extends StatelessWidget {
  final bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff63C9FE),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff63C9FE),
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: AddTaskScreen(),
                  ),
                );
              });
        },
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 64.0,
                left: 16.0,
                bottom: 32.0,
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 32.0,
                      child: Icon(
                        Icons.menu,
                        size: 32.0,
                        color: Color(0xff63C9FE),
                      ),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'Todoey',
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      '${Provider.of<TaskData>(context).taskCount} Tasks',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(16.0),
                  ),
                  color: Colors.white,
                ),
                child: TaskList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
