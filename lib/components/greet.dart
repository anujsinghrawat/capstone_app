import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Greet extends StatelessWidget {
  const Greet({super.key});

  String greetings(){
  final hour = TimeOfDay.now().hour;

  if(hour <= 12){
    return 'Morning';
  } else if (hour <= 17){
    return 'Afternoon';
  }
  return 'Evening';
}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Good",
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                color: Colors.purple[600],
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
              )
          ),
          Text(
              greetings(),
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                color: Colors.purple[600],
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
          ),),
        ],
      ),
    );
  }
}