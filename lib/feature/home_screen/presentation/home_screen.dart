import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/home_screen/presentation/widgets/left_body.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final topBar = SizedBox(
      width: double.infinity,
      height: 80,
      child: Placeholder(),
    );

    final leftBody = LeftBody();
    final rightBody = Container(child: Placeholder());

    final body = Row(
      children: <Widget>[
        Expanded(flex: 1, child: leftBody),
        SizedBox(width: 30),
        Expanded(flex: 1, child: rightBody),
      ],
    );

    final bottomBar = SizedBox(
      width: double.infinity,
      height: 80,
      child: Placeholder(),
    );

    final screen = Column(
      children: <Widget>[
        topBar,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: body,
          ),
        ),
        bottomBar,
      ],
    );

    return screen;
  }
}
