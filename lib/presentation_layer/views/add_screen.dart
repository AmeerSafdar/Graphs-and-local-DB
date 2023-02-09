  // ignore_for_file: unused_field, must_be_immutable, prefer_final_fields, prefer_const_constructors, sized_box_for_whitespace, unused_local_variable, prefer_const_constructors_in_immutables

  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';
  import 'package:task07/bloc/bloc.dart';
  import 'package:task07/bloc/events.dart';
  import 'package:task07/bloc/states.dart';
  import 'package:task07/helper/const/constants.dart';
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

    @override
    void initState() {
      super.initState();
    }
    @override
    void dispose() {
      Constants.control.controllers.removeRange(0, Constants.control.controllers.length);
      Constants.control.fields.removeRange(0,Constants.control.fields.length);
      Constants.control.listTextEditing.text='';
      super.dispose();
    
    }

    @override
    Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      final bloc = BlocProvider.of<FieldsBloc>(context);
      return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              name: StringHelper.ADD_SCREEN,
            )),
        body: BlocListener<FieldsBloc, States>(
          listener: (context, state) {
            if (state.status == Status.dataAdded) {
            buildSnackbar(context, StringHelper.SUCCESS);
            }
          },
          child: SafeArea(
            child: Form(
              key: _formGlobalKey,
              child: Padding(
                padding: const EdgeInsets.all(13.0),
                child: Center(
                  child: BlocBuilder<FieldsBloc, States>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          TextFieldWidget(
                              type: TextInputType.name,
                              hintText: StringHelper.ENTER_LIST_NAME,
                              textEditingController: Constants.control.listTextEditing,
                              validator: (val) => '$val'.isRequired()
                                  ? null
                                  : StringHelper.REQ_FIELD),
                          SizeBoxWidget(),
                          ButtonWidgets(
                              pressed: () {
                                TextEditingController controller =
                                    TextEditingController();
                                bloc.add(AddFields(controler: controller));
                              },
                              btnTXT: StringHelper.ADD_NEW_VALUE),
                          if (state.status == Status.addFields)
                            Expanded(
                              child: ListView.builder(
                                  itemCount: Constants.control.fields.length,
                                  itemBuilder: ((context, index) {
                                    return Container(
                                      margin: EdgeInsets.all(5),
                                      child: Constants.control.fields[index],
                                    );
                                  })),
                            ),
                          if (state.status == Status.addFields && Constants.control.fields.length==5 )
                            ButtonWidgets(
                              btnTXT: StringHelper.DONE,
                              pressed: () {
                                if (_formGlobalKey.currentState!.validate()) {
                                  bloc.add(AddData());
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>MainScreen()));
                                  
                                }
                              },
                            )
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
