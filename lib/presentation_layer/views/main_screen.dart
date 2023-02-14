// ignore_for_file: sort_child_properties_last, prefer_const_constructors, unused_local_variable, unnecessary_string_interpolations, prefer_collection_literals, unused_field

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
import 'package:task07/presentation_layer/widgets/text_widget.dart';

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
  RenderObject? overlay;
  Offset _tapPosition = Offset.zero;
  
  void _getTapPosition(TapDownDetails details) {
    final RenderBox referenceBox = context.findRenderObject() as RenderBox;
    _tapPosition = referenceBox.globalToLocal(details.globalPosition);
     overlay =Overlay.of(context)?.context.findRenderObject();
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
                if ((state.dataUpdated==true) && state.keys != null) {
                   return Expanded(
                    child: ListView.builder(
                        itemCount: state.keys!.length,
                        itemBuilder: (context, index) {
                          var key = state.keys;
                          var data=state.data;
                          return Card(
                            child: InkWell(
                              onTapDown: (details) => _getTapPosition(details),
                              onLongPress: () async{
                               overlay =Overlay.of(context)?.context.findRenderObject();
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
                                    child: TextWidget(txt:key![index].toString()
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
    position: RelativeRect.fromRect(
            Rect.fromLTWH(_tapPosition.dx, _tapPosition.dy, 30, 30),
            Rect.fromLTWH(0, 0, overlay!.paintBounds.size.width,
                overlay!.paintBounds.size.height)),
    items: [
            PopupMenuItem(
                    onTap: () {
                        bloc.add(Deleteitem(delteItemName:key[index])); 
                    },
                    value: 1,
                    child:TextWidget(txt: StringHelper.DELETE)
                            ),
                            
            PopupMenuItem(
                        onTap: () async{
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
                        value: 2,
                        child:TextWidget(txt: StringHelper.EDIT)
                                      ),
                                ],
                             elevation: Dimensions.D_8,
                             );
}
}
