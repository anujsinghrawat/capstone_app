import 'package:capstone_app/components/greet.dart';
import 'package:capstone_app/components/today_details.dart';
import 'package:capstone_app/data/habit_database.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/habit_tile.dart';
import '../components/month_summary.dart';
import '../components/my_alert_box.dart';
import '../components/my_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }


    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  // checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  // create a new habit
  final _newHabitNameController = TextEditingController();
  final _newHabitCategoryController = TextEditingController();
  void createNewHabit() {
    // show alert dialog for user to enter the new habit details
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          cateController: _newHabitCategoryController,
          hintText: 'Enter habit name..',
          hintTextCate: 'Enter category name..',
          onSave: saveNewHabit,
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save new habit
  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([
        _newHabitNameController.text,
        false,
        _newHabitCategoryController.text
      ]);
    });

    // clear textfield
    _newHabitNameController.clear();
    // clear category
    _newHabitCategoryController.clear();
    // pop dialog box
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  // cancel new habit
  void cancelDialogBox() {
    // clear textfield
    _newHabitNameController.clear();
    // clear category
    _newHabitCategoryController.clear();

    // pop dialog box
    Navigator.of(context).pop();
  }

  // open habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return MyAlertBox(
          controller: _newHabitNameController,
          cateController: _newHabitCategoryController,
          hintText: db.todaysHabitList[index][0],
          hintTextCate: db.todaysHabitList[index][2],
          onSave: () => saveExistingHabit(index),
          onCancel: cancelDialogBox,
        );
      },
    );
  }

  // save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
      db.todaysHabitList[index][2] = _newHabitCategoryController.text;
    });
    _newHabitNameController.clear();
    _newHabitCategoryController.clear();
    Navigator.pop(context);
    db.updateDatabase();
  }

  // delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        floatingActionButton: MyFloatingActionButton(onPressed: createNewHabit),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        
        body: ListView(
          children: [

            //greeting message
            Greet(),

            // monthly summary heat map
            MonthlySummary(
              datasets: db.heatMapDataSet,
              startDate: _myBox.get("START_DATE"),
            ),
            // ElevatedButton.icon(onPressed: (){}, icon: Icon(Icons.report), label: Text("report")),


            //today details
            Today(percent: db.getStrength(),),

            
    
            // list of habits
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todaysHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: db.todaysHabitList[index][0],
                  habitCategory: db.todaysHabitList[index][2],
                  habitCompleted: db.todaysHabitList[index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => openHabitSettings(index),
                  deleteTapped: (context) => deleteHabit(index),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
