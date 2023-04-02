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
      title: 'Twitter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const Home(title: "Twitter Home"),
        "/profile": (context) => const Profile(),
        "topics": (context) => const Topics(),
      },
    );
  }
}

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

  static List<Widget> screens = <Widget>[
    const Text(
      'Index 0: Home',
    ),
    const Text(
      'Index 1: Office',
    ),
    const Text(
      'Index 2: Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56), // 56 is default height
        child: AppBarGlobal(title: "Profile"),
      ),
      drawer: const AppDrawerGlobal(),
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

///Routes

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56), // 56 is default height
        child: AppBarGlobal(title: "Profile"),
      ),
      drawer: AppDrawerGlobal(),
      body: Center(child: Text("Profile")),
    );
  }
}

class Topics extends StatefulWidget {
  const Topics({super.key});

  @override
  State<Topics> createState() => TopicsState();
}

class TopicsState extends State<Topics> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56), // 56 is default height
        child: AppBarGlobal(title: "Topics"),
      ),
      drawer: AppDrawerGlobal(),
      body: Center(child: Text("Topics")),
    );
  }
}

class AppDrawerGlobal extends StatefulWidget {
  const AppDrawerGlobal({super.key});

  @override
  State<AppDrawerGlobal> createState() => AppDrawerGlobalState();
}

class AppDrawerGlobalState extends State<AppDrawerGlobal> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Drawer Header"),
          ),
          ListTile(
            title: const Text("Profile"),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
          ListTile(
            title: const Text("Topics"),
            onTap: () {
              Navigator.pushNamed(context, "/profile");
            },
          ),
          ListTile(
            title: const Text("Bookmarks"),
            onTap: () {
              print("object");
            },
          ),
          ListTile(
            title: const Text("Lists"),
            onTap: () {
              print("object");
            },
          ),
          ListTile(
            title: const Text("Twitter Circle"),
            onTap: () {
              print("object");
            },
          ),
          ListTile(
            title: const Text("Logout"),
            onTap: () {
              print("object");
            },
          ),
        ],
      ),
    );
  }
}

class AppBarGlobal extends StatefulWidget {
  const AppBarGlobal({super.key, required this.title});
  final String title;

  @override
  State<AppBarGlobal> createState() => _AppBarGlobalState();
}

class _AppBarGlobalState extends State<AppBarGlobal> {
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(widget.title));
  }
}
