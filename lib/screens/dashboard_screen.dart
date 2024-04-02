import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:pmsn_p6/screens/Registro_datos.dart';
import 'package:pmsn_p6/settings/app_value_notifier.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  static const List<Widget> _widgetOptions = <Widget>[
    // Text(
    //   'Home',
    //   style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    // ),
    RegistroDatosScreen(),
    Text(
      'Search',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
  ];

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  // Handle the tap event for each tab
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://i.pravatar.cc/500'),
              ),
              accountName: Text('Leonardo Covarrubias Lemus'),
              accountEmail: Text('19031645@itcelaya.edu.mx'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text("Práctica 1"),
              subtitle: Text("Aqui iria la descripcion si tuviera una XDD"),
              trailing: Icon(Icons.chevron_right),
            ),
            // ListTile(
            //   leading: const Icon(Icons.shop),
            //   title: const Text("Mi despensa"),
            //   subtitle: const Text("Relacion de productos que no voy a usar"),
            //   trailing: const Icon(Icons.chevron_right),
            //   onTap: () => Navigator.pushNamed(context, "/despensa"),
            // ),
            // ListTile(
            //   leading: const Icon(Icons.shop),
            //   title: const Text("Mi despensa 2"),
            //   subtitle: const Text("Relacion de productos que no voy a usar"),
            //   trailing: const Icon(Icons.chevron_right),
            //   onTap: () => Navigator.pushNamed(context, "/despensa"),
            // ),
            // ListTile(
            //   //Se utiliza para manejar titulos y subtitulos en cada elemento, ademas de tener cosas a los lados
            //   leading: Icon(Icons.movie),
            //   title: Text("Moviles app"),
            //   subtitle: Text("Consulta de peliculas particulares"),
            //   trailing: Icon(Icons.chevron_right),
            //   onTap: () {
            //     SessionID().getSessionId();
            //     Navigator.pushNamed(context, "/movies");
            //   },
            // ),
            // ListTile(
            //   //Se utiliza para manejar titulos y subtitulos en cada elemento, ademas de tener cosas a los lados
            //   leading: Icon(Icons.movie),
            //   title: Text("Session"),
            //   subtitle: Text("Consulta de peliculas particulares"),
            //   trailing: Icon(Icons.chevron_right),
            //   onTap: () {
            //     SessionID().getSessionId();
            //     Navigator.pushNamed(context, "/sesion");
            //   },
            // ),
            // ListTile(
            //   leading: const Icon(Icons.close),
            //   title: const Text("Salir"),
            //   subtitle: const Text("Hasta luego"),
            //   trailing: const Icon(Icons.chevron_right),
            //   onTap: () {
            //     Navigator.pop(context);
            //     Navigator.pop(context);
            //   },
            // ),
            Padding(
              padding: const EdgeInsets.only(right: 100, left: 100),
              child: DayNightSwitcher(
                isDarkModeEnabled: AppValueNotifier.banTheme.value,
                onStateChanged: (isDarkModeEnabled) {
                  AppValueNotifier.banTheme.value = isDarkModeEnabled;
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: DashboardScreen._widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Whether the labels are shown for the unselected
        showUnselectedLabels: false,

        // Set the selected tab index
        currentIndex: _selectedIndex,
        // Define the onTap event handler
        onTap: _onItemTapped,
        // Define the type of the bottom navigation bar
        type: BottomNavigationBarType.fixed,
        // Define the items in the bottom navigation bar
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Rentas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
