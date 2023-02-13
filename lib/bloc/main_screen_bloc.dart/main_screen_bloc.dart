// ignore_for_file: prefer_const_constructors, use_rethrow_when_possible, unused_local_variable, non_constant_identifier_names

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_events.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_states.dart';
import 'package:task07/repository/hive_repo_implement.dart';

class MainScreenBloc extends Bloc<MainScreenEvents,MainScreenStates>{
  AddDataRepo add_repo=AddDataRepo();
  List<dynamic>? data;
  MainScreenBloc():super(MainScreenStates()){
    on<GetData>(_getData);
    on<Deleteitem>(_delete);
    on<UpdateData>(_update);
  }

 Future<void> _update(UpdateData event, Emitter<MainScreenStates> emit) async{
    try {
        add_repo.updateItems(event.index, event.name);
        data = add_repo.getData();
      emit(
        state.copyWith(
          dataUpdated: true,
          data: data!.elementAt(0),
          keys: data!.elementAt(1)
        )
      );
      
    } catch (e) {
      throw e;
    }
  }

 Future<void> _delete(Deleteitem event, Emitter<MainScreenStates> emit) async{
    try {
      add_repo.deleteData(event.delteItemName);
      data = add_repo.getData();
      emit(
        state.copyWith(
          dataUpdated: true,
          data: data!.elementAt(0),
          keys: data!.elementAt(1)
        )
      );
    } catch (e) {
      throw e;
    }
  }
  Future<void> _getData(GetData event, Emitter<MainScreenStates> emit) async{
    try {
     data = add_repo.getData();
     emit(
      state.copyWith(
        dataUpdated: true,
        data: data!.elementAt(0),
        keys: data!.elementAt(1)
      )
     );
    } catch (e) {
      throw e;
    }
  }
}