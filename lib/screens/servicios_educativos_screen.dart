import 'package:flutter/material.dart';
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
      ),
    ];

    return ListView.builder(
      itemCount: institutions.length,
      itemBuilder: (context, index) {
        return InstitutionCard(institution: institutions[index]);
      },
    );
  }
}
