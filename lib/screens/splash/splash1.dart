import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../hive_helper.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'New to this place?',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 15),
              const Text('Get nearby places...'),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  HiveHelper.setHasSeenSplash(true);
                  context.go('/splash2');
                },
                child: const Text('Next'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
