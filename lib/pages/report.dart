import 'package:capstone_app/data/habit_database.dart';
import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  void initState() async {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'your Todays Report',
            ),
            CircularProgressIndicator(
              
              // value: HabitDatabase().getInt(),
              value: 0.1,
            )

          ],
        ),
      ),
    );
  }
}
