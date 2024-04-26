import 'dart:async';
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:medical_expert_app/core/componants/colors.dart';

class LineChartSample10 extends StatefulWidget {
  const LineChartSample10({super.key});

  // final Color sinColor = AppColors.contentColorBlue;
  // final Color cosColor = AppColors.contentColorPink;

  @override
  State<LineChartSample10> createState() => _LineChartSample10State();
}

class _LineChartSample10State extends State<LineChartSample10> {
  final limitCount = 10;
  final sinPoints = <FlSpot>[];
  // final cosPoints = <FlSpot>[];

  double xValue = 0;
  double step = 10;

  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      while (sinPoints.length > limitCount) {
        sinPoints.removeAt(0);
        // cosPoints.removeAt(0);
      }
      setState(() {
        sinPoints.add(FlSpot(xValue, math.sin(xValue)));
        // cosPoints.add(FlSpot(xValue, math.cos(xValue)));
      });
      xValue += step;
    });
  }

  @override
  Widget build(BuildContext context) {
    return sinPoints.isNotEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 1.3,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: LineChart(
                    LineChartData(
                      minY: -1,
                      maxY: 1,
                      minX: sinPoints.first.x,
                      maxX: sinPoints.last.x,
                      gridData: const FlGridData(
                        show: true,
                      ),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        sinLine(sinPoints),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        : Container();
  }

  LineChartBarData sinLine(List<FlSpot> points) {
    return LineChartBarData(
      color: kPrimary,
      spots: points,
      dotData: const FlDotData(
        show: false,
      ),
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
