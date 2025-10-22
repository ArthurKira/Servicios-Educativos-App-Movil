import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

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

  // Estado
  bool _showLayerOptions = false;
  String _selectedBaseLayer = 'Mapa Callejero';

  // Controladores
  late AnimationController _animationController;
  late AnimationController _layerAnimationController;

  // Capas base
  final Map<String, TileLayer> _baseLayers = {};

  @override
  void initState() {
    super.initState();
    _mapController = MapController();
    _setupAnimationControllers();
    _setupBaseLayers();
    _checkPermissions();
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

  void _setupBaseLayers() {
    _baseLayers['Mapa Callejero'] = TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.app_movil_servicios_educativos',
      maxZoom: 18,
      minZoom: 1,
      tileBuilder: (context, tileWidget, tile) {
        return tileWidget;
      },
      errorTileCallback: (tile, error, stackTrace) {
        // Manejar errores de tiles silenciosamente
        // No retornar nada, solo registrar el error
        print('Error cargando tile: $error');
      },
    );
    // Si quieres agregar más capas base en el futuro, lo haces aquí 👆
  }

  Future<void> _checkPermissions() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      LocationPermission permission = await Geolocator.checkPermission();

      if (!serviceEnabled) {
        // Solo abrir configuración si el servicio no está habilitado
        await Geolocator.openLocationSettings();
        return;
      }
      
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // El usuario denegó el permiso
          return;
        }
      }
      
      if (permission == LocationPermission.deniedForever) {
        // El usuario denegó permanentemente el permiso
        return;
      }
    } catch (e) {
      // Manejar errores de permisos silenciosamente
      print('Error al verificar permisos de ubicación: $e');
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    _layerAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🌍 Mapa
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
              _baseLayers[_selectedBaseLayer]!,
              ..._buildOverlayLayers(),
            ],
          ),

          // 🧭 Control de capas
          Positioned(
            top: 50,
            right: 16,
            child: _buildLayerControls(),
          ),

          // 🔍 Control de zoom y ubicación
          Positioned(
            bottom: 100,
            right: 16,
            child: _buildZoomControls(),
          ),
        ],
      ),
    );
  }

  // 🔸 UI: Controles de capas
  Widget _buildLayerControls() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                _showLayerOptions = !_showLayerOptions;
              });
            },
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(8),
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
          if (_showLayerOptions)
            Container(
              width: 200,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: _baseLayers.keys.map((layer) {
                  final isSelected = _selectedBaseLayer == layer;
                  return Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(vertical: 2),
                    child: Material(
                      color: isSelected
                          ? Colors.blue.withOpacity(0.1)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(4),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            _selectedBaseLayer = layer;
                            _showLayerOptions = false;
                          });
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              Icon(
                                _getLayerIcon(layer),
                                size: 16,
                                color:
                                    isSelected ? Colors.blue : Colors.grey[600],
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  layer,
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: isSelected
                                        ? Colors.blue
                                        : Colors.grey[700],
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.normal,
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
      ),
    );
  }



  // 🔸 UI: Controles de Zoom y ubicación
  Widget _buildZoomControls() {
    return Container(
      constraints: const BoxConstraints(minWidth: 48, minHeight: 144),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
          ),
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: _zoomOut,
          ),
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _centerOnUser,
          ),
        ],
      ),
    );
  }


  List<Widget> _buildOverlayLayers() {
    return [];
  }

  // 🌐 Métodos de control
  void _zoomIn() {
    _mapController.move(
      _mapController.camera.center,
      _mapController.camera.zoom + 1,
    );
  }

  void _zoomOut() {
    _mapController.move(
      _mapController.camera.center,
      _mapController.camera.zoom - 1,
    );
  }

  Future<void> _centerOnUser() async {
    try {
      // Verificar permisos antes de obtener ubicación
      LocationPermission permission = await Geolocator.checkPermission();
      
      if (permission == LocationPermission.denied || 
          permission == LocationPermission.deniedForever) {
        // Mostrar mensaje al usuario
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Permisos de ubicación requeridos para esta función'),
              duration: Duration(seconds: 2),
            ),
          );
        }
        return;
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium,
        timeLimit: const Duration(seconds: 10),
      );
      
      final userLocation = LatLng(position.latitude, position.longitude);
      _mapController.move(userLocation, _defaultZoom);
      
    } catch (e) {
      // Si no hay permisos o no se obtiene ubicación
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se pudo obtener la ubicación actual'),
            duration: Duration(seconds: 2),
          ),
        );
      }
      _mapController.move(_defaultPosition, _defaultZoom);
    }
  }

  IconData _getLayerIcon(String layerName) {
    switch (layerName) {
      case 'Mapa Callejero':
        return Icons.map;
      default:
        return Icons.layers;
    }
  }

  // Eventos
  void _onMapTap(TapPosition tapPosition, LatLng point) {
    // Tap en el mapa
  }

  void _onMapLongPress(TapPosition tapPosition, LatLng point) {
    // Long press en el mapa
  }






}
