import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// class Home extends StatelessWidget {
//   const Home({super.key, required this.title});
//   final String title;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(title),
//       ),
//       drawer: Drawer(),
//       bottomNavigationBar:
//           BottomNavigationBar(items: const <BottomNavigationBarItem>[
//         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//         BottomNavigationBarItem(
//             icon: Icon(Icons.local_post_office), label: "Office")
//       ]),
//       body: const Center(child: Text("JH")),
//     );
//   }
// }

class Home extends StatefulWidget {
  const Home({super.key, required this.title});
  final String title;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int selectedTabIndex = 0;

  void onSelectTab(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  static const bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.local_post_office), label: "Office"),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
  ];

  static const List<Widget> screens = <Widget>[
    Text(
      'Index 0: Home',
    ),
    Text(
      'Index 1: Office',
    ),
    Text(
      'Index 2: Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      drawer: Drawer(),
      bottomNavigationBar: BottomNavigationBar(
        items: bottomTabs,
        currentIndex: selectedTabIndex,
        onTap: onSelectTab,
      ),
      body: Center(
        child: screens.elementAt(selectedTabIndex),
      ),
    );
  }
}
