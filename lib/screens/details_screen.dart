import 'package:flutter/material.dart';
import '../models/institution.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    final Institution? institution = args is Institution ? args : null;

    return Scaffold(
      appBar: AppBar(title: const Text('Detalles de la Institución')),
      body: institution == null
          ? const Center(child: Text('No se recibió información de la institución'))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header con nombre y estado
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            institution.nombreIE,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Chip(
                                label: Text(institution.nivelModalidad),
                                backgroundColor: Colors.blue.withOpacity(0.2),
                              ),
                              const SizedBox(width: 8),
                              Chip(
                                label: Text(institution.estado),
                                backgroundColor: institution.estado == 'Activo' 
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.orange.withOpacity(0.2),
                              ),
                            ],
                          ),
                        ],
                      ),
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
                ],
              ),
            ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 180,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Text(': '),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }
}
