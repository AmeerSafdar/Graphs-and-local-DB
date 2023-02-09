// ignore_for_file: prefer_const_constructors, use_rethrow_when_possible, unused_local_variable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task07/bloc/events.dart';
import 'package:task07/bloc/states.dart';
import 'package:task07/helper/const/constants.dart';
import 'package:task07/repository/hive_repo.dart';

class FieldsBloc extends Bloc<Events,States>{
  AddDataRepo add_repo=AddDataRepo();
  List? data;
  FieldsBloc():super(States()){
    on<AddFields>(_addFields);
    on<AddData>(_addData);
    on<GetData>(_getData);
    on<Deleteitem>(_delete);
    on<UpdateData>(_update);
  }

  _update(UpdateData event, Emitter<States> emit) async{
    try {
      String? updatedval=await Future.delayed(Duration.zero,(){
       return showDialog(
        barrierDismissible: false,
          context: event.contxt, 
          builder: ((context) => Constants.dialogUtils.dialogBox(context, event.name))
          );
      });
      if(updatedval !=null){
        add_repo.updateItems(event.index, updatedval);
        data = await add_repo.getData();
      emit(
        state.copyWith(
          status: Status.updated,
          data: data!.elementAt(0),
          keys: data!.elementAt(1)
        )
      );
      }
    } catch (e) {
      throw e;
    }
  }

  _delete(Deleteitem event, Emitter<States> emit) async{
    try {
      add_repo.deleteData(event.delteItemName);
      data = await add_repo.getData();
      emit(
        state.copyWith(
          status: Status.dataAdded,
          data: data!.elementAt(0),
          keys: data!.elementAt(1)
        )
      );
    } catch (e) {
      throw e;
    }
  }
  _getData(GetData event, Emitter<States> emit) async{
    try {
     data = await add_repo.getData();
     emit(
      state.copyWith(
        status: Status.dataAdded,
        data: data!.elementAt(0),
        keys: data!.elementAt(1)
      )
     );
    } catch (e) {
      throw e;
    }
  }
  _addFields(AddFields event , Emitter<States> emit){
     try{
      if (Constants.control.fields.length<5) {
      var text_field= 
      Constants.textFields(event.controler);    
       Constants.control.controllers.add(event.controler);   
       Constants.control.fields.add(text_field);
      }
         emit(
          state.copyWith(
            status: Status.addFields
          )
          );
         }
         catch(err){
          throw err;
         }
  }

  _addData(AddData event , Emitter<States> emit){
    try {
     if(Constants.control.controllers.length >= 5) {
        add_repo.addHiveData(Constants.control.listTextEditing.text, Constants.control.controllers);
        emit(
          state.copyWith(
            status: Status.dataAdded
          )
          );
        }
    } catch (e) {
      throw e;
    }
  }
}