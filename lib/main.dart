import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final TapGestureRecognizer _contactUsRecognizer;

  @override
  void initState() {
    super.initState();
    const email = 'Tarlok@hyper-pop.com';
    const subject = 'Question about Openup';
    _contactUsRecognizer = TapGestureRecognizer()
      ..onTap = () {
        launch('mailto:$email?subject=${subject.replaceAll(' ', '%20')}');
      };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Openup: Make Friends',
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
            child: Scrollbar(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1300,
                        maxHeight: 500,
                        minWidth: 200,
                        minHeight: 200,
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 32,
                      ),
                      child: _ScaleDown(
                        width: 800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const RepaintBoundary(
                              child: _Heart(),
                            ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14.5)),
                                color: Color.fromRGBO(0xFF, 0xA8, 0xA8, 1.0),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 4,
                                    offset: Offset(0.0, 4.0),
                                    color:
                                        Color.fromRGBO(0x00, 0x00, 0x00, 0.1),
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
                                  onTap: () => _linkTo(
                                      'https://play.google.com/store/apps/details?id=com.openupdating'),
                                  child: Image.asset(
                                    'assets/google.png',
                                    width: 280,
                                    height: 94,
                                    filterQuality: FilterQuality.high,
                                  ),
                                ),
                                const SizedBox(width: 50),
                                InkWell(
                                  onTap: () =>
                                      _linkTo('https://www.google.com'),
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
                    const SizedBox(height: 100),
                    Center(
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 800),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 32,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Frequently Asked Questions',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 16),
                            const Divider(),
                            _question(context, 'How do I sign-out?'),
                            _answer(context,
                                'Press the profile button in the top corner, then press Account & Support and choose Sign Out.'),
                            const Divider(),
                            _question(context, 'Can I delete my account?'),
                            _answer(context,
                                'Yes, press the profile button in the top corner, then press Account & Support and choose Delete Account. All of your user data, including your photos and chat messages, will be removed from Openup and will not be recoverable.'),
                            const Divider(),
                            _question(context, 'How do I report a user?'),
                            _answer(context,
                                'During a call, press the \'R\' symbol near the end call button and choose a reason for making the report. This will end the call and report the user. Our team will look into the report.'),
                            const Divider(),
                            _question(context,
                                'How can I only receive calls from my friends, but not strangers?'),
                            _answer(context,
                                'Your friends can call you any time, but strangers can only call you while your status is posted. Your status is automatically removed after one hour. You can check if your status is still posted by looking at the bottom of the main screen of Openup. To remove your status, tap on it and press the red trash icon. '),
                            const Divider(),
                            _question(context, 'Can I choose who I talk with?'),
                            _answer(context,
                                'Yes, on the main screen of Openup, you can see others near you who are available to call. Simply tap one of them to call them.'),
                            const Divider(),
                            const SizedBox(height: 50),
                            Text(
                              'Contact Us',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                            const SizedBox(height: 16),
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.subtitle1,
                                children: [
                                  const TextSpan(
                                      text:
                                          'If you have any questions or concerns, feel free to email us at '),
                                  TextSpan(
                                      text: 'tarlok@hyper-pop.com',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          ?.copyWith(
                                              fontWeight: FontWeight.bold,
                                              decoration:
                                                  TextDecoration.underline),
                                      mouseCursor: SystemMouseCursors.click,
                                      recognizer: _contactUsRecognizer),
                                  const TextSpan(
                                    text: '.',
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 100),
                            Center(
                              child: Text(
                                'Copyright 2022 Tarlok Singh',
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _question(BuildContext context, String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Q: $text',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _answer(BuildContext context, String text) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'A: ',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: text,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
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
