import 'package:flutter/material.dart';
import 'package:to_do_1/core/utils/database.dart';
import 'package:to_do_1/features/List_details/viewmodel/toDo_bloc/todo_cubit.dart';
import 'features/homepage/model/date.dart';
import 'features/homepage/presentation/view/homepage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/homepage/presentation/viewModel/dates_bloc/dates_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DateAdapter());
  Hive.registerAdapter(TaskAdapter());
  await Hive.openBox("MyBox");
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<DatesCubit>(
        create: (context) =>
        DatesCubit(db: Database.getInstance())
          ..getDates(),

      ),
          BlocProvider<TodoCubit>(
  create: (context) => TodoCubit(db: Database.getInstance())),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff1E1E1E)
      ),
      home: const HomePage(),
    ),
  ));
}
