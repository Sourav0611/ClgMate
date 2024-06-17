import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'resources_page.dart';
import 'grow_together.dart';
import 'grow_together1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ClgMate',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
      routes: {
        '/resource': (context) => ResourcesPage(),
        '/gt': (context) => GrowTo1(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClgMate'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Image.asset(
                'assets/logo2.png',
                width: 70.0,
                height: 70.0,
              ),
            ),
            ListTile(
              title: const Text('Resources'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ResourcesPage()),
                );
              },
            ),
            ListTile(
              title: const Text('Grow Together'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GrowTo1()),
                );
              },
            ),
            ListTile(
              title: const Text('Connect with us'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GrowTo()),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 120),
              Image.asset(
                'assets/logo2.png',
                height: 100,
                width: 100,
                alignment: Alignment.center,
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildIcon(
                    context: context,
                    icon: Icons.menu_book,
                    label: 'Resources',
                    onIconPressed: () => showBottomSheet(
                      context: context,
                      icon: Icons.menu_book,
                      label: 'Resources',
                      infoText: 'The NIT Warangal Resources module provides students with access to academic materials like lecture notes and presentations, and allows them to upload their own class notes and resources for others to view and rate. This collaborative platform fosters peer-to-peer resource sharing and a dynamic learning environment.',
                      goRoute: '/resource',
                    ),
                  ),
                  buildIcon(
                    context: context,
                    icon: Icons.group,
                    label: 'Grow Together',
                    onIconPressed: () => showBottomSheet(
                      context: context,
                      icon: Icons.group,
                      label: 'Grow Together',
                      infoText: 'The GROW Together module offers students access to branch and department-specific information on placed students and those who secured internships. This platform allows students to view and connect with peers who have gained professional experience, fostering networking and mentorship opportunities.',
                      goRoute: '/gt',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
          Positioned(
            top: 10,
            left: 10,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              icon: Icon(Icons.login),
              label: Text('Login'),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              icon: Icon(Icons.app_registration),
              label: Text('Register'),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildIcon({
    required BuildContext context,
    required IconData icon,
    required String label,
    required VoidCallback onIconPressed,
  }) {
    return IconButton(
      icon: Icon(icon, size: 60),
      onPressed: onIconPressed,
    );
  }

  void showBottomSheet({
    required BuildContext context,
    required IconData icon,
    required String label,
    required String infoText,
    required String goRoute,
  }) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 40),
                      SizedBox(width: 10),
                      Text(
                        label,
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(
                    infoText,
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Back'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, goRoute);
                    },
                    child: Text('Go'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
