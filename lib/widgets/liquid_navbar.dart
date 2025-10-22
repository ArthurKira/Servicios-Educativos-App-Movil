import 'dart:ui';
import 'package:flutter/material.dart';

class LiquidNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const LiquidNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(35),
          child: Stack(
            children: [
              // 🔹 Capa 1: efecto vidrio translúcido
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.25),
                        Colors.white.withOpacity(0.05),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1.2,
                    ),
                    borderRadius: BorderRadius.circular(35),
                  ),
                ),
              ),

              // 🔹 Capa 2: brillo superior (simula reflejo de vidrio)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 25,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.35),
                        Colors.white.withOpacity(0.05),
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),

              // 🔹 Capa 3: barra de navegación real
              BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                selectedItemColor: const Color(0xFF3B82F6), // azul iOS 26
                unselectedItemColor: Colors.white.withOpacity(0.75),
                showUnselectedLabels: false,
                currentIndex: currentIndex,
                onTap: onTap,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: 'Inicio',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.school_rounded),
                    label: 'Educativos',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.map_rounded),
                    label: 'Mapa',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search_rounded),
                    label: 'Buscar',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
