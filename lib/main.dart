import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gradient_borders/gradient_borders.dart';

import 'decorated_outlined_border.dart';
import 'gradient_button.dart';
import 'gradient_shadow.dart';

void main() {
  runApp(const MyApp());
}

const mainColor = Color(0xff0C0F1E);

const bgGradient1 = RadialGradient(
  center: Alignment(1.2, -1.3), // near the top right
  radius: 1.5,
  colors: <Color>[
    Color(0xff83505D), Color(0xff261841), mainColor // blue sky
  ],
  stops: <double>[0.2, 0.7, 1.0],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: bgGradient1,
        ),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                GradientButton(
                  borderRadius: BorderRadius.circular(32),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  gradient: const LinearGradient(
                      colors: [Color(0xff37B5FD), Color(0xffF25BFE)]),
                  onTap: () {
                    print('tap');
                  },
                  minHeight: 64,
                  child: Text(
                    'Create',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                )
                    .animate(
                      autoPlay: true,
                      onPlay: (controller) => controller.repeat(),
                    )
                    .shimmer(duration: 2.seconds),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      border: const GradientBoxBorder(
                        gradient:
                            LinearGradient(colors: [Colors.blue, Colors.red]),
                        width: 4,
                      ),
                      borderRadius: BorderRadius.circular(16)),
                ),
                TextField(
                  decoration: InputDecoration(
                    border: GradientOutlineInputBorder(
                      gradient:
                          LinearGradient(colors: [Colors.red, Colors.blue]),
                      width: 2,
                    ),
                    focusedBorder: GradientOutlineInputBorder(
                        gradient: LinearGradient(
                            colors: [Colors.yellow, Colors.green]),
                        width: 2),
                    label: Text("Example"),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                        (states) => EdgeInsets.zero),
                    shape: MaterialStateProperty.resolveWith(
                      (states) {
                        return DecoratedOutlinedBorder(
                          shadow: [
                            GradientShadow(
                              gradient: const LinearGradient(colors: [
                                Colors.red,
                                Colors.green,
                                Colors.cyan
                              ]),
                              blurRadius: 16,
                            )
                          ],
                          child: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                              side: BorderSide.none),
                        );
                      },
                    ),
                  ),
                  // shape: RoundedRectangleBorder(
                  // borderRadius: BorderRadius.circular(80.0)),
                  // padding: const EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Colors.red, Colors.green, Colors.cyan]),
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                    ),
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 88.0,
                        minHeight: 44.0,
                      ), // min sizes for Material buttons
                      alignment: Alignment.center,
                      child: const Text(
                        'OK',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
