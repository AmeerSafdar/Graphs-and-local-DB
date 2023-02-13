// ignore_for_file: prefer_const_constructors, use_rethrow_when_possible, unused_local_variable, non_constant_identifier_names, unused_element

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task07/bloc/add_screen_bloc.dart/add_screen_event.dart';
import 'package:task07/bloc/add_screen_bloc.dart/add_screen_states.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_events.dart';
import 'package:task07/repository/hive_repo_implement.dart';

class AddScreenBloc extends Bloc<AddScreenEvents,AddScreenStates>{
  AddDataRepo add_repo=AddDataRepo();
  AddScreenBloc():super(AddScreenStates()){
    on<AddData>(_addData);
    on<AddFields>(_addFields);
  }

Future<void> _addData(AddData event , Emitter<AddScreenStates> emit) async{
    try {
        add_repo.addHiveData(event.listName, event.controllers);
        emit(
          state.copyWith(
            dataAdded: true,
            fieldsAdded: false
          )
        );
        event.mainBloc.add(GetData());
        
    } catch (e) {
        throw e;
    }
  }

 void _addFields(AddFields event , Emitter<AddScreenStates> emit){
     try{
         emit(
          state.copyWith(
            fieldsAdded: true,
            dataAdded: false
          )
          );
         }
         catch(err){
           throw err;
         }
  }
}