import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoe/model/task_data.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return GestureDetector(
          onLongPress: () {
            print('yoo');
            Provider.of<TaskData>(context, listen: false).removeTask(index);
          },
          child: TaskTile(
              title: Provider.of<TaskData>(context).tasks[index].title,
              isCheck: Provider.of<TaskData>(context).tasks[index].isDone,
              checkboxCallBack: (bool checkBoxState) {
                Provider.of<TaskData>(context, listen: false).updateTask(
                    Provider.of<TaskData>(context, listen: false).tasks[index]);
              }),
        );
      },
      itemCount: Provider.of<TaskData>(context).tasks.length,
    );
  }
}

class TaskTile extends StatelessWidget {
  final String title;
  final bool isCheck;
  final Function checkboxCallBack;

  TaskTile({this.title, this.isCheck, this.checkboxCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black,
            decoration:
                isCheck ? TextDecoration.lineThrough : TextDecoration.none),
      ),
      trailing: Checkbox(
        value: isCheck,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
