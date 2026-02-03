import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/side_navigation_bar/presentation/widgets/rail_icons.dart';

class SideNavigationBar extends StatelessWidget {
  // Gotouer側から渡されるStatefulNavigationShellを受け取ってその状態を表示するだけ
  final StatefulNavigationShell statefulNavigationShell;

  const SideNavigationBar({super.key, required this.statefulNavigationShell});

  @override
  Widget build(BuildContext context) {
    final body = Row(
      children: <Widget>[
        NavigationRail(
          selectedIndex: statefulNavigationShell.currentIndex,
          onDestinationSelected: (i) => statefulNavigationShell.goBranch(i),
          destinations: [...railIcons],
        ),
        SizedBox(width: 20, height: double.infinity),
        Expanded(child: Center(child: statefulNavigationShell)),
      ],
    );
    return body;
  }
}
