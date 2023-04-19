import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/database.dart';
import '../../../model/date.dart';
part 'dates_state.dart';

class DatesCubit extends Cubit<DatesState> {
  DatesCubit({required this.db}) : super(DatesInitial());

  Database db;

  void getDates()async{

    emit(DatesLoading());
   final result = await db.getDates();

   result.fold((error) => emit(DatesError(error: error))
       , (List<Date> right) {
        if(right.isEmpty){
          emit(DatesInitial());
        }else{
         emit(DatesLoaded(dates: right));
       }}
         );

  }

  void addDate(Date date)async{

    emit(DatesLoading());
    final result = await db.addDate(date);
    if(result != null){
      emit(DatesError(error: result));
    }
    getDates();
  }


  void deleteDate(Date date)async{

    emit(DatesLoading());
    final result = await db.deleteDate(date);
    if(result != null){
      emit(DatesError(error: result));
    }
    getDates();
  }

  void editDate(Date date,DateTime dateTime)async{

    emit(DatesLoading());
    final result = await db.editDate(date,dateTime);
    if(result != null){
      emit(DatesError(error: result));
    }
    getDates();
  }

}
