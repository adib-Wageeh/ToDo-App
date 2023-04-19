import 'package:flutter/material.dart';
import '../../../../../constants.dart';
import '../../../../../core/utils/assets.dart';
import '../../../../../core/utils/styles.dart';

class NoListsWidget extends StatelessWidget {
  const NoListsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height*0.1),
              child: Image.asset(Assets.imagePath,width: width*0.75),
            ),
          ],
        ),
      const Text(homepageText1,style: Styles.textStyle18,),
      const SizedBox(height: 20,),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.080),
        child: const Text(homepageText2,style: Styles.textStyle16,textAlign: TextAlign.center),
      )
      ],
    );
  }
}
