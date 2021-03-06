import 'package:doctorapp/central_screen/care_team/ui/care_team.dart';
import 'package:doctorapp/central_screen/home/ui/home_feature.dart';
import 'package:doctorapp/central_screen/journal/ui/health.dart';
import 'package:doctorapp/central_screen/records/ui/records.dart';
import 'package:flutter/material.dart';

class CentralScreen extends StatefulWidget {
  @override
  _CentralScreenState createState() => _CentralScreenState();
}

class _CentralScreenState extends State<CentralScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    CareTeam(),
    Health(),
    Records()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Care Team'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: Text('Journal'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder_open),
            title: Text('Records'),
          ),
        ],
        currentIndex: _selectedIndex,
        //selectedItemColor: Theme.of(context).accentColor,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
