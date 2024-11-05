import 'package:appchat/config/config.dart';
import 'package:appchat/views/main/rooms_screen.dart';
import 'package:appchat/views/main/friends_screen.dart';
import 'package:appchat/views/main/stories_screen.dart';
import 'package:appchat/views/widgets/round_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const titles = ['Đoạn chat', 'Danh bạ', 'Tin'];
  static const List<Widget> _pages = [
    RoomsScreen(),
    FriendsScreen(),
    StoriesScreen(),
  ];
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState,
      drawer: SafeArea(
        child: NavigationDrawer(
          shadowColor: Theme.of(context).colorScheme.shadow,
          children: [
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Đăng xuất'),
              onTap: () async {
                final prefs = await SharedPreferences.getInstance();
                prefs.clear();
                if (context.mounted) {
                  Navigator.pushReplacementNamed(
                      context, mapRouteName[RouteName.splash]!);
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          titles[_selectedIndex],
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        shadowColor: Theme.of(context).colorScheme.shadow,
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.add_circle_rounded),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 30,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Badge.count(
              count: 1000,
              child: const Icon(Icons.chat_bubble_rounded),
            ),
            label: 'Đoạn chat',
          ),
          BottomNavigationBarItem(
            icon: Badge.count(
              count: 1000,
              child: const Icon(Icons.group_rounded),
            ),
            label: 'Danh bạ',
          ),
          BottomNavigationBarItem(
            icon: Badge.count(
              count: 1000,
              child: const Icon(Icons.amp_stories_rounded),
            ),
            label: 'Tin',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
