// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task07/bloc/bloc.dart';
import 'package:task07/bloc/events.dart';
import 'package:task07/bloc/states.dart';
import 'package:task07/helper/const/stringHelper.dart';
import 'package:task07/presentation_layer/views/add_screen.dart';
import 'package:task07/presentation_layer/views/graph_screen.dart';
import 'package:task07/presentation_layer/widgets/button_widget.dart';
import 'package:task07/presentation_layer/widgets/common_appBar.dart';
import 'package:task07/presentation_layer/widgets/inkwell_widget.dart';
import 'package:task07/presentation_layer/widgets/sizedBox.dart';

class MainScreen extends StatefulWidget {
const MainScreen({super.key});

@override
State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
final widgetKey = GlobalKey();
@override
void initState() {
super.initState();
BlocProvider.of<FieldsBloc>(context).add(GetData());
}

@override
Widget build(BuildContext context) {
final bloc = BlocProvider.of<FieldsBloc>(context);
return Scaffold(
    key: widgetKey,
    appBar: PreferredSize(
        child: AppBarWidget(name: StringHelper.MAIN_SCREEN),
        preferredSize: Size.fromHeight(50)),
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            BlocBuilder<FieldsBloc, States>(
              builder: (context, state) {
                if ((state.status == Status.dataAdded ||state.status == Status.updated  ||state.status == Status.addFields  ) &&
                    state.keys != null) {
                  return Expanded(
                    child: ListView.builder(
                        itemCount: state.keys!.length,
                        itemBuilder: (context, index) {
                          var key = state.keys;
                          var data=state.data;
                          return Card(
                            child: InkWell(
                              onLongPress: () async{
                                await menuBar(context, bloc, key, index);
                              },
                              onTap: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>
                                              GraphScreen(data:data![index],name: key[index])));
                                },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15),
                                child: Text(key![index].toString()),
                              ),
                            ),
                          );
                        }),
                  );
                }

                return Container();
              },
            ),
            ButtonWidgets(
                pressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (_) => AddNewScreen())),
                btnTXT: StringHelper.ADD_NEW_LIST)
          ],
        ),
      ),
    ));
}

Future<int?> menuBar(BuildContext context, FieldsBloc bloc, List<dynamic> key, int index) {
return showMenu(
    context: context,
    position: RelativeRect.fromLTRB(200, 150, 100, 100),
    items: [
            PopupMenuItem(
                    value: 1,
                    child:InkwellWidget(
                    pressed: () {
                            Navigator.pop(context);
                            bloc.add(
                                  Deleteitem(
                                  delteItemName:key[index])
                                              ); 
                                    },
                            txt: StringHelper.DELETE),),
                            
            PopupMenuItem(
                        value: 2,
                        child:InkwellWidget(
                              pressed: () {
                              Navigator.pop(context);
                              bloc.add(
                                  UpdateData(
                                      contxt: context,
                                       index: index,
                                      name: key[index]));
                                            },
                                  txt: StringHelper.EDIT),
                                      ),
                                ],
                             elevation: 8.0,
                             );
}
}
