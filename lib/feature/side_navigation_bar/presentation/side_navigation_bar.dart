import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:proportal_app/feature/side_navigation_bar/presentation/widgets/rail_icons.dart';

class SideNavigationBar extends StatelessWidget {
  // GotRouer側から渡されるStatefulNavigationShellを受け取ってその状態を表示するだけ
  final StatefulNavigationShell statefulNavigationShell;

  const SideNavigationBar({super.key, required this.statefulNavigationShell});

  @override
  Widget build(BuildContext context) {
    final body = Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Expanded(
              child: NavigationRail(
                selectedIndex: statefulNavigationShell.currentIndex,
                onDestinationSelected: (i) =>
                    statefulNavigationShell.goBranch(i),
                destinations: [...railIcons],
              ),
            ),
            Container(
              height: 50,
              width: 80,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Center(child: CircleAvatar(backgroundColor: Colors.amber)),
            ),
          ],
        ),
        Expanded(child: Center(child: statefulNavigationShell)),
      ],
    );
    return body;
  }
}
