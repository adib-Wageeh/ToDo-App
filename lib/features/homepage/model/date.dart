import 'package:hive_flutter/hive_flutter.dart';

part 'date.g.dart';
@HiveType(typeId: 0)
class Date extends HiveObject{

  @HiveField(0)
  DateTime dateTime;

  @HiveField(1)
  List<Task> tasks;

  Date({required this.dateTime,required this.tasks});

  String getDateString(DateTime dateTime){

    return "${dateTime.year}/${dateTime.month}/${dateTime.day}";
  }
  void date(DateTime date){
    dateTime = date;
  }

}

@HiveType(typeId: 1)
class Task extends HiveObject{

  @HiveField(0)
  String taskName;
  @HiveField(1)
  bool isDone;

  Task({required this.isDone,required this.taskName});
}