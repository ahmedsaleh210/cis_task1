import 'package:cis_task1/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppLayoutStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get (context) => BlocProvider.of(context);
  List<DateTime> daysInMonth = [];
  List<bool> isSelected = [];

  void getDate() {
    DateTime now = DateTime.now();
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    DateTime today = now;
    for(int i =now.day;i<=lastDayOfMonth.day;i++){
      daysInMonth.add(today);
      today = today.add(const Duration(days: 1));
      isSelected.add(false);
    }
  }

  String? buttonValue;
  void buttonsToggle(value)
  {
    if (buttonValue!=value) {
      buttonValue = value;
      emit(ButtonsToggle());
    }
  }
  void dateToggle(index)
  {
    for(int i=0;i<isSelected.length;i++)
    {
      isSelected[i] = false;
    }
    isSelected[index] = !isSelected[index];
    emit(DateToggle());
  }
}

