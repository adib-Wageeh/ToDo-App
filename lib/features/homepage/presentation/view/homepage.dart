import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_1/features/homepage/presentation/view/widgets/DatesListView.dart';
import 'package:to_do_1/features/global_widgets/floating_button_widget.dart';
import 'package:to_do_1/features/homepage/presentation/view/widgets/no_lists_widget.dart';
import 'package:to_do_1/features/homepage/presentation/viewModel/dates_bloc/dates_cubit.dart';
import '../../../../constants.dart';
import '../../../../core/functions/global_functions.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My TODO Lists")),
      body: SafeArea(
        child: BlocBuilder<DatesCubit,DatesState>(
          builder: (context,state) {
            if(state is DatesLoaded){
             return DatesListView(dates: state.dates,);
            }else if(state is DatesLoading){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is DatesError){
              return Center(child: Text(state.error),);
            }
             return const NoListsWidget();
          }
              ),
            ),
floatingActionButton: FloatingButtonWidget(title: homepageButtonText,onTab: (BuildContext context){
  GlobalFunctions.bottomDateChanger(context: context);
},),
      );

  }
}
