import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:parking_user/bookmark/view/bookmark.dart';
import 'package:parking_user/homepage/view/homepage.dart';
import 'package:parking_user/mybooking/view/mybooking.dart';
import 'package:parking_user/profile/profile.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;
  onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _widgets = [
    const HomePage(),
    const MyBooking(),
    const Text('MAP'),
    const Booking(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgets[_selectedIndex]),

      bottomNavigationBar: ConvexAppBar(
          backgroundColor: const Color.fromARGB(255, 235, 219, 174),
          color: Colors.black,
          style: TabStyle.flip,
          items: [
            const TabItem(icon: Icons.home),
            const TabItem(
              icon: Icons.book_online_rounded,
            ),
            const TabItem(
              icon: Icons.location_on_sharp,
            ),
            const TabItem(icon: Icons.bookmarks),
            const TabItem(icon: Icons.person),
          ],
          initialActiveIndex: 0,
          onTap: onItemTapped),

     
    );
  }
}
