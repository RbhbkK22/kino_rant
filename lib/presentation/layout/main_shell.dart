import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainShell extends StatefulWidget {
  final Widget child;

  const MainShell({super.key, required this.child});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int selectedIndex = 0;

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        setState(() {
          selectedIndex = index;
        });

        context.go("/main");
        break;
      case 1:
        setState(() {
          selectedIndex = index;
        });
        context.go("/second");
        break;
      case 2:
        setState(() {
          selectedIndex = index;
        });
        context.go("/main");
        break;
      case 3:
        setState(() {
          selectedIndex = index;
        });
        context.go("/main");
        break;
    }
  }

  final List<Widget> _pages = [
    Center(child: Text('🏠 Главная')),
    Center(child: Text('🔍 Поиск')),
    Center(child: Text('👤 Профиль')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: SafeArea(child: widget.child),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
          child: Container(
            height: 82,
            decoration: BoxDecoration(
              color: Color(0xff1E1E1E), // фон островка
              borderRadius: BorderRadius.circular(38),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8,
              ),
              child: GNav(
                gap: 8,
                backgroundColor: Colors.transparent,
                color: Colors.white,
                activeColor: Colors.white,

                tabBackgroundColor: Color(0xffEB2F3D),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),

                tabs: [
                  const GButton(icon: Icons.home, text: 'Главная'),

                  GButton(icon: Icons.favorite, text: "Favorite"),
                  const GButton(icon: Icons.person, text: 'Профиль'),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // bottomNavigationBar: Theme(
    //   data: Theme.of(context).copyWith(canvasColor: Color(0xff1E1E1E)),
    //   child: BottomNavigationBar(
    //     currentIndex: selectedIndex,
    //     onTap: (index) => _onTap(context, index),
    //     items: [
    //       BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
    //       BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Поиск'),
    //       BottomNavigationBarItem(
    //         icon: Icon(Icons.favorite),
    //         label: 'Избранное',
    //       ),
    //       BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Профиль'),
    //     ],
    //   ),
    // ),
  }
}
