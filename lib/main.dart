import 'package:flutter/material.dart';

void main() {
  runApp(BookNGoApp());
}

class BookNGoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookNGo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    MyFlightsPage(),
    BookFlightsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BookNGo')),
      drawer: AppDrawer(),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.flight),
            label: 'My Flights',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Book Flights',
          ),
        ],
      ),
    );
  }
}

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Guest User"),
            accountEmail: Text("guest@example.com"),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.flight),
            title: Text("My Flights"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text("Book Flights"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.login),
            title: Text("Login"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
          ),
        ],
      ),
    );
  }
}

class MyFlightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("My Flights", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),

        // Flight Card 1
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("YVR - JFK", style: TextStyle(fontWeight: FontWeight.bold)),
                    Chip(label: Text("Today")),
                  ],
                ),
                Text("Vancouver - New York"),
                SizedBox(height: 10),
                Text("15 Nov 22"),
                SizedBox(height: 10),
                Text("10:15 AM", style: TextStyle(fontSize: 18)),
              ],
            ),
          ),
        ),

        SizedBox(height: 20),

        // Flight Card 2
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("LHR - JFK", style: TextStyle(fontWeight: FontWeight.bold)),
                    Chip(label: Text("Next Month")),
                  ],
                ),
                Text("London - New York"),
                SizedBox(height: 10),
                Text("15 Dec 22"),
                SizedBox(height: 10),
                Text("08:20 PM", style: TextStyle(fontSize: 18)),
                SizedBox(height: 10),
                Text("Terminal B • Platform 6"),
              ],
            ),
          ),
        ),

        SizedBox(height: 20),
        Center(child: TextButton(onPressed: () {}, child: Text("See All"))),
      ],
    );
  }
}

class BookFlightsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16),
      children: [
        Text("Book Flights", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        SizedBox(height: 20),

        // Search Form
        TextField(
          decoration: InputDecoration(
            labelText: "From",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.flight_takeoff),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: "To",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.flight_land),
          ),
        ),
        SizedBox(height: 10),
        TextField(
          decoration: InputDecoration(
            labelText: "Date",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.calendar_today),
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: Text("Search Flights"),
          style: ElevatedButton.styleFrom(
            minimumSize: Size(double.infinity, 50),
          ),
        ),

        SizedBox(height: 30),
        Text("Available Flights", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),

        // Flight Option
        Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Emirates", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("JFK - SJC"),
                Text("Business Class"),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("\$426.00", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ElevatedButton(onPressed: () {}, child: Text("Buy")),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Login"),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text("Create an account"),
            ),
          ],
        ),
      ),
    );
  }
}