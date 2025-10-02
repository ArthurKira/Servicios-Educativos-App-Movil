class Institution {
  // DATOS DE LA IE
  final String nombreIE;
  final String codigoIE;
  final String nombreDRE;
  final String codigoDRE;
  final String tipoGestion;
  final String dependencia;
  final String telefono;
  final String correoElectronico;
  final String numeroRUC;
  final String paginaWeb;
  final String promotorPropietario;
  final String forma;
  final String razonSocial;
  final String director;

  // DATOS DEL SERVICIO EDUCATIVO
  final String codigoModular;
  final String anexo;
  final String nivelModalidad;
  final String caracteristica;
  final String genero;
  final String tipoPrograma;
  final String turno;
  final String estado;

  // DATOS DEL LOCAL EDUCATIVO
  final String codigoLocal;
  final String localidad;
  final String direccion;
  final String centroPoblado;
  final String departamento;
  final String areaGeografica;
  final String provincia;
  final String latitud;
  final String distrito;
  final String longitud;

  Institution({
    // DATOS DE LA IE
    required this.nombreIE,
    required this.codigoIE,
    required this.nombreDRE,
    required this.codigoDRE,
    required this.tipoGestion,
    required this.dependencia,
    required this.telefono,
    required this.correoElectronico,
    required this.numeroRUC,
    required this.paginaWeb,
    required this.promotorPropietario,
    required this.forma,
    required this.razonSocial,
    required this.director,
    
    // DATOS DEL SERVICIO EDUCATIVO
    required this.codigoModular,
    required this.anexo,
    required this.nivelModalidad,
    required this.caracteristica,
    required this.genero,
    required this.tipoPrograma,
    required this.turno,
    required this.estado,
    
    // DATOS DEL LOCAL EDUCATIVO
    required this.codigoLocal,
    required this.localidad,
    required this.direccion,
    required this.centroPoblado,
    required this.departamento,
    required this.areaGeografica,
    required this.provincia,
    required this.latitud,
    required this.distrito,
    required this.longitud,
  });

  // Getters para compatibilidad con el código existente
  String get name => nombreIE;
  String get location => '$distrito, $provincia, $departamento';
  String get type => tipoGestion;
  String get level => nivelModalidad;
}
