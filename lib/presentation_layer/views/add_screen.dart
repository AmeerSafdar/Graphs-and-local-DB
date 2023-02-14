// ignore_for_file: unused_field, must_be_immutable, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, prefer_const_constructors_in_immutables, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task07/bloc/add_screen_bloc.dart/add_screen_bloc.dart';
import 'package:task07/bloc/add_screen_bloc.dart/add_screen_event.dart';
import 'package:task07/bloc/add_screen_bloc.dart/add_screen_states.dart';
import 'package:task07/bloc/main_screen_bloc.dart/main_screen_bloc.dart';
import 'package:task07/helper/const/dimension.dart';
import 'package:task07/helper/const/stringHelper.dart';
import 'package:task07/helper/extension/snackbar_helper.dart';
import 'package:task07/presentation_layer/views/main_screen.dart';
import 'package:task07/presentation_layer/widgets/button_widget.dart';
import 'package:task07/presentation_layer/widgets/common_appBar.dart';
import 'package:task07/presentation_layer/widgets/input_fields.dart';
import 'package:task07/helper/extension/validation_helper.dart';
import 'package:task07/presentation_layer/widgets/sizedBox.dart';

class AddNewScreen extends StatefulWidget {
  AddNewScreen({super.key});

  @override
  State<AddNewScreen> createState() => _AddNewScreenState();
}

class _AddNewScreenState extends State<AddNewScreen> {
  final _formGlobalKey = GlobalKey<FormState>();
  TextEditingController listNameController = TextEditingController();
  TextEditingController controller = TextEditingController();
  List<TextEditingController> controllers = [];
  List<Widget> fields = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllers.removeRange(0, controllers.length);
    fields.removeRange(0, fields.length);
    listNameController.text = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final bloc = BlocProvider.of<AddScreenBloc>(context);
    final mainBloc = BlocProvider.of<MainScreenBloc>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(Dimensions.D_50),
          child: AppBarWidget(
            name: StringHelper.ADD_SCREEN,
          )),
      body: BlocConsumer<AddScreenBloc, AddScreenStates>(
        listener: (context, state) {
          if (state.dataAdded == true) {
                buildSnackbar(context, StringHelper.SUCCESS);
                Navigator.pop(context);
              }
        },
      builder: (context, state) {
        return SafeArea(
          child: Form(
            key: _formGlobalKey,
            child: Padding(
              padding: EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
              child: Center(
                child: Column(
                  children: [
                    TextFieldWidget(
                        type: TextInputType.name,
                        hintText: StringHelper.ENTER_LIST_NAME,
                        textEditingController: listNameController,
                        validator:(val)=>'$val'.isRequired() ? null : StringHelper.REQ_FIELD
                        ),

                    SizeBoxWidget(),

                    ButtonWidgets(
                        pressed: () {
                          TextEditingController _controllers =TextEditingController();
                          if (fields.length < 5) {
                            controllers.add(_controllers);
                            var text_field = fields.add(
                              TextFieldWidget(
                              hintText:'${StringHelper.NUMBER} ${controllers.length}',
                              textEditingController: _controllers,
                              type: TextInputType.number,
                              validator: (val)=>'$val'.isRequired() ? null : StringHelper.REQ_FIELD
                            )
                            );
                          }
                          bloc.add(AddFields());
                        },
                        btnTXT: StringHelper.ADD_NEW_VALUE
                        ),
                       

                    if (state.fieldsAdded == true)
                      Expanded(
                        child: ListView.builder(
                            itemCount: fields.length,
                            itemBuilder: ((context, index) {
                              return Container(
                                margin: EdgeInsets.all(Dimensions
                                    .PADDING_SIZE_EXTRA_SMALL),
                                child: fields[index],
                              );
                            })),
                      ),
                    if(state.fieldsAdded != true)
                      Expanded(child: Container()),
                    
                     ButtonWidgets(
                        btnTXT: StringHelper.DONE,
                        pressed: () {
                          if (_formGlobalKey.currentState!.validate() && controllers.length ==5) {
                            bloc.add(
                              AddData(
                                controllers: controllers,
                                listName: listNameController.text,
                                mainBloc:mainBloc
                                ));
                                }
                                if (controllers.length!=5) {
                                  buildSnackbar(context, StringHelper.ADD_NEW_VALUE);
                                }
                                },
                            ),

                    
                      
                  ],
                ),
              ),
            ),
          ),
        );
      }
)
      );
  }
}
