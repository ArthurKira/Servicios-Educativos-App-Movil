import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import '../models/institution.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final Institution? institution = args is Institution ? args : null;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          'Detalles de la Institución',
          style: GoogleFonts.interTight(
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
        centerTitle: true,
      ),
      body: institution == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    size: 64,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No se recibió información de la institución',
                    style: GoogleFonts.inter(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header con nombre y estado
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          institution.nombreIE,
                          style: GoogleFonts.interTight(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: const Color(0xFF94DDBC).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: const Color(0xFF94DDBC),
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                institution.nivelModalidad,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFF2D5A3D),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                              decoration: BoxDecoration(
                                color: institution.estado == 'Activo' 
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.orange.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: institution.estado == 'Activo' 
                                      ? Colors.green
                                      : Colors.orange,
                                  width: 1,
                                ),
                              ),
                              child: Text(
                                institution.estado,
                                style: GoogleFonts.inter(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: institution.estado == 'Activo' 
                                      ? Colors.green[800]
                                      : Colors.orange[800],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),

                  // DATOS DE LA IE
                  _buildSection(
                    context,
                    'DATOS DE LA IE',
                    [
                      _buildInfoRow('Nombre de la IE', institution.nombreIE),
                      _buildInfoRow('Código de la IE', institution.codigoIE),
                      _buildInfoRow('Nombre de la DRE o UGEL', institution.nombreDRE),
                      _buildInfoRow('Código de DRE o UGEL', institution.codigoDRE),
                      _buildInfoRow('Tipo de Gestión', institution.tipoGestion),
                      _buildInfoRow('Dependencia', institution.dependencia),
                      _buildInfoRow('Teléfono', institution.telefono.isEmpty ? 'No disponible' : institution.telefono),
                      _buildInfoRow('Correo electrónico', institution.correoElectronico.isEmpty ? 'No disponible' : institution.correoElectronico),
                      _buildInfoRow('Número de RUC', institution.numeroRUC.isEmpty ? 'No disponible' : institution.numeroRUC),
                      _buildInfoRow('Página web', institution.paginaWeb.isEmpty ? 'No disponible' : institution.paginaWeb),
                      _buildInfoRow('Promotor o Propietario', institution.promotorPropietario.isEmpty ? 'No disponible' : institution.promotorPropietario),
                      _buildInfoRow('Forma', institution.forma),
                      _buildInfoRow('Razón social', institution.razonSocial.isEmpty ? 'No disponible' : institution.razonSocial),
                      _buildInfoRow('Director(a)', institution.director),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // DATOS DEL SERVICIO EDUCATIVO
                  _buildSection(
                    context,
                    'DATOS DEL SERVICIO EDUCATIVO',
                    [
                      _buildInfoRow('Código modular', institution.codigoModular),
                      _buildInfoRow('Anexo', institution.anexo),
                      _buildInfoRow('Nivel/Modalidad', institution.nivelModalidad),
                      _buildInfoRow('Característica (Censo Educativo 2024)', institution.caracteristica),
                      _buildInfoRow('Género', institution.genero),
                      _buildInfoRow('Tipo de programa', institution.tipoPrograma),
                      _buildInfoRow('Turno', institution.turno),
                      _buildInfoRow('Estado', institution.estado),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // DATOS DEL LOCAL EDUCATIVO
                  _buildSection(
                    context,
                    'DATOS DEL LOCAL EDUCATIVO',
                    [
                      _buildInfoRow('Código de local', institution.codigoLocal),
                      _buildInfoRow('Localidad', institution.localidad.isEmpty ? 'No disponible' : institution.localidad),
                      _buildInfoRow('Dirección', institution.direccion),
                      _buildInfoRow('Centro Poblado', institution.centroPoblado),
                      _buildInfoRow('Departamento', institution.departamento),
                      _buildInfoRow('Área geográfica', institution.areaGeografica),
                      _buildInfoRow('Provincia', institution.provincia),
                      _buildInfoRow('Latitud', institution.latitud),
                      _buildInfoRow('Distrito', institution.distrito),
                      _buildInfoRow('Longitud', institution.longitud),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // SERVICIOS DISPONIBLES
                  _buildServicesSection(context, institution),

                  const SizedBox(height: 16),

                  // ESTADÍSTICAS E INDICADORES
                  _buildStatisticsSection(context, institution),

                  const SizedBox(height: 16),

                  // UBICACIÓN EN EL MAPA
                  _buildLocationSection(context, institution),
                ],
              ),
            ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF94DDBC).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                title,
                style: GoogleFonts.interTight(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2D5A3D),
                ),
              ),
            ),
            const SizedBox(height: 16),
            LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  // Layout de dos columnas para pantallas grandes
                  return Column(
                    children: [
                      for (int i = 0; i < children.length; i += 2)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: children[i],
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: i + 1 < children.length ? children[i + 1] : const SizedBox(),
                            ),
                          ],
                        ),
                    ],
                  );
                } else {
                  // Layout de una columna para pantallas pequeñas
                  return Column(children: children);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.grey[200]!,
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: GoogleFonts.inter(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Colors.grey[700],
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServicesSection(BuildContext context, Institution institution) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF94DDBC).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.build,
                    color: Color(0xFF2D5A3D),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'SERVICIOS DISPONIBLES',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D5A3D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Servicios básicos
            _buildServiceCategory(
              'Servicios Básicos',
              [
                _buildServiceItem('Internet', institution.servicioInternet, Icons.wifi),
                _buildServiceItem('Agua', institution.servicioAgua, Icons.water_drop),
                _buildServiceItem('Luz Eléctrica', institution.servicioLuz, Icons.electrical_services),
                _buildServiceItem('Desagüe', institution.servicioDesague, Icons.plumbing),
                _buildServiceItem('Teléfono', institution.servicioTelefono, Icons.phone),
                _buildServiceItem('Gas', institution.servicioGas, Icons.local_fire_department),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Servicios educativos
            _buildServiceCategory(
              'Servicios Educativos',
              [
                _buildServiceItem('Biblioteca', institution.biblioteca, Icons.library_books),
                _buildServiceItem('Laboratorio', institution.laboratorio, Icons.science),
                _buildServiceItem('Cancha Deportiva', institution.canchaDeportiva, Icons.sports_soccer),
                _buildServiceItem('Comedor', institution.comedor, Icons.restaurant),
                _buildServiceItem('Servicios Higiénicos', institution.serviciosHigienicos, Icons.wash),
              ],
            ),
            
            // Otros servicios
            if (institution.otrosServicios.isNotEmpty) ...[
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey[200]!,
                    width: 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue[600],
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Otros Servicios',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      institution.otrosServicios,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildServiceCategory(String title, List<Widget> services) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: services,
        ),
      ],
    );
  }

  Widget _buildServiceItem(String name, bool available, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: available 
            ? const Color(0xFF94DDBC).withOpacity(0.2)
            : Colors.grey[100],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: available 
              ? const Color(0xFF94DDBC)
              : Colors.grey[300]!,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: available 
                ? const Color(0xFF2D5A3D)
                : Colors.grey[500],
          ),
          const SizedBox(width: 6),
          Text(
            name,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: available 
                  ? const Color(0xFF2D5A3D)
                  : Colors.grey[600],
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            available ? Icons.check_circle : Icons.cancel,
            size: 14,
            color: available 
                ? Colors.green[600]
                : Colors.red[400],
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsSection(BuildContext context, Institution institution) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF94DDBC).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.analytics,
                    color: Color(0xFF2D5A3D),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'ESTADÍSTICAS E INDICADORES',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D5A3D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Estadísticas de matrícula
            _buildStatCategory(
              'Matrícula Estudiantil',
              [
                _buildStatCard('Total Matriculados', '${institution.totalMatriculados}', Icons.school, Colors.blue),
                _buildStatCard('Inicial', '${institution.matriculadosInicial}', Icons.child_care, Colors.purple),
                _buildStatCard('Primaria', '${institution.matriculadosPrimaria}', Icons.school, Colors.green),
                _buildStatCard('Secundaria', '${institution.matriculadosSecundaria}', Icons.school, Colors.orange),
                _buildStatCard('Masculino', '${institution.matriculadosMasculino}', Icons.male, Colors.blue),
                _buildStatCard('Femenino', '${institution.matriculadosFemenino}', Icons.female, Colors.pink),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Recursos humanos
            _buildStatCategory(
              'Recursos Humanos',
              [
                _buildStatCard('Total Docentes', '${institution.totalDocentes}', Icons.person, Colors.indigo),
                _buildStatCard('Doc. Inicial', '${institution.docentesInicial}', Icons.person, Colors.purple),
                _buildStatCard('Doc. Primaria', '${institution.docentesPrimaria}', Icons.person, Colors.green),
                _buildStatCard('Doc. Secundaria', '${institution.docentesSecundaria}', Icons.person, Colors.orange),
                _buildStatCard('Personal Admin.', '${institution.personalAdministrativo}', Icons.admin_panel_settings, Colors.grey),
                _buildStatCard('Personal Servicio', '${institution.personalServicio}', Icons.cleaning_services, Colors.brown),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Infraestructura
            _buildStatCategory(
              'Infraestructura',
              [
                _buildStatCard('Número de Aulas', '${institution.numeroAulas}', Icons.meeting_room, Colors.teal),
                _buildStatCard('Laboratorios', '${institution.numeroLaboratorios}', Icons.science, Colors.cyan),
                _buildStatCard('Cap. Biblioteca', '${institution.capacidadBiblioteca}', Icons.library_books, Colors.amber),
                _buildStatCard('Área Total (m²)', '${institution.areaTotalLocal.toStringAsFixed(0)}', Icons.square_foot, Colors.deepOrange),
                _buildStatCard('Secciones', '${institution.numeroSecciones}', Icons.group, Colors.lightBlue),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Indicadores de calidad
            _buildStatCategory(
              'Indicadores de Calidad',
              [
                _buildStatCard('Años Funcionamiento', '${institution.anosFuncionamiento}', Icons.calendar_today, Colors.red),
                _buildStatCard('Ratio Doc/Estud', '${institution.ratioDocenteEstudiante.toStringAsFixed(1)}', Icons.trending_up, Colors.green),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCategory(String title, List<Widget> stats) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        LayoutBuilder(
          builder: (context, constraints) {
            // Calcular el número de columnas basado en el ancho disponible
            final cardWidth = 100.0; // Ancho mínimo de cada tarjeta
            final spacing = 8.0;
            final columns = ((constraints.maxWidth + spacing) / (cardWidth + spacing)).floor();
            final actualColumns = columns > 0 ? columns : 1;
            
            return Column(
              children: [
                for (int i = 0; i < stats.length; i += actualColumns)
                  Padding(
                    padding: EdgeInsets.only(bottom: i + actualColumns < stats.length ? 8 : 0),
                    child: Row(
                      children: [
                        for (int j = 0; j < actualColumns; j++)
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(
                                right: j < actualColumns - 1 ? spacing : 0,
                              ),
                              child: i + j < stats.length ? stats[i + j] : const SizedBox(),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 18,
            color: color,
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  // 🔧 Método para parsear y validar coordenadas
  ({double latitude, double longitude})? _parseCoordinates(String latStr, String lonStr) {
    final lat = double.tryParse(latStr);
    final lon = double.tryParse(lonStr);
    
    // Validar que las coordenadas estén en rangos válidos
    if (lat == null || lon == null) return null;
    if (lat < -90 || lat > 90) return null;
    if (lon < -180 || lon > 180) return null;
    
    return (latitude: lat, longitude: lon);
  }

  Widget _buildLocationSection(BuildContext context, Institution institution) {
    // Parsear y validar coordenadas
    final coordinates = _parseCoordinates(institution.latitud, institution.longitud);
    
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF94DDBC).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Color(0xFF2D5A3D),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'UBICACIÓN EN EL MAPA',
                    style: GoogleFonts.interTight(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2D5A3D),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Información de coordenadas
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.gps_fixed,
                    color: Colors.blue[600],
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Coordenadas: ${institution.latitud}, ${institution.longitud}',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[700],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // Mapa
            if (coordinates != null)
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: InstitutionMapWidget(
                    latitude: coordinates.latitude,
                    longitude: coordinates.longitude,
                    institutionName: institution.nombreIE,
                    address: institution.direccion,
                  ),
                ),
              )
            else
              Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey[300]!,
                    width: 1,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_off,
                        size: 48,
                        color: Colors.grey[400],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Coordenadas no disponibles',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class InstitutionMapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;
  final String institutionName;
  final String address;

  const InstitutionMapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    required this.institutionName,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    final institutionPoint = LatLng(latitude, longitude);
    
    return FlutterMap(
      options: MapOptions(
        initialCenter: institutionPoint,
        initialZoom: 15.0,
        minZoom: 10.0,
        maxZoom: 18.0,
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all & ~InteractiveFlag.rotate,
        ),
      ),
      children: [
        // 🗺️ Capa base - OpenStreetMap seguro
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app_movil_servicios_educativos',
        ),
        
        // 📍 Marcador de la institución
        MarkerLayer(
          markers: [
            Marker(
              point: institutionPoint,
              width: 50,
              height: 50,
              child: _buildInstitutionMarker(),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInstitutionMarker() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF2D5A3D),
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const Icon(
        Icons.school,
        color: Colors.white,
        size: 24,
      ),
    );
  }
}

