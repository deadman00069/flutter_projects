class Task
{
  final String title;
  bool isDone;
  Task({this.title,this.isDone=false});
  toggleDone(){
    isDone=!isDone;
  }
}