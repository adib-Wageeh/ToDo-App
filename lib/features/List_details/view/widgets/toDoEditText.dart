import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/features/homepage/model/date.dart';
import '../../../../constants.dart';
import '../../../../core/utils/assets.dart';
import '../../viewmodel/toDo_bloc/todo_cubit.dart';

class ToDoEditText extends StatelessWidget {

  final Date date;
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Task task;
  final int taskIndex;
  const ToDoEditText({required this.taskIndex,required this.task,required this.date,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late String editedText;
    return Padding(
      padding: EdgeInsets.only(bottom: (MediaQuery.of(context).viewInsets.bottom) ),
      child: Container(
        height: 140,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: TextFormField(
                  initialValue: task.taskName,
                  validator: (val){
                    if(val!.isEmpty){
                      return "please enter valid value";
                    }
                  },
                  onSaved: (txt){
                    editedText = txt!;
                  },
                ),
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  _formKey.currentState!.save();
                  BlocProvider.of<TodoCubit>(context).editToDo(date, taskIndex, editedText);
                  Navigator.of(context).pop();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Assets.floatingActionButtonColor

              ), child: const Text(
                  editButtonText
              ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
