import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              colors: [
                Color.fromRGBO(0xD7, 0xF8, 0xFF, 1.0),
                Color.fromRGBO(0x00, 0xD1, 0xFF, 1.0),
              ],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
                vertical: 32,
              ),
              child: _ScaleDown(
                width: 800,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const _Heart(),
                    Image.asset(
                      'assets/title.png',
                      height: 124,
                      filterQuality: FilterQuality.high,
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 2,
                      ),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(14.5)),
                        color: Color.fromRGBO(0xFF, 0xA8, 0xA8, 1.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            offset: Offset(0.0, 4.0),
                            color: Color.fromRGBO(0x00, 0x00, 0x00, 0.1),
                          ),
                        ],
                      ),
                      child: Image.asset(
                        'assets/subtitle.png',
                        height: 24,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () => _linkTo('https://www.google.com'),
                          child: Image.asset(
                            'assets/google.png',
                            width: 280,
                            height: 94,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                        const SizedBox(width: 50),
                        InkWell(
                          onTap: () => _linkTo('https://www.google.com'),
                          child: Image.asset(
                            'assets/apple.png',
                            width: 280,
                            height: 94,
                            fit: BoxFit.scaleDown,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _linkTo(String url) => launch(url);
}

class _Heart extends StatefulWidget {
  const _Heart({Key? key}) : super(key: key);

  @override
  State<_Heart> createState() => __HeartState();
}

class __HeartState extends State<_Heart> {
  double _turns = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => setState(() => _turns = _turns + 2),
      child: AnimatedRotation(
        duration: const Duration(seconds: 1),
        turns: _turns,
        curve: Curves.easeOut,
        child: Lottie.asset(
          'assets/heart.json',
          height: 164,
        ),
      ),
    );
  }
}

class _ScaleDown extends StatelessWidget {
  final double width;
  final Widget child;
  const _ScaleDown({
    Key? key,
    required this.width,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: SizedBox(
        width: width,
        child: child,
      ),
    );
  }
}
