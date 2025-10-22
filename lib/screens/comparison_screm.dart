import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/institution.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  final List<Institution> _selectedInstitutions = [];
  final int _maxInstitutions = 3;

  final List<Institution> _availableInstitutions = [
    // === Datos de ejemplo ===
    Institution(
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
      codigoModular: '0667089',
      anexo: '0',
      nivelModalidad: 'Secundaria',
      caracteristica: 'No Aplica',
      genero: 'Mixto',
      tipoPrograma: 'No aplica',
      turno: 'Continuo sólo en la mañana',
      estado: 'Activo',
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
      totalMatriculados: 245,
      matriculadosInicial: 45,
      matriculadosPrimaria: 120,
      matriculadosSecundaria: 80,
      matriculadosMasculino: 125,
      matriculadosFemenino: 120,
      totalDocentes: 18,
      docentesInicial: 3,
      docentesPrimaria: 8,
      docentesSecundaria: 7,
      personalAdministrativo: 3,
      personalServicio: 2,
      numeroAulas: 12,
      numeroLaboratorios: 1,
      capacidadBiblioteca: 50,
      areaTotalLocal: 2500.0,
      numeroSecciones: 8,
      anosFuncionamiento: 15,
      ratioDocenteEstudiante: 13.6,
      ),
      Institution(
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
        codigoModular: '1234567',
        anexo: '0',
        nivelModalidad: 'Secundaria',
        caracteristica: 'EIB',
        genero: 'Mixto',
        tipoPrograma: 'No aplica',
        turno: 'Mañana y tarde',
        estado: 'Activo',
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
        totalMatriculados: 850,
        matriculadosInicial: 150,
        matriculadosPrimaria: 400,
        matriculadosSecundaria: 300,
        matriculadosMasculino: 420,
        matriculadosFemenino: 430,
        totalDocentes: 45,
        docentesInicial: 8,
        docentesPrimaria: 20,
        docentesSecundaria: 17,
        personalAdministrativo: 8,
        personalServicio: 5,
        numeroAulas: 35,
        numeroLaboratorios: 4,
        capacidadBiblioteca: 200,
        areaTotalLocal: 8500.0,
        numeroSecciones: 28,
        anosFuncionamiento: 45,
        ratioDocenteEstudiante: 18.9,
      ),
      Institution(
        nombreIE: 'INSTITUTO TECNOLÓGICO LIMA',
        codigoIE: '87654321',
        nombreDRE: 'UGEL Lima',
        codigoDRE: '150001',
        tipoGestion: 'Privada',
        dependencia: 'Sector Educación',
        telefono: '01-9876543',
        correoElectronico: 'info@itlima.edu.pe',
        numeroRUC: '20987654321',
        paginaWeb: 'www.itlima.edu.pe',
        promotorPropietario: 'Corporación Educativa Lima',
        forma: 'Escolarizado',
        razonSocial: 'INSTITUTO TECNOLÓGICO LIMA S.A.C.',
        director: 'carlos rodriguez lopez',
        codigoModular: '9876543',
        anexo: '0',
        nivelModalidad: 'Secundaria',
        caracteristica: 'Técnico',
        genero: 'Mixto',
        tipoPrograma: 'Técnico',
        turno: 'Mañana y tarde',
        estado: 'Activo',
        codigoLocal: '333333',
        localidad: 'San Isidro',
        direccion: 'Av. Javier Prado 456',
        centroPoblado: 'LIMA',
        departamento: 'Lima',
        areaGeografica: 'Urbana',
        provincia: 'Lima',
        distrito: 'San Isidro',
        latitud: '-12.0961',
        longitud: '-77.0300',
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
        otrosServicios: 'Laboratorio de computación, Taller de mecánica, Aula de idiomas',
        totalMatriculados: 320,
        matriculadosInicial: 0,
        matriculadosPrimaria: 0,
        matriculadosSecundaria: 320,
        matriculadosMasculino: 180,
        matriculadosFemenino: 140,
        totalDocentes: 25,
        docentesInicial: 0,
        docentesPrimaria: 0,
        docentesSecundaria: 25,
        personalAdministrativo: 5,
        personalServicio: 3,
        numeroAulas: 20,
        numeroLaboratorios: 6,
        capacidadBiblioteca: 100,
        areaTotalLocal: 4000.0,
        numeroSecciones: 16,
        anosFuncionamiento: 8,
        ratioDocenteEstudiante: 12.8,
      ),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Comparar Instituciones',
          style: GoogleFonts.interTight(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
        actions: [
          if (_selectedInstitutions.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.clear_all),
              onPressed: _clearAllSelections,
              tooltip: 'Limpiar selección',
            ),
        ],
      ),
      body: Column(
        children: [
          _buildHeader(),
          if (_selectedInstitutions.isNotEmpty) _buildSelectedInstitutions(),
          Expanded(child: _buildAvailableInstitutions()),
        ],
      ),
      floatingActionButton: _selectedInstitutions.length >= 2
          ? FloatingActionButton.extended(
        onPressed: _startComparison,
        backgroundColor: const Color(0xFF81C784),
        icon: const Icon(Icons.compare_arrows, color: Colors.white),
        label: Text(
          'Comparar (${_selectedInstitutions.length})',
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      )
          : null,
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Selecciona hasta $_maxInstitutions instituciones para comparar',
            style: GoogleFonts.inter(fontSize: 16,
                fontWeight: FontWeight.w600,
              color: const Color(0xFF2791BF),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Instituciones seleccionadas: ${_selectedInstitutions.length}/$_maxInstitutions',
            style: GoogleFonts.inter(fontSize: 14, color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildSelectedInstitutions() {
    return Container(
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Instituciones seleccionadas:',
            style: GoogleFonts.inter(fontSize: 14,
                fontWeight: FontWeight.w600,
              color: const Color(0xFF4A6741),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedInstitutions.length,
              itemBuilder: (context, index) {
                final institution = _selectedInstitutions[index];
                return IntrinsicWidth(
                  child: Card(
                    color: const Color.fromARGB(255, 200, 234, 201),
                    elevation: 2,
                    margin: const EdgeInsets.only(right: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  institution.nombreIE,
                                  style: GoogleFonts.inter(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              GestureDetector(
                                onTap: () => _removeInstitution(institution),
                                child: const Icon(Icons.close, size: 14),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Text(
                            institution.location,
                            style: GoogleFonts.inter(
                              fontSize: 9,
                              color: Colors.black,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvailableInstitutions() {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: _availableInstitutions.length,
      itemBuilder: (context, index) {
        final institution = _availableInstitutions[index];
        final isSelected = _selectedInstitutions.contains(institution);
        final canSelect = _selectedInstitutions.length < _maxInstitutions || isSelected;

        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          child: Card(
            color: const Color.fromARGB(255, 255, 255, 255),
            elevation: 2,
            child: InkWell(
              onTap: canSelect ? () => _toggleInstitution(institution) : null,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? const Color(0xFF81C784) : const Color.fromARGB(1, 221, 4, 4),
                    width: 2,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isSelected ? const Color(0xFF81C784) : Colors.grey[300],
                          border: Border.all(
                            color: isSelected ? const Color(0xFF81C784) : Colors.grey[400]!,
                            width: 2,
                          ),
                        ),
                        child: isSelected
                            ? const Icon(Icons.check, color: Colors.white, size: 16)
                            : null,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              institution.nombreIE,
                              style: GoogleFonts.inter(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                  color: Colors.black87
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              institution.location,
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                _buildTag(institution.nivelModalidad, const Color(0xFF81C784)),
                                const SizedBox(width: 8),
                                _buildTag('${institution.totalMatriculados} estudiantes', const Color(0xFF5C6BC0)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (isSelected)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: const Color(0xFF81C784),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'Seleccionada',
                            style: GoogleFonts.inter(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  void _toggleInstitution(Institution institution) {
    setState(() {
      if (_selectedInstitutions.contains(institution)) {
        _selectedInstitutions.remove(institution);
      } else if (_selectedInstitutions.length < _maxInstitutions) {
        _selectedInstitutions.add(institution);
      }
    });
  }

  void _removeInstitution(Institution institution) {
    setState(() {
      _selectedInstitutions.remove(institution);
    });
  }

  void _clearAllSelections() {
    setState(() {
      _selectedInstitutions.clear();
    });
  }

  void _startComparison() {
    if (_selectedInstitutions.length >= 2) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ComparisonResultsScreen(institutions: _selectedInstitutions),
        ),
      );
    }
  }
}

class ComparisonResultsScreen extends StatelessWidget {
  final List<Institution> institutions;

  const ComparisonResultsScreen({super.key, required this.institutions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Comparación de Instituciones',
          style: GoogleFonts.interTight(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildComparisonHeader(),
            const SizedBox(height: 16),
            _buildSectionTitle('Información Básica'),
            _buildComparisonTable([
              ['Tipo de Gestión', ...institutions.map((i) => i.tipoGestion)],
              ['Nivel/Modalidad', ...institutions.map((i) => i.nivelModalidad)],
              ['Característica', ...institutions.map((i) => i.caracteristica)],
              ['Género', ...institutions.map((i) => i.genero)],
              ['Estado', ...institutions.map((i) => i.estado)],
              ['Turno', ...institutions.map((i) => i.turno)],
              ['Director(a)', ...institutions.map((i) => i.director)],
              ['Años Funcionamiento', ...institutions.map((i) => '${i.anosFuncionamiento}')],
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('Información de Contacto'),
            _buildComparisonTable([
              ['Teléfono', ...institutions.map((i) => i.telefono.isEmpty ? 'No disponible' : i.telefono)],
              ['Correo Electrónico', ...institutions.map((i) => i.correoElectronico.isEmpty ? 'No disponible' : i.correoElectronico)],
              ['Página Web', ...institutions.map((i) => i.paginaWeb.isEmpty ? 'No disponible' : i.paginaWeb)],
              ['Dirección', ...institutions.map((i) => i.direccion)],
              ['Área Geográfica', ...institutions.map((i) => i.areaGeografica)],
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('Estadísticas de Matrícula'),
            _buildComparisonTable([
              ['Total Matriculados', ...institutions.map((i) => '${i.totalMatriculados}')],
              ['Matriculados Inicial', ...institutions.map((i) => '${i.matriculadosInicial}')],
              ['Matriculados Primaria', ...institutions.map((i) => '${i.matriculadosPrimaria}')],
              ['Matriculados Secundaria', ...institutions.map((i) => '${i.matriculadosSecundaria}')],
              ['Matriculados Masculino', ...institutions.map((i) => '${i.matriculadosMasculino}')],
              ['Matriculados Femenino', ...institutions.map((i) => '${i.matriculadosFemenino}')],
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('Recursos Humanos'),
            _buildComparisonTable([
              ['Total Docentes', ...institutions.map((i) => '${i.totalDocentes}')],
              ['Docentes Inicial', ...institutions.map((i) => '${i.docentesInicial}')],
              ['Docentes Primaria', ...institutions.map((i) => '${i.docentesPrimaria}')],
              ['Docentes Secundaria', ...institutions.map((i) => '${i.docentesSecundaria}')],
              ['Personal Administrativo', ...institutions.map((i) => '${i.personalAdministrativo}')],
              ['Personal de Servicio', ...institutions.map((i) => '${i.personalServicio}')],
              ['Ratio Docente/Estudiante', ...institutions.map((i) => '${i.ratioDocenteEstudiante.toStringAsFixed(1)}')],
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('Infraestructura'),
            _buildComparisonTable([
              ['Número de Aulas', ...institutions.map((i) => '${i.numeroAulas}')],
              ['Número de Laboratorios', ...institutions.map((i) => '${i.numeroLaboratorios}')],
              ['Capacidad Biblioteca', ...institutions.map((i) => '${i.capacidadBiblioteca}')],
              ['Área Total (m²)', ...institutions.map((i) => '${i.areaTotalLocal.toStringAsFixed(0)}')],
              ['Número de Secciones', ...institutions.map((i) => '${i.numeroSecciones}')],
            ]),
            const SizedBox(height: 16),
            _buildSectionTitle('Servicios Disponibles'),
            _buildServicesComparison(),
          ],
        ),
      ),
    );
  }

  Widget _buildComparisonHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: const Color(0xFFC8EAC9).withOpacity(0.08), blurRadius: 10)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comparación de ${institutions.length} Instituciones',
            style: GoogleFonts.interTight(fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black87),
          ),
          const SizedBox(height: 16),
          Row(
            children: institutions.map((institution) {
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF81C784).withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFF81C784).withOpacity(0.3), width: 1),
                  ),
                  child: Column(
                    children: [
                      Text(
                        institution.nombreIE,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF4A6741),
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        institution.location,
                        style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: GoogleFonts.interTight(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black87),
      ),
    );
  }

  Widget _buildComparisonTable(List<List<String>> rows) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Table(
        columnWidths: {
          0: const FlexColumnWidth(2),
          for (int i = 1; i <= institutions.length; i++) i: const FlexColumnWidth(3),
        },
        border: TableBorder.symmetric(
          inside: const BorderSide(color: Colors.grey, width: 0.2),
        ),
        children: rows.map((row) {
          return TableRow(
            decoration: BoxDecoration(color: Colors.grey[50]),
            children: row.map((cell) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  cell,
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildServicesComparison() {
    final services = [
      {'name': 'Internet', 'getter': (Institution i) => i.servicioInternet},
      {'name': 'Agua', 'getter': (Institution i) => i.servicioAgua},
      {'name': 'Luz', 'getter': (Institution i) => i.servicioLuz},
      {'name': 'Desagüe', 'getter': (Institution i) => i.servicioDesague},
      {'name': 'Teléfono', 'getter': (Institution i) => i.servicioTelefono},
      {'name': 'Gas', 'getter': (Institution i) => i.servicioGas},
      {'name': 'Biblioteca', 'getter': (Institution i) => i.biblioteca},
      {'name': 'Laboratorio', 'getter': (Institution i) => i.laboratorio},
      {'name': 'Cancha Deportiva', 'getter': (Institution i) => i.canchaDeportiva},
      {'name': 'Comedor', 'getter': (Institution i) => i.comedor},
      {'name': 'Servicios Higiénicos', 'getter': (Institution i) => i.serviciosHigienicos},
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 5)],
      ),
      child: Table(
        columnWidths: {
          0: const FlexColumnWidth(2),
          for (int i = 1; i <= institutions.length; i++) i: const FlexColumnWidth(3),
        },
        border: TableBorder.symmetric(
          inside: const BorderSide(color: Colors.grey, width: 0.2),
        ),
        children: [
          // Header row
          TableRow(
            decoration: BoxDecoration(color: const Color(0xFF81C784).withOpacity(0.05)),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Servicio',
                  style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.black87),
                ),
              ),
              ...institutions.map((institution) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  institution.nombreIE,
                  style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w600, color: Colors.black87),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
            ],
          ),
          // Service rows
          ...services.map((service) {
            return TableRow(
              decoration: BoxDecoration(color: Colors.grey[50]),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    service['name'] as String,
                    style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
                  ),
                ),
                ...institutions.map((institution) {
                  final hasService = (service['getter'] as bool Function(Institution))(institution);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          hasService ? Icons.check_circle : Icons.cancel,
                          color: hasService ? Colors.green : Colors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          hasService ? 'Sí' : 'No',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: hasService ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            );
          }),
          // Otros servicios row
          TableRow(
            decoration: BoxDecoration(color: Colors.grey[50]),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Otros Servicios',
                  style: GoogleFonts.inter(fontSize: 12, color: Colors.black87),
                ),
              ),
              ...institutions.map((institution) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  institution.otrosServicios.isEmpty ? 'No especificado' : institution.otrosServicios,
                  style: GoogleFonts.inter(fontSize: 10, color: Colors.black87),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
