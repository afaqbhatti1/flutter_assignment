import 'package:flutter/material.dart';
import 'package:flutter_assignment/view/movie_list_screen.dart';
import 'package:flutter_assignment/view/movie_search_screen.dart';
import 'package:flutter_assignment/view/seat_mapping_screen.dart';
import 'package:provider/provider.dart';

import '../view_models/dashboard_viewmodel.dart';
import 'movie_trailer_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const MovieListScreen(),
    const MovieSearchScreen(),
    MovieTrailerScreen(),
    const SeatMappingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<DashBoardViewModel>(
      builder: (context, dashBoardViewModel, child) {
        return Scaffold(
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(0), topLeft: Radius.circular(30)),
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(24),
                topLeft: Radius.circular(24),
              ),
              child: BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                      backgroundColor: Color(0xff2E2739),
                      icon: Icon(Icons.grid_view_rounded),
                      label: 'Dashboard'),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.smart_display_rounded),
                    label: 'Watch',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.layers),
                    label: 'Media Library',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.toc,
                    ),
                    label: 'Ticket',
                  ),
                ],
                currentIndex: dashBoardViewModel.selectedIndex,
                selectedItemColor: const Color(0xffffffff),
                unselectedItemColor: Colors.grey[500],
                showUnselectedLabels: true,
                elevation: 40.0,
                onTap: dashBoardViewModel.onTapItem,
              ),
            ),
          ),
          body: pages[dashBoardViewModel.selectedIndex],
        );
      },
    );
  }
}
