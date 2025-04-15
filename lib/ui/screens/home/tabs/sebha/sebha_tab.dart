import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:islami_prj/ui/utils/app_assets.dart';

void main() {
  runApp(const SebhaTab());
}

class SebhaTab extends StatelessWidget {
  const SebhaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SebhaScreen(),
    );
  }
}

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void incrementCounter() {
    setState(() {
      counter++;
      _controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية
        Positioned.fill(
          child: Image.asset(
            'assets/images/Background_sebha.png',
            fit: BoxFit.fill,
          ),
        ),

        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              const SizedBox(height: 50), // مسافة من فوق

              // اللوجو
              Image.asset(
                AppAssets.islamiLogo,
                width: 291,
                height: 171,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 30),

              // النص بالتشكيل بين اللوجو والسبحة
              Container(
                width: 350,
                height: 80,
                alignment: Alignment.center,
                child: const Text(
                  'سَبِّحِ اسْمَ رَبِّكَ الْأَعْلَىٰ',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: incrementCounter,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // السبحة المتحركة
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Transform.rotate(
                              angle: _controller.value * 2 * math.pi,
                              child: child,
                            );
                          },
                          child: Image.asset(
                            'assets/images/sebha_body2-removebg-preview.png',
                            height: 900,
                            width: 800,
                          ),
                        ),

                        // النصوص داخل السبحة (كلمة سبحان الله + العداد)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              'سبحان الله',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8), // مسافة بين النص والعداد
                            Text(
                              '$counter',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    blurRadius: 4,
                                    offset: Offset(2, 2),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
