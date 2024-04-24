import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:todo_list/presentation/helpers/app_colors.dart';

class LineGraphWidget extends StatelessWidget {
  final List<double> data;
  final List<int> days;

  const LineGraphWidget({super.key, required this.data, required this.days});
  @override
  Widget build(BuildContext context) {
    final List<String> weeekDays = List.generate(
        7,
        (index) => DateFormat('EEE')
            .format(DateTime.now().subtract(Duration(days: index))));
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SfCartesianChart(
          backgroundColor: AppColors.mainBoxColor,
          primaryXAxis: const CategoryAxis(
            majorGridLines: MajorGridLines(width: 0, dashArray: [5, 5]),
            majorTickLines: MajorTickLines(width: 0),
          ),
          primaryYAxis: const NumericAxis(
            axisLine: AxisLine(
              color: Colors.transparent,
            ),
            labelStyle: TextStyle(color: Colors.transparent),
            majorGridLines: MajorGridLines(
              width: 0.1,
              dashArray: [4, 4],
              color: Colors.grey,
            ),
            majorTickLines: MajorTickLines(
              width: 0,
            ),
          ),
          plotAreaBorderWidth: 0,
          series: [
            LineSeries<double, String>(
              isVisibleInLegend: true,
              pointColorMapper: (datum, index) => AppColors.borderColor,
              width: 2,
              dataSource: data,
              xValueMapper: (_, index) => weeekDays[index],
              yValueMapper: (value, _) => value,
            ),
          ],
        ),
      ),
    );
  }
}
