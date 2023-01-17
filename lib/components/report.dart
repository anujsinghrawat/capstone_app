// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:capstone_app/data/habit_database.dart';

import 'package:hive_flutter/hive_flutter.dart';

class Report extends StatefulWidget {
  Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  

  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    } else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }
  // double db.getStrength() = 0;

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Your Today's Achieved Targets",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      color: Colors.purple[600],
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 5000,
                  radius: 100,
                  lineWidth: 30,
                  percent: db.getStrength(),
                  progressColor: Colors.purple,
                  backgroundColor: Colors.purple.shade200,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    "${(db.getStrength() * 100).toInt()} %",
                    style: GoogleFonts.poppins(
                        textStyle:
                            TextStyle(fontSize: 30, color: Colors.purple)),
                  ),
                ),
                
                SizedBox(
                  height: 50,
                ),
              ],
            )),
      ),
    );
    ;
  }
}
