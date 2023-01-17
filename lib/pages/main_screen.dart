import 'package:capstone_app/components/report.dart';
import 'package:capstone_app/pages/home_page.dart';
import 'package:flutter/material.dart';
class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {


  // void initState() {
  //   value = HabitDatabase().getStrength();
  //   super.initState();
  // }


  double value = 0;
  int index = 0;

  final screens = [
    HomePage(),
    Report(
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      // body: HomePage(),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            // indicatorColor:
            labelTextStyle: MaterialStateProperty.all(
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500))),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          height: 60,
          selectedIndex: index,
          animationDuration: Duration(seconds: 2),
          onDestinationSelected: (index) => setState(() => this.index = index),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'home'),
            NavigationDestination(icon: Icon(Icons.menu), label: 'menu')
          ],
        ),
      ),
    );
  }
}
