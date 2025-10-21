import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsScreen extends StatefulWidget {
  const MapsScreen({super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> with TickerProviderStateMixin {
  late MapController _mapController;
  
  // Configuración del mapa
  final LatLng _defaultPosition = const LatLng(-12.0464, -77.0428);
  final double _defaultZoom = 14.0;
  
  // Estado del mapa
  bool _isAnimating = false;
  
  
  
  // Controladores de animación
  late AnimationController _animationController;
  late AnimationController _layerAnimationController;
  
  // Configuración de capas base
  final Map<String, TileLayer> _baseLayers = {};
  
  String _selectedBaseLayer = 'Mapa Callejero';
  bool _showLayerOptions = false;
  

  @override
  void initState() {
    super.initState();
    _initializeMap();
    _setupAnimationControllers();
    _setupBaseLayers();
  }

  void _setupAnimationControllers() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );
    
    _layerAnimationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  void _initializeMap() {
    _mapController = MapController();
  }

  void _setupBaseLayers() {
    // Solo capa de mapa callejero confiable
    _baseLayers['Mapa Callejero'] = TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app_movil_servicios_educativos',
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _layerAnimationController.dispose();
    _cleanup();
    super.dispose();
  }

  void _cleanup() {
    // Limpieza de recursos
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mapa principal
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: _defaultPosition,
              initialZoom: _defaultZoom,
              minZoom: 3.0,
              maxZoom: 18.0,
              onTap: _onMapTap,
              onLongPress: _onMapLongPress,
            ),
            children: [
              // Capa base
              _baseLayers[_selectedBaseLayer] ?? _baseLayers['Mapa Callejero']!,
              
              // Capas superpuestas dinámicas
              ..._buildOverlayLayers(),
            ],
          ),
          
          // Controles de capas
          Positioned(
            top: 50,
            right: 16,
            child: _buildLayerControls(),
          ),
          
          // Controles de zoom
          Positioned(
            bottom: 100,
            right: 16,
            child: _buildZoomControls(),
          ),
          
        ],
      ),
    );
  }

  Widget _buildLayerControls() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Botón principal (icono de capas)
          Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                setState(() {
                  _showLayerOptions = !_showLayerOptions;
                });
              },
              borderRadius: BorderRadius.circular(4),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.layers, color: Colors.blue, size: 24),
                  if (_showLayerOptions) ...[
                    const SizedBox(width: 8),
                    const Text(
                      'Capas',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
          
          // Opciones de capas (expandibles)
          if (_showLayerOptions) ...[
            Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _baseLayers.keys.map((String layer) {
                  final isSelected = _selectedBaseLayer == layer;
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Material(
                      color: isSelected ? Colors.blue.withValues(alpha: 0.1) : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedBaseLayer = layer;
                            _showLayerOptions = false;
                          });
                          _changeBaseLayer(layer);
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              Icon(
                                _getLayerIcon(layer),
                                size: 16,
                                color: isSelected ? Colors.blue : Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  layer,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected ? Colors.blue : Colors.grey[700],
                                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                              ),
                              if (isSelected)
                                const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.blue,
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }



  Widget _buildZoomControls() {
    return Container(
      constraints: const BoxConstraints(
        minWidth: 48,
        minHeight: 144,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _zoomIn,
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _zoomOut,
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _centerOnUser,
            constraints: const BoxConstraints(
              minWidth: 48,
              minHeight: 48,
            ),
          ),
        ],
      ),
    );
  }


  List<Widget> _buildOverlayLayers() {
    return [];
  }

  // Métodos de control del mapa
  void _zoomIn() {
    _mapController.move(_mapController.camera.center, _mapController.camera.zoom + 1);
  }

  void _zoomOut() {
    _mapController.move(_mapController.camera.center, _mapController.camera.zoom - 1);
  }

  void _centerOnUser() {
    // Implementar centrado en ubicación del usuario
    _mapController.move(_defaultPosition, _defaultZoom);
  }

  void _changeBaseLayer(String layerName) {
    setState(() {
      _selectedBaseLayer = layerName;
    });
  }

  IconData _getLayerIcon(String layerName) {
    switch (layerName) {
      case 'Mapa Callejero':
        return Icons.map;
      default:
        return Icons.map;
    }
  }

  // Eventos del mapa
  void _onMapTap(TapPosition tapPosition, LatLng point) {
    if (_isAnimating) return;
    
    // Funcionalidad de marcadores deshabilitada
    // No se implementará en esta aplicación
  }

  void _onMapLongPress(TapPosition tapPosition, LatLng point) {
    // Implementar funcionalidad de long press si es necesario
    _onMapTap(tapPosition, point);
  }






}
