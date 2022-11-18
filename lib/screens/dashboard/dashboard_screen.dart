import 'package:flutter/material.dart';
import 'package:pollee/routes.dart';
import 'package:pollee/screens/polls_list/polls_list_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentTab == 0
          ? const PollsListScreen(
              key: ValueKey('Polls Screen'),
              isManageSection: false,
            )
          : const PollsListScreen(
              key: ValueKey('Manage Screen'),
              isManageSection: true,
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (tabIndex) => setState(() => _currentTab = tabIndex),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Polls',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Manage',
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).pushNamed(RouteNames.createPoll);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
