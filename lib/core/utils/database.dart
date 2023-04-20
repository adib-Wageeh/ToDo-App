import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_1/features/homepage/model/date.dart';

class Database{

static Database? _database;
Database._();

factory Database.getInstance(){
  return _database??=Database._();
}

Future<Box> _openBox()async{
  return Hive.box("MyBox");
}

Future<Either<String,List<Date>>> getDates()async{

  List<Date> dates=[];
  try{
    Box db = await _openBox();
    for(int x=0;x<db.length;x++){

        dates.add(db.getAt(x));
      }
    dates.sort((a,b)=>b.dateTime.compareTo(a.dateTime));

  }on HiveError catch(e){
    return Left(e.message);
  }
  return Right(dates);
}

Future<dynamic> addDate(Date date)async{

  try{
    Box db = await _openBox();
    await db.add(date);
  }on HiveError catch(e){
   return e.message;
  }
}

Future<dynamic> deleteDate(Date date)async{

  try{
    Box db = await _openBox();
    await db.delete(date.key);
  }on HiveError catch(e){
    return e.message;
  }
}

Future<dynamic> editDate(Date date,DateTime dateTime)async{

  try{
    Box db = await _openBox();
    date.date(dateTime);
    await db.put(date.key,date);
  }on HiveError catch(e){
    return e.message;
  }
}

Future<dynamic> toggleDoneState(Date date,int taskIndex)async{
  try{
    Box db = await _openBox();
    date.tasks[taskIndex].isDone= !(date.tasks[taskIndex].isDone);
    await db.put(date.key,date);
  }on HiveError catch(e){
    return e.message;
  }
}

Future<Either<String,Date>> getToDos(Date date)async{

  late Date newDate;
  try {
    Box db = await _openBox();
    newDate = db.get(date.key);
    List<Date> dates =[];

  }catch(e){
    return Left(e.toString());
  }

return Right(newDate);
}


Future<void> addToDo(Date date,String task)async{

  Task newTask = Task(isDone: false, taskName: task);
  try {
    Box db = await _openBox();
    date.tasks.add(newTask);
    await db.put(date.key,date);
  }catch(e){
    debugPrint(e.toString());
  }
}

Future<Either<String, Date>> deleteTodo(Date date,Task task)async{

  try{
    Box db = await _openBox();
    List<Task> oldTasks =[];
    for(int x=0;x<date.tasks.length;x++){
      if(date.tasks[x] != task){
        oldTasks.add(date.tasks[x]);
      }
    }
    date.tasks = oldTasks;
    await db.put(date.key,date);
    return Right(date);
  }on HiveError catch(e){
    return Left(e.message);
  }
}

Future<Either<String, Date>> editTodo(Date date,int taskIndex,String text)async{

  try {
    Box db = await _openBox();
    date.tasks[taskIndex].taskName = text;
    await db.put(date.key,date);
    return Right(date);
  }catch(e){
    return Left(e.toString());
  }

}

int getTaskIndex(Date date,Task task){

  int index=-1;
  for(int x=0;x<date.tasks.length;x++) {
    if(task.key == date.tasks[x].key){
      return x;
    }
  }
  return index;
}

}


