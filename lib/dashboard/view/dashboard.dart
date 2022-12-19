import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        bottomBarItems: [
          BottomBarItemsModel(
            icon: const Icon(Icons.home, size: 20),
            iconSelected: const Icon(
              Icons.home,
              color: Color.fromARGB(255, 220, 229, 177),
              size: 20,
            ),
            title: 'home',
            dotColor: Colors.black,
            onTap: () => 'Home',
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.book_online_rounded, size: 20),
            iconSelected: const Icon(
              Icons.book_online_rounded,
              color: Color.fromARGB(255, 220, 229, 177),
              size: 20,
            ),
            title: 'Booking',
            dotColor: Colors.black,
            onTap: () => 'My Booking',
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.bookmarks, size: 20),
            iconSelected: const Icon(
              Icons.bookmarks,
              color: Color.fromARGB(255, 173, 169, 43),
              size: 20,
            ),
            title: 'Bookmark',
            dotColor: Colors.black,
            onTap: () => 'My Bookmark',
          ),
          BottomBarItemsModel(
            icon: const Icon(Icons.person, size: 20),
            iconSelected: const Icon(
              Icons.person,
              color: Colors.black,
              size: 20,
            ),
            title: 'Account',
            dotColor: Colors.black,
            onTap: () => 'Account',
          ),
        ],
        bottomBarCenterModel: BottomBarCenterModel(
          centerBackgroundColor: Colors.black,
          centerIcon: const FloatingCenterButton(
            child: Icon(
              Icons.location_on_sharp,
              color: AppColors.white,
            ),
          ),
          centerIconChild: [
            FloatingCenterButtonChild(
              child: const Icon(
                Icons.location_on_sharp,
                color: AppColors.white,
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
