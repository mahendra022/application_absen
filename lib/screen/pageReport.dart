import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:line_icons/line_icon.dart';
import 'package:line_icons/line_icons.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PageReport extends StatefulWidget {
  @override
  _PageReportState createState() => _PageReportState();
}

List<GDPData> getChartData() {
  final List<GDPData> chartData = [
    GDPData('Hadir', 15, Colors.cyan[600]),
    GDPData('Tidak Hadir', 2, Colors.red),
    GDPData('Izin', 1, Colors.amber),
    GDPData('Sakit', 3, Colors.green),
    GDPData('Jumlah Cuti', 12, Colors.blue),
    GDPData('Waiting Approval', 6, Colors.indigo),
  ];
  return chartData;
}

class GDPData {
  GDPData(this.continent, this.gdp, this.pointColor);
  final String continent;
  final int gdp;
  final Color pointColor;
}

class _PageReportState extends State<PageReport> {
  List<GDPData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  Widget _tableRow() {
    return DataTable(
      sortColumnIndex: 1,
      sortAscending: true,
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Tanggal',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Jam masuk',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        DataColumn(
          label: Text(
            'Jam keluar',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('29 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('28 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('27 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('26 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('25 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
            DataCell(Text('24 Juli 2021')),
            DataCell(Text('06:43:00')),
            DataCell(Text('17:43:00')),
          ],
        ),
      ],
    );
  }

  Widget _pageReport() {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      color: Colors.amber[100],
                      child: SfCircularChart(
                        legend: Legend(
                            isVisible: true,
                            overflowMode: LegendItemOverflowMode.wrap),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          DoughnutSeries<GDPData, String>(
                              dataSource: _chartData,
                              xValueMapper: (GDPData data, _) => data.continent,
                              yValueMapper: (GDPData data, _) => data.gdp,
                              pointColorMapper: (GDPData data, _) =>
                                  data.pointColor,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              enableTooltip: true)
                        ],
                      )),
                  Container(
                    margin: const EdgeInsets.only(top: 35.0),
                    child: Text(
                      "satu minggu terakhir",
                      style: TextStyle(
                          color: Colors.cyan[800],
                          fontFamily: "Sen",
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                      width: double.infinity,
                      child: SingleChildScrollView(
                          child: FittedBox(
                        child: _tableRow(),
                      ))),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.6,
        leading: IconButton(
            icon: Icon(
              LineIcons.chevronCircleLeft,
              color: Colors.cyan[600],
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          'Report',
          style: TextStyle(
              color: Colors.cyan[600],
              fontFamily: 'Quattro',
              fontWeight: FontWeight.w400,
              fontSize: 17),
        ),
        actions: [
          IconButton(
            icon: LineIcon.search(color: Colors.cyan[700], size: 20),
            onPressed: () {
              print('Search data');
            },
          )
        ],
      ),
      body: _pageReport(),
    );
  }
}
