// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations, prefer_collection_literals

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_bloc.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_events.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_states.dart';
import 'package:task07/helper/const/commonkeys.dart';
import 'package:task07/helper/const/constants.dart';
import 'package:task07/helper/const/dimension.dart';
import 'package:task07/helper/const/stringHelper.dart';
import 'package:task07/presentation_layer/widgets/button_widget.dart';
import 'package:task07/presentation_layer/widgets/common_appBar.dart';
import 'package:task07/presentation_layer/widgets/inkwell_widget.dart';

class MainScreen extends StatefulWidget {
const MainScreen({super.key});

@override
State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

@override
void initState() {

super.initState();
BlocProvider.of<MainScreenBloc>(context).add(GetData());

}

@override
Widget build(BuildContext context) {
final bloc = BlocProvider.of<MainScreenBloc>(context);

return Scaffold(
    key: widgetKey,
    appBar: PreferredSize(
        child: AppBarWidget(name: StringHelper.MAIN_SCREEN),
        preferredSize: Size.fromHeight(Dimensions.D_50)),
    body: SafeArea(
      child: Padding(
        padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
        child: Column(
          children: [
            BlocBuilder<MainScreenBloc, MainScreenStates>(
              builder: (context, state) {
                if ((state.dataUpdated==true ) && state.keys != null) {
                   return Expanded(
                    child: ListView.builder(
                        itemCount: state.keys!.length,
                        itemBuilder: (context, index) {
                          var key = state.keys;
                          var data=state.data;
                          return Card(
                            child: InkWell(

                              onLongPress: () async{
                                await menuBar(context, bloc, key, index, key[index]);
                              },

                              onTap: () {
                                map[CommonKeys.DATA_KEY] = data![index];
                                map[CommonKeys.NAME_KEY] = key[index];
                                Navigator.of(context).pushNamed('/graphScreen',arguments: map);
                                },

                              child: Padding(
                                padding:  EdgeInsets.symmetric(
                                    horizontal:Dimensions.PADDING_SIZE_DEFAULT, vertical: Dimensions.PADDING_SIZE_DEFAULT),
                                    child: Text(key![index].toString()
                                ),
                              ),
                            ),
                          );
                        }
                        ),
                  );
                }
                return Expanded(child: Container(),);
              },
            ),

            ButtonWidgets(
                pressed: () => Navigator.of(context).pushNamed('/addScreen'),
                btnTXT: StringHelper.ADD_NEW_LIST
                )
          ],
        ),
      ),
    ));
}

Future<int?> menuBar(BuildContext context, MainScreenBloc bloc, List<dynamic> key, int index,String name) {
return showMenu(
    context: context,
    position: RelativeRect.fromLTRB(200, 150, 100, 100),
    items: [
            PopupMenuItem(
                    value: 1,
                    child:InkwellWidget(
                    pressed: () {
                            Navigator.pop(context);
                            bloc.add(Deleteitem(delteItemName:key[index])); 
                                    },
                            txt: StringHelper.DELETE),
                            ),
                            
            PopupMenuItem(
                        value: 2,
                        child:InkwellWidget(
                              pressed: () async {
                              Navigator.pop(context);
                              String? updatedval=await Future.delayed(Duration.zero,(){
                                    return showDialog(
                                      barrierDismissible: false,
                                      context: context, 
                                     builder: ((context) => dialogUtils.dialogBox(context,name))
                                          );
                                    });
                              if (updatedval !=null ) {
                                  bloc.add(UpdateData(index: index, name: updatedval));
                                  }
                                },
                                  txt: StringHelper.EDIT),
                                      ),
                                ],
                             elevation: Dimensions.D_8,
                             );
}
}
