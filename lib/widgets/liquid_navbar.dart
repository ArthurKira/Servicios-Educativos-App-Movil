import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap; // ✅ cambiado para ser igual al BottomNavigationBar

  const LiquidNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap, // ✅ cambiado
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white.withOpacity(0.3),
              elevation: 0,
              selectedItemColor: Colors.blueAccent,
              unselectedItemColor: Colors.white70,
              currentIndex: currentIndex,
              onTap: onTap, // ✅ ahora funciona igual
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
                BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Serv. Educativos'),
                BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Mapa'),
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
