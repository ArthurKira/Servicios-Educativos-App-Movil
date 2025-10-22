import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/institution.dart';
import '../widgets/institution_card.dart';

class ServiciosEducativosScreen extends StatelessWidget {
  const ServiciosEducativosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Institution> institutions = [
      Institution(
        // DATOS DE LA IE
        nombreIE: 'ALMIRANTE MIGUEL GRAU',
        codigoIE: '26394252',
        nombreDRE: 'UGEL Huancayo',
        codigoDRE: '120001',
        tipoGestion: 'Pública de gestión directa',
        dependencia: 'Sector Educación',
        telefono: '',
        correoElectronico: '',
        numeroRUC: '',
        paginaWeb: '',
        promotorPropietario: '',
        forma: 'Escolarizado',
        razonSocial: '',
        director: 'tomas diaz mauro',

        // DATOS DEL SERVICIO EDUCATIVO
        codigoModular: '0667089',
        anexo: '0',
        nivelModalidad: 'Secundaria',
        caracteristica: 'No Aplica',
        genero: 'Mixto',
        tipoPrograma: 'No aplica',
        turno: 'Continuo sólo en la mañana',
        estado: 'Activo',

        // DATOS DEL LOCAL EDUCATIVO
        codigoLocal: '222341',
        localidad: '',
        direccion: 'calle manco capac s/n',
        centroPoblado: 'CHUPURO',
        departamento: 'Junín',
        areaGeografica: 'Urbana',
        provincia: 'Huancayo',
        distrito: 'Chupuro',
        latitud: '-12.1573',
        longitud: '-75.2444',

        // SERVICIOS DISPONIBLES
        servicioInternet: true,
        servicioAgua: true,
        servicioLuz: true,
        servicioDesague: true,
        servicioTelefono: false,
        servicioGas: false,
        biblioteca: true,
        laboratorio: false,
        canchaDeportiva: true,
        comedor: false,
        serviciosHigienicos: true,
        otrosServicios: 'Aula de cómputo, Taller de arte',

        // ESTADÍSTICAS DE MATRÍCULA
        totalMatriculados: 245,
        matriculadosInicial: 45,
        matriculadosPrimaria: 120,
        matriculadosSecundaria: 80,
        matriculadosMasculino: 125,
        matriculadosFemenino: 120,

        // RECURSOS HUMANOS
        totalDocentes: 18,
        docentesInicial: 3,
        docentesPrimaria: 8,
        docentesSecundaria: 7,
        personalAdministrativo: 3,
        personalServicio: 2,

        // INFRAESTRUCTURA
        numeroAulas: 12,
        numeroLaboratorios: 1,
        capacidadBiblioteca: 50,
        areaTotalLocal: 2500.0,
        numeroSecciones: 8,

        // INDICADORES DE CALIDAD
        anosFuncionamiento: 15,
        ratioDocenteEstudiante: 13.6,
      ),
      Institution(
        // DATOS DE LA IE
        nombreIE: 'COLEGIO NACIONAL SAN MARTIN',
        codigoIE: '12345678',
        nombreDRE: 'UGEL Lima',
        codigoDRE: '150001',
        tipoGestion: 'Pública de gestión directa',
        dependencia: 'Sector Educación',
        telefono: '01-2345678',
        correoElectronico: 'sanmartin@edu.pe',
        numeroRUC: '20123456789',
        paginaWeb: 'www.sanmartin.edu.pe',
        promotorPropietario: 'Ministerio de Educación',
        forma: 'Escolarizado',
        razonSocial: 'COLEGIO NACIONAL SAN MARTIN',
        director: 'maria gonzalez perez',
        
        // DATOS DEL SERVICIO EDUCATIVO
        codigoModular: '1234567',
        anexo: '0',
        nivelModalidad: 'Secundaria',
        caracteristica: 'EIB',
        genero: 'Mixto',
        tipoPrograma: 'No aplica',
        turno: 'Mañana y tarde',
        estado: 'Activo',
        
        // DATOS DEL LOCAL EDUCATIVO
        codigoLocal: '111111',
        localidad: 'Lima Centro',
        direccion: 'Av. San Martin 123',
        centroPoblado: 'LIMA',
        departamento: 'Lima',
        areaGeografica: 'Urbana',
        provincia: 'Lima',
        distrito: 'Lima',
        latitud: '-12.0464',
        longitud: '-77.0428',
        
        // SERVICIOS DISPONIBLES
        servicioInternet: true,
        servicioAgua: true,
        servicioLuz: true,
        servicioDesague: true,
        servicioTelefono: true,
        servicioGas: true,
        biblioteca: true,
        laboratorio: true,
        canchaDeportiva: true,
        comedor: true,
        serviciosHigienicos: true,
        otrosServicios: 'Aula de cómputo, Laboratorio de idiomas, Sala de música, Auditorio',
        
        // ESTADÍSTICAS DE MATRÍCULA
        totalMatriculados: 850,
        matriculadosInicial: 150,
        matriculadosPrimaria: 400,
        matriculadosSecundaria: 300,
        matriculadosMasculino: 420,
        matriculadosFemenino: 430,
        
        // RECURSOS HUMANOS
        totalDocentes: 45,
        docentesInicial: 8,
        docentesPrimaria: 20,
        docentesSecundaria: 17,
        personalAdministrativo: 8,
        personalServicio: 5,
        
        // INFRAESTRUCTURA
        numeroAulas: 35,
        numeroLaboratorios: 4,
        capacidadBiblioteca: 200,
        areaTotalLocal: 8500.0,
        numeroSecciones: 28,
        
        // INDICADORES DE CALIDAD
        anosFuncionamiento: 45,
        ratioDocenteEstudiante: 18.9,
      ),
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: institutions.length,
        itemBuilder: (context, index) {
          return InstitutionCard(institution: institutions[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/comparison');
        },
        backgroundColor: const Color(0xFF94DDBC),
        icon: const Icon(Icons.compare_arrows, color: Colors.white),
        label: Text(
          'Comparar',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
