import 'package:flutter/material.dart';
import '../../../model/date.dart';
import 'DateItemWidget.dart';

class DatesListView extends StatelessWidget {

  final List<Date> dates;
  const DatesListView({required this.dates,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ListView.separated(itemBuilder: (context,index){
        return ListItemWidget(date: dates[index],);
      }, separatorBuilder: (context,index){
       return const SizedBox(height: 10,);
      },
      itemCount: dates.length,
      ),
    );
  }
}
