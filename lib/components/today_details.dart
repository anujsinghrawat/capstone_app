import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Today extends StatelessWidget {
  double percent;
  Today({super.key, required this.percent});

  String day = DateFormat('EEEE').format(DateTime.now());
  String date = DateFormat('yMMMd').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Today's ${day}",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.purple[600],
                  // fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              date,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.purple[600],
                  // fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ]),
          Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
            Text(
              "${(percent * 100).toInt()}% done",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.purple[600],
                  // fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "completed Tasks",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: Colors.purple[600],
                  // fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ])
        ],
      ),
    );
  }
}
