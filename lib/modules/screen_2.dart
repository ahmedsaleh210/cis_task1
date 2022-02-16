import 'package:cis_task1/cubit/cubit.dart';
import 'package:cis_task1/cubit/states.dart';
import 'package:cis_task1/shared/components.dart';
import 'package:cis_task1/shared/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
DateTime dateTime = DateTime.now();

class SecondScreen extends StatelessWidget {
  final String? name;
  final String? type;
  final String? image;
  const SecondScreen(this.name,this.type,this.image, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocConsumer<AppCubit,AppLayoutStates>(
      listener: (context,state) {},
      builder: (context,state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: bgColor,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: height*0.35,
                backgroundColor: Colors.transparent,
                pinned: false,
                actions: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications)
                      ),
                      const Positioned(
                        right: 11.2,
                        bottom: 34.1,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 5,
                        ),
                      ),
                      const Positioned(
                        right: 12,
                        bottom: 35,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          radius: 4,
                        ),
                      ),
                    ],
                  ),
                ],
                flexibleSpace: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    FlexibleSpaceBar(
                        background: Container(
                          decoration: BoxDecoration(
                            color: appBarColor,
                            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: height*0.03,),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: width*0.03),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: SizedBox(
                                        height: height*0.2,
                                        width: width*0.35,
                                        child: Image.network(image!
                                          ,fit: BoxFit.cover,),),
                                    ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(name!,style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w800,
                                          fontSize: width*0.05
                                      ),),
                                      SizedBox(height: height*0.02,),
                                      Text(type!,style: Theme.of(context).textTheme.caption?.copyWith(
                                          color: Colors.white70,
                                          fontSize: width*0.03
                                      ),),
                                      SizedBox(height: height*0.02,),
                                      SizedBox(
                                        height: height*0.012,
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          itemBuilder: (context,index) => const Padding(
                                            padding: EdgeInsets.symmetric(horizontal: 1.0),
                                            child: Icon(Icons.star,color: Colors.yellow,),
                                          ),
                                          itemCount: 5,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      ),

                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: width*0.05,bottom: height*0.01),
                      child: Container(
                        height: height*0.05,
                        width: width*0.09,
                        decoration: BoxDecoration(
                          color: Colors.white38,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(Icons.location_on,color: Colors.yellow.withOpacity(0.9),size: 30,),
                      ),
                    ),
                  ],
                ),
              ),
              SliverList(delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: height*0.05,left: width*0.05,right: width*0.05,bottom: height*0.025),
                      child: Text(DateFormat('yMMMM').format(dateTime),style: TextStyle(
                          fontSize: width*0.045,
                          fontWeight: FontWeight.w800
                      ),
                      ),
                    ),
                    SizedBox(
                      height: height*0.13,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index) => createDateItems(width,height,cubit.daysInMonth[index],cubit.isSelected[index],context,index),
                          itemCount: cubit.daysInMonth.length),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height*0.04,left: width*0.05,right: width*0.05,bottom: height*0.025),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Morning',style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w800
                          ),
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            children: [
                              customBtn(
                                text: '08:30 AM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='08:30 AM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('08:30 AM');
                                }
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '09:00 AM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='09:00 AM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('09:00 AM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '09:30 AM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='09:30 AM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('09:30 AM');
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            children: [
                              customBtn(
                                text: '10:30 AM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='10:30 AM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('10:30 AM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '11:00 AM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='11:00 AM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('11:00 AM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '11:30 AM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='11:30 AM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('11:30 AM');
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.02,),
                          Text(
                            'Evening',style: TextStyle(
                              fontSize: width*0.045,
                              fontWeight: FontWeight.w800
                          ),
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            children: [
                              customBtn(
                                text: '05:30 PM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='05:30 PM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('05:30 PM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '06:00 PM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='06:00 PM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('06:00 PM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '06:30 PM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='06:30 PM'?true:false,
                                onTap: () {
                                  cubit.buttonsToggle('06:30 PM');

                                },
                              ),
                            ],
                          ),
                          SizedBox(height: height*0.02,),
                          Row(
                            children: [
                              customBtn(
                                text: '07:00 PM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='07:00 PM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('07:00 PM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '07:30 PM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='07:30 PM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('07:30 PM');
                                },
                              ),
                              SizedBox(width: width*0.04,),
                              customBtn(
                                text: '08:00 PM',
                                width: width,
                                height: height,
                                active: cubit.buttonValue=='08:00 PM'?true:false,
                                onTap: () {
                                    cubit.buttonsToggle('08:00 PM');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0,right: 8.0,left: 8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: btnColor
                        ),
                        child: MaterialButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () {  },
                          child: const Text('Make An Appointment',style: TextStyle(
                              color: Colors.white
                          ),),
                        ),
                      ),
                    ),
                  ],
                )
              ]))
            ],
          ),
        );
      }
    );
  }
}

Widget createDateItems(width,height,DateTime now,isSelected,context,index) {
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: width*0.023),
    child: InkWell(
      onTap: () {
        if(AppCubit.get(context).isSelected[index]!=true) {
          AppCubit.get(context).dateToggle(index);
        }
      },
      child: Container(
        height: height*0.13,
        width: width*0.20,
        decoration: BoxDecoration(
          color: isSelected?btnColor:Colors.white,
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
          padding: EdgeInsets.symmetric(vertical: height*0.025),
          child: Column(
            children: [
              Text(DateFormat('EEE').format(now),style: TextStyle(
                  color: isSelected?Colors.white:Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: width*0.04
              ),),
              const Spacer(),
              Text('${now.day}',style: TextStyle(
                  color: isSelected?Colors.white:Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: width*0.04
              ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

