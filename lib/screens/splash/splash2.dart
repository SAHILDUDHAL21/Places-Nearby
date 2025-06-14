import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash2 extends StatelessWidget {
  const Splash2({super.key});

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
                'All data stored locally',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),
              const Text('Safe and secure'),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton(
                    onPressed: () => context.go('/'),
                    child: const Text('Previous'),
                  ),
                  ElevatedButton(
                    onPressed: () => context.go('/login'),
                    child: const Text('Next'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
