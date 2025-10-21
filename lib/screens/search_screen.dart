import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String? _tipoBusqueda;
  String? _departamento;
  String? _provincia;
  String? _distrito;
  String? _tipoGestion;
  String? _nivelEducativo;
  
  final TextEditingController _codigoController = TextEditingController();
  final TextEditingController _nombreController = TextEditingController();

  @override
  void dispose() {
    _codigoController.dispose();
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFF94DDBC),
        automaticallyImplyLeading: false,
        title: Text(
          'Buscar Servicio Educativo',
          style: GoogleFonts.interTight(
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Búsquedas Rápidas
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 0, 16),
              child: Text(
                'Búsquedas Rápidas',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 170,
              decoration: const BoxDecoration(
                color: Colors.transparent,
              ),
              child: ListView(
                padding: EdgeInsets.zero,
                primary: false,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  _buildQuickSearchCard('Radio de 5Km', Icons.location_on, () {}),
                  _buildQuickSearchCard('Radio de 10Km', Icons.location_on, () {}),
                  _buildQuickSearchCard('Radio de 15Km', Icons.location_on, () {}),
                ],
              ),
            ),
            
            // Filtros
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 20, 0, 16),
              child: Text(
                'Filtros',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[700],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 12, 0, 44),
              child: Column(
                children: [
                  _buildFilterDropdown('Tipo de Búsqueda', _tipoBusqueda, 
                    ['Por Código Modular', 'Por Nombre', 'Por Ubicación'], (value) {
                      setState(() => _tipoBusqueda = value);
                    }),
                  _buildFilterDropdown('Departamento', _departamento, 
                    ['Lima', 'Arequipa', 'Cusco', 'Trujillo'], (value) {
                      setState(() => _departamento = value);
                    }),
                  _buildFilterDropdown('Provincia', _provincia, 
                    ['Lima', 'Callao', 'Arequipa'], (value) {
                      setState(() => _provincia = value);
                    }),
                  _buildFilterDropdown('Distrito', _distrito, 
                    ['Miraflores', 'San Isidro', 'La Molina'], (value) {
                      setState(() => _distrito = value);
                    }),
                  _buildTextField('Código Modular', _codigoController, 'Ingrese código modular'),
                  _buildTextField('Nombre del Servicio', _nombreController, 'Ingrese nombre del servicio'),
                  _buildFilterDropdown('Tipo de Gestión', _tipoGestion, 
                    ['Pública', 'Privada', 'Convenio'], (value) {
                      setState(() => _tipoGestion = value);
                    }),
                  _buildFilterDropdown('Nivel Educativo', _nivelEducativo, 
                    ['Inicial', 'Primaria', 'Secundaria'], (value) {
                      setState(() => _nivelEducativo = value);
                    }),
                  _buildSearchButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickSearchCard(String title, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 12, 12),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 160,
          height: 100,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFF94DDBC).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    icon,
                    color: const Color(0xFF94DDBC),
                    size: 30,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFilterDropdown(String label, String? value, List<String> options, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              hint: Text(
                label,
                style: GoogleFonts.inter(
                  color: Colors.grey[600],
                  fontSize: 14,
                ),
              ),
              isExpanded: true,
              dropdownColor: Colors.white,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.black87,
              ),
              items: options.map((String option) {
                return DropdownMenuItem<String>(
                  value: option,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      option,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              icon: Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.grey[600],
                size: 24,
              ),
              selectedItemBuilder: (BuildContext context) {
                return options.map<Widget>((String item) {
                  return Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      item,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: Colors.black.withOpacity(0.1),
              offset: const Offset(0, 2),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              hintText: hint,
              border: InputBorder.none,
              labelStyle: GoogleFonts.inter(
                color: Colors.grey[600],
                fontSize: 14,
              ),
              hintStyle: GoogleFonts.inter(
                color: Colors.grey[500],
                fontSize: 14,
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 14,
              color: Colors.black87,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchButton() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 0),
      child: SizedBox(
        width: double.infinity,
        height: 50,
        child: ElevatedButton.icon(
          onPressed: () {
            // Aquí implementarías la lógica de búsqueda
            print('Buscando...');
          },
          icon: const Icon(Icons.search, size: 20),
          label: Text(
            'Buscar',
            style: GoogleFonts.interTight(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF94DDBC),
            foregroundColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        ),
      ),
    );
  }
}
