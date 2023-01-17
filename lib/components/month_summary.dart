import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

import '../datetime/date_time.dart';
class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        startDate: createDateTimeObject(startDate),
        endDate: DateTime.now().add(Duration(days: 0)),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[300],
        textColor: Colors.white,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 40,
        colorsets: const {
          1: Color.fromARGB(20, 123, 2, 179),
          2: Color.fromARGB(40, 123, 2, 179),
          3: Color.fromARGB(60, 123, 2, 179),
          4: Color.fromARGB(80, 123, 2, 179),
          5: Color.fromARGB(100, 123, 2, 179),
          6: Color.fromARGB(120, 123, 2, 179),
          7: Color.fromARGB(150, 123, 2, 179),
          8: Color.fromARGB(180, 123, 2, 179),
          9: Color.fromARGB(220, 123, 2, 179),
          10: Color.fromARGB(255, 123, 2, 179),
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
