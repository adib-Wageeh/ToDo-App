import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import '../../../../../core/utils/assets.dart';
import '../../features/List_details/viewmodel/toDo_bloc/todo_cubit.dart';
import '../../features/homepage/model/date.dart';
import '../../features/homepage/presentation/viewModel/dates_bloc/dates_cubit.dart';

class GlobalFunctions {

  static Future<DateTime?> bottomDateChanger({required BuildContext context,
      Date? dateObject}) async {
    return await DatePicker.showDatePicker(context,
        showTitleActions: true,
        minTime: DateTime(2018, 3, 5),
        maxTime: DateTime.now().copyWith(year: DateTime
            .now()
            .year + 100),
        theme: const DatePickerTheme(
            headerColor: Assets.floatingActionButtonColor,
            backgroundColor: Assets.listItemColor,
            itemStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18),
            doneStyle:
            TextStyle(color: Colors.white, fontSize: 16)),
        onChanged: (date) {},
        onConfirm: (date) {
      if(dateObject == null){
        BlocProvider.of<DatesCubit>(context).addDate(Date(dateTime: date,tasks: []));
      }else {
        BlocProvider.of<DatesCubit>(context).editDate(dateObject, date);
        Navigator.of(context).pop();
      }
        },
        currentTime: (dateObject?.dateTime) ??DateTime.now(),
        locale: LocaleType.en);
  }


  static bottomAddTodo(BuildContext context,Date date){

    GlobalKey<FormState> formState= GlobalKey<FormState>();
   return showModalBottomSheet(
        isScrollControlled: true,
        context: context, builder: (context) {
      String text = "";
      return Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Form(
          key: formState,
          onChanged: (){
            if(formState.currentState!.validate()){
              formState.currentState!.save();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
                child: TextFormField(
                  onSaved: (txt){
                    text = txt??"";
                  },
                  validator: (txt){
                    if(txt!.isEmpty){
                      return "please Enter valid text";
                    }
                  },
                ),
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Assets.floatingActionButtonColor),
                  onPressed: () {
                    if(formState.currentState!.validate()) {
                      formState.currentState!.save();

                      BlocProvider.of<TodoCubit>(context).addToDo(
                          date, text);
                      Navigator.of(context).pop();

                    }
                  }, child: const Text("Add Activity")),
              const SizedBox(height: 10,)
            ],
          ),
        ),
      );
    });


  }



}