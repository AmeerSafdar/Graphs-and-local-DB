  // ignore_for_file: sort_child_properties_last, prefer_const_constructors, must_be_immutable, unused_import, import_of_legacy_library_into_null_safe, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_local_variable

  import 'package:d_chart/d_chart.dart';
  import 'package:flutter/material.dart';
  import 'package:task07/helper/const/colorsHelper.dart';
  import 'package:task07/helper/const/commonkeys.dart';
  import 'package:task07/helper/const/stringHelper.dart';
  import 'package:task07/presentation_layer/widgets/common_appBar.dart';
  import 'package:task07/helper/extension/string_extension.dart';
  import 'package:task07/presentation_layer/widgets/sizedBox.dart';
  class GraphScreen extends StatelessWidget {
    List data;
    String name;
    GraphScreen({
      Key? key,
      required this.data,
      required this.name
      }) : super(key: key);
    @override
    Widget build(BuildContext context) {
      Size size=MediaQuery.of(context).size;
      return Scaffold(
        appBar: PreferredSize(
          child: AppBarWidget(name: StringHelper.GRAPH_SCREEN), 
          preferredSize: Size.fromHeight(50)
          ),
          body: SafeArea(
            child: Column(
              children: [
                SizeBoxWidget(),
                Container(
                  child: Text(name).uppaerCase().textStyle(),
                ),
                Container(
                padding: EdgeInsets.all(15),
                  height: size.height/2,
                  child: chartBar(),
                ),
              ],
            ),
          ),
      );
    }

    DChartBar chartBar() {
      return DChartBar(
                  data: [
                      {
                  CommonKeys.ID: CommonKeys.BAR,
                    CommonKeys.DATA_KEY: [
                      {CommonKeys.DOMAIN: data[0], CommonKeys.MEASURE: num.parse(data[0])},
                      {CommonKeys.DOMAIN: data[1], CommonKeys.MEASURE: num.parse(data[1])},
                      {CommonKeys.DOMAIN: data[2], CommonKeys.MEASURE: num.parse(data[2])},
                      {CommonKeys.DOMAIN: data[3], CommonKeys.MEASURE: num.parse(data[3])},
                      {CommonKeys.DOMAIN: data[4], CommonKeys.MEASURE: num.parse(data[4])},
                  ],
                      },
                  ],
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: ColorsHelper.BLUE_COLOR,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => ColorsHelper.GREEN_COLOR,
                  showBarValue: true,
              );
    }
  }