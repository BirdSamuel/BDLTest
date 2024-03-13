import 'package:flutter/material.dart';

class BDLBottomNavBar extends StatefulWidget {
  final Function(int)? onTap;
  const BDLBottomNavBar({super.key, this.onTap});

  @override
  State<BDLBottomNavBar> createState() => _BDLBottomNavBarState();
}

class _BDLBottomNavBarState extends State<BDLBottomNavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (selectedIndex) {
        setState(() {
          _currentIndex = selectedIndex;
          if (widget.onTap != null) {
            widget.onTap!.call(selectedIndex);
          }
        });
      },
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '',
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.airplane_ticket),
          label: '',
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.gamepad),
          label: '',
          tooltip: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: '',
          tooltip: '',
        ),
      ],
    );
  }
}
