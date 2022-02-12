import 'package:new_hackathon/app_theme.dart/extension_utils.dart';
import 'package:new_hackathon/app_theme.dart/text_theme.dart';
import 'package:new_hackathon/app_theme.dart/them_colors.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';

class GraphScreen extends StatefulWidget {
  static const routeName = '/graph-screen';
  const GraphScreen({Key? key}) : super(key: key);

  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColor.whirlPoolGreen,
      appBar: AppBar(
        backgroundColor: ThemeColor.mintChiffon,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
                child: Column(children: [
                  SizedBox(
                      height: 300,
                      child: PieChart(
                        dataMap: dataMap,
                        animationDuration: const Duration(milliseconds: 800),
                        chartLegendSpacing: 32,
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        colorList: const [
                          Colors.red,
                          Colors.green,
                          Colors.blue,
                          Colors.pink,
                          ThemeColor.whirlPoolGreen
                        ],
                        initialAngleInDegree: 0,
                        chartType: ChartType.disc,
                        ringStrokeWidth: 50,
                        centerText: "Budget",
                        legendOptions: const LegendOptions(
                          showLegendsInRow: false,
                          legendPosition: LegendPosition.right,
                          showLegends: true,
                          legendShape: BoxShape.circle,
                          legendTextStyle: TextStyle(
                            color: ThemeColor.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        chartValuesOptions: const ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: false,
                          showChartValuesOutside: false,
                          decimalPlaces: 1,
                        ),
                        // gradientList: ---To add gradient colors---
                        // emptyColorGradient: ---Empty Color gradient---
                      )),
                  20.verticalSpace,
                  Row(
                    children: [
                      20.horizontalSpace,
                      Column(children: const [
                        Text('18.47%', style: kt20Black),
                        Text(
                          'Saving rate',
                        ),
                      ]),
                      const Spacer(),
                      Column(children: const [
                        Text('70K', style: kt20Black),
                        Text(
                          'Saving ',
                        ),
                      ]),
                      const Spacer(),
                      Column(children: const [
                        Text('187K', style: kt20Black),
                        Text(
                          'Grand total',
                        ),
                      ]),
                      20.horizontalSpace,
                    ],
                  )
                ]),
                height: 400,
                width: double.infinity,
                color: ThemeColor.white)
          ],
        ),
      ),
    );
  }

  Map<String, double> dataMap = {
    "STATE HOUSE OPERATIONS ": 50,
    "NIGERIA EXTRACTIVE  ": 20,
    "MISCELLANEOUS": 20,
    "ALLOWANCES": 10,
  };
}
