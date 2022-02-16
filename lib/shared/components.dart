import 'package:cis_task1/shared/styles/colors.dart';
import 'package:flutter/material.dart';

Widget customBtn({
  required String text,
  required double width,
  required double height,
  required bool active,
  required Function onTap,
})
{
  return InkWell(
    borderRadius: BorderRadius.circular(10),
    onTap: () {
      onTap();
    },
    child: Container(
      decoration: BoxDecoration(
        color: active?btnColor:Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(.4),
            blurRadius: 2.0, // soften the shadow
            spreadRadius: 0.0,

          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*0.043,vertical: height*0.015),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.lock_clock,
              color: active?Colors.white:Colors.black
              ,
            ),
            const SizedBox(width: 4,),
            Text(
                text,
              style: TextStyle(
                color: active?Colors.white:Colors.black
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void navigateTo(context,widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}