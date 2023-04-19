import 'package:flutter/material.dart';
import '../../core/utils/assets.dart';

class FloatingButtonWidget extends StatelessWidget {

  final String title;
  final Function(BuildContext context) onTab;
  const FloatingButtonWidget({required this.onTab,required this.title,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0,right: 8),
      child: Container(
        width: 130,
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(32)
            ,color: Assets.floatingActionButtonColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: ()=>onTab(context),
            borderRadius: BorderRadius.circular(32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:   [
                const Icon(Icons.add,color: Assets.floatingActionButtonTextColor),
                const SizedBox(width: 5,),
                Text(title,style: const TextStyle(color: Assets.floatingActionButtonTextColor),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
