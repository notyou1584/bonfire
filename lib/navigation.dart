// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:task/screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = <Widget>[
      Container(key: PageStorageKey('page1'), child: StrollBonfireScreen()),
      Container(key: PageStorageKey('page2'), child: Placeholder()),
      Container(key: PageStorageKey('page3'), child: Placeholder()),
      Container(key: PageStorageKey('page4'), child: Placeholder()),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromRGBO(139, 136, 239, 1),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heart, size: 30),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Badge(child: FaIcon(FontAwesomeIcons.fire, size: 30)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Badge(
                label: Text('2'),
                child: FaIcon(FontAwesomeIcons.comment, size: 30)),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, size: 30),
            label: '',
          ),
        ],
      ),
    );
  }
}
