import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:test_salma/features/home/presentation/report/widget/part2.dart';

class ReportPart1 extends StatefulWidget {
  const ReportPart1({super.key});

  @override
  State<ReportPart1> createState() => _ReportPart1State();
}

class _ReportPart1State extends State<ReportPart1> {
  late TooltipBehavior _tooltipBehavior;
  late ZoomPanBehavior _zoomPanBehavior;

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _zoomPanBehavior = ZoomPanBehavior(
      enablePanning: true,
      zoomMode: ZoomMode.x,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 180,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                width: 1000,
                child: SfCartesianChart(
                  plotAreaBorderWidth: 0,
                  tooltipBehavior: _tooltipBehavior,
                  zoomPanBehavior: _zoomPanBehavior,
                  primaryXAxis: const CategoryAxis(
                    interval: 1,
                    majorGridLines: MajorGridLines(width: 0),
                    axisLine: AxisLine(width: 1),
                    labelStyle: TextStyle(fontSize: 10),
                    labelPlacement: LabelPlacement.betweenTicks,
                    labelRotation: 45,
                  ),
                  primaryYAxis: const NumericAxis(
                    minimum: 8,
                    maximum: 12,
                    interval: 1,
                    labelFormat: '{value}:00am',
                    axisLine: AxisLine(width: 1),
                    majorGridLines: MajorGridLines(width: 0.2),
                  ),
                  series: <CartesianSeries<CheckinData, String>>[
                    LineSeries<CheckinData, String>(
                      dataSource: fullMonthData,
                      xValueMapper: (d, _) => d.day,
                      yValueMapper: (d, _) => d.time,
                      pointColorMapper: (d, _) => d.color,
                      markerSettings: const MarkerSettings(isVisible: true),
                      dataLabelSettings: const DataLabelSettings(isVisible: false),
                      color: Colors.grey,
                      width: 2,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              border: Border.all(
                color: const Color(0xFF395486),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatusCard("On Time", "12 Days", const Color(0xff00ff00)),
                buildStatusCard("Late", "15 Days", const Color(0xFFD80000)),
                buildStatusCard("Exception", "03 Days", const Color(0xFFECD614)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                'assets/icons/solar_download-broken.svg',
                width: 24,
                height: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildStatusCard(String label, String value, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}


class CheckinData {
  final String day;
  final double time;
  final Color color;

  CheckinData(this.day, this.time, this.color);
}
final List<CheckinData> fullMonthData = List.generate(30, (index) {
  final day = index + 1;
  final hour = 8.0 + (index % 5) + 0.5 * (index % 3);
  final color = getPointColor(hour);
  return CheckinData('$day Jun', hour, color);
});