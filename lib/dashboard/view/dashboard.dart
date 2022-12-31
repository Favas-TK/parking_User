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

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //   bottomBarItems: [
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.home, size: 20),
      //       iconSelected: const Icon(
      //         Icons.home,
      //         color: Color.fromARGB(255, 220, 229, 177),
      //         size: 20,
      //       ),
      //       title: 'home',
      //       dotColor: Colors.black,
      //       onTap: () {
      //         setState(() {
      //           _selectedIndex = 0;
      //         });
      //       },
      //     ),
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.book_online_rounded, size: 20),
      //       iconSelected: const Icon(
      //         Icons.book_online_rounded,
      //         color: Color.fromARGB(255, 220, 229, 177),
      //         size: 20,
      //       ),
      //       title: 'Booking',
      //       dotColor: Colors.black,
      //       onTap:  () {
      //         setState(() {
      //           _selectedIndex = 1;
      //         });
      //       },
      //     ),
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.bookmarks, size: 20),
      //       iconSelected: const Icon(
      //         Icons.bookmarks,
      //         color: Color.fromARGB(255, 173, 169, 43),
      //         size: 20,
      //       ),
      //       title: 'Bookmark',
      //       dotColor: Colors.black,
      //       onTap: () {
      //         setState(() {
      //           _selectedIndex = 2;
      //         });
      //       },
      //     ),
      //     BottomBarItemsModel(
      //       icon: const Icon(Icons.person, size: 20),
      //       iconSelected: const Icon(
      //         Icons.person,
      //         color: Colors.black,
      //         size: 20,
      //       ),
      //       title: 'Account',
      //       dotColor: Colors.black,
      //        onTap: () {
      //           print('kfhbsfkgbsdkfgsdkfjgbsdfgsdfg');

      //         setState(() {
      //           _selectedIndex = 3;
      //         });
      //       },
      //     ),
      //   ],
      //   bottomBarCenterModel: BottomBarCenterModel(
      //     centerBackgroundColor: Colors.black,
      //     centerIcon: const FloatingCenterButton(
      //       child: Icon(
      //         Icons.location_on_sharp,
      //         color: AppColors.white,
      //       ),
      //     ),
      //     centerIconChild: [
      //       FloatingCenterButtonChild(
      //         child: const Icon(
      //           Icons.location_on_sharp,
      //           color: AppColors.white,
      //         ),
      //          onTap: () {
      //           print('kfhbsfkgbsdkfgsdkfjgbsdfgsdfg');
      //         setState(() {
      //           _selectedIndex = 4;
      //         });
      //       },
      //       ),
      //     ],

      //   ),
      // ),
    );
  }
}
