import 'package:flutter/material.dart';
import 'screens/landing_screen.dart';
import 'screens/home_screen.dart';
import 'screens/servicios_educativos_screen.dart';
import 'screens/maps_screen.dart';
import 'screens/search_screen.dart';
import 'widgets/liquid_navbar.dart';
import 'screens/details_screen.dart';

void main() => runApp(const EduPeruApp());

class EduPeruApp extends StatelessWidget {
  const EduPeruApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduPerú App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const LandingScreen(),
      routes: {
        '/details': (_) => const DetailsScreen(),
      },
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ServiciosEducativosScreen(),
    MapsScreen(),
    SearchScreen(),
  ];

  void _onTabChanged(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: LiquidNavBar(
        currentIndex: _selectedIndex,
        onTap: _onTabChanged,
      ),
    );
  }
}
