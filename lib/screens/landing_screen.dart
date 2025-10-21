import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFF112E44),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              // Imagen de fondo - usando un gradiente como placeholder
              
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF1E3A8A),
                      Color(0xFF3B82F6),
                      Color(0xFF60A5FA),
                    ],
                  ),
                ),
              ),
              // Overlay oscuro
              Container(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height,
                decoration: const BoxDecoration(
                  color: Color(0xC8112E44),
                ),
              ),
              // Contenido principal
              Align(
                alignment: const AlignmentDirectional(0, 0.75),
                child: Container(
                  width: 342.1,
                  height: 388.3,
                  decoration: const BoxDecoration(),
                  child: Stack(
                    children: [
                      // Contenedor blanco con contenido
                      Align(
                        alignment: const AlignmentDirectional(0, 1),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: 350.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 70, 0, 0),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                // Año
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                                        child: Text(
                                          '2025',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.inter(
                                            color: const Color(0xFFF0A202),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Título principal
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                                        child: Text(
                                          'Explora los servicios educativos del Perú',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 24,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Ubicación
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 5, 20, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        color: Color(0xFFBBBBBB),
                                        size: 24,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        'Perú',
                                        style: GoogleFonts.inter(
                                          color: const Color(0xFFBBBBBB),
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                // Descripción
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                        child: Text(
                                          'Consulta, compara y encuentra información sobre servicios educativos de manera rápida y sencilla',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.interTight(
                                            fontWeight: FontWeight.w300,
                                            color: Colors.grey[600],
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Botón de acción
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                            builder: (context) => const RootScreen(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xFF94DDBC),
                                        foregroundColor: Colors.black,
                                        elevation: 2,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(60),
                                        ),
                                      ),
                                      child: Text(
                                        '¡Vamos!',
                                        style: GoogleFonts.interTight(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Logo circular
                      Align(
                        alignment: const AlignmentDirectional(0, -1),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Color(0xFF94DDBC),
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 200,
                            height: 200,
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.school,
                              size: 50,
                              color: Colors.white,
                            ),
                          ),
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
    );
  }
}
