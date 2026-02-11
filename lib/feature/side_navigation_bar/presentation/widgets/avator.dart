import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proportal_app/feature/auth/auth.dart';

class Avator extends ConsumerWidget {
  const Avator({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 100,
      width: 80,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryFixed,
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    width: 100,
                    height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('あなたの情報'),
                        Text('ログイン中のメールアドレス'),
                        Text('sample@sample.com'),
                        Expanded(child: SizedBox()),
                        ElevatedButton(
                          onPressed: () {
                            ref.watch(authProvider).signOut();
                          },
                          child: Text('サインアウト'),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          style: ButtonStyle(elevation: WidgetStatePropertyAll(0)),
          child: CircleAvatar(backgroundColor: Colors.amber),
        ),
      ),
    );
  }
}
