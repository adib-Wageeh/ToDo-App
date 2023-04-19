import 'package:flutter/material.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/styles.dart';

class ShowBottomSheet extends StatelessWidget {

  final Function() onEditTabbed;
  final Function() onDeleteTabbed;
  const ShowBottomSheet({required this.onEditTabbed,required this.onDeleteTabbed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 200,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 24.0),
              child: Text("Manage List",style: Styles.textStyle20),
            ),
            const SizedBox(height: 20,),
            InkWell(
              onTap: onEditTabbed,
              child: SizedBox(
                height: 50,
                child: Row(
                  children:  [
                    const Icon(Icons.edit,color: Assets.bottomModalIconsColor,size: 32),
                    const SizedBox(width: 36,),
                    Text("RENAME",style: Styles.textStyle16.copyWith(color: Colors.white),)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: onDeleteTabbed,
              child: SizedBox(
                height: 50,
                child: Row(
                  children:  [
                    const Icon(Icons.delete,color: Colors.redAccent,size: 32),
                    const SizedBox(width: 36,),
                    Text("DELETE",style: Styles.textStyle16.copyWith(color: Colors.redAccent.shade200),)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}