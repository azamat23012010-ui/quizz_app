import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
part 'settings_cubit_state.dart';

class SettingsCubitCubit extends Cubit<SettingsCubitState> {
  SettingsCubitCubit() : super(SettingsCubitInitial());
}
