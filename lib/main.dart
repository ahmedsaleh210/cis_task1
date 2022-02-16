import 'package:cis_task1/cubit/cubit.dart';
import 'package:cis_task1/cubit/states.dart';
import 'package:cis_task1/modules/screen_1.dart';
import 'package:cis_task1/shared/BlocObserver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(
        () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return AppCubit()
          ..getDate();
      },
      child: BlocConsumer<AppCubit,AppLayoutStates>(
        listener: (context,state) {},
       builder: (context,state) {
         return MaterialApp(
           debugShowCheckedModeBanner: false,
           home: FirstScreen(),
         );
       },
      ),
    );
  }
}


