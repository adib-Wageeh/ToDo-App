import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/styles.dart';

class NoActivityWidget extends StatelessWidget {
  const NoActivityWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(detailsDatePageText1,style: Styles.textStyle18,),
        const SizedBox(height: 20,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width*0.14),
          child: const Text(detailsDatePageText2,style: Styles.textStyle16,textAlign: TextAlign.center),
        ),
        Text("activities!",style: Styles.textStyle16.copyWith(color: Colors.white),),
      ],
    );
  }
}
