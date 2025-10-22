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

  // SERVICIOS DISPONIBLES
  final bool servicioInternet;
  final bool servicioAgua;
  final bool servicioLuz;
  final bool servicioDesague;
  final bool servicioTelefono;
  final bool servicioGas;
  final bool biblioteca;
  final bool laboratorio;
  final bool canchaDeportiva;
  final bool comedor;
  final bool serviciosHigienicos;
  final String otrosServicios;

  // ESTADÍSTICAS DE MATRÍCULA
  final int totalMatriculados;
  final int matriculadosInicial;
  final int matriculadosPrimaria;
  final int matriculadosSecundaria;
  final int matriculadosMasculino;
  final int matriculadosFemenino;

  // RECURSOS HUMANOS
  final int totalDocentes;
  final int docentesInicial;
  final int docentesPrimaria;
  final int docentesSecundaria;
  final int personalAdministrativo;
  final int personalServicio;

  // INFRAESTRUCTURA
  final int numeroAulas;
  final int numeroLaboratorios;
  final int capacidadBiblioteca;
  final double areaTotalLocal;
  final int numeroSecciones;

  // INDICADORES DE CALIDAD
  final int anosFuncionamiento;
  final double ratioDocenteEstudiante;

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
    
    // SERVICIOS DISPONIBLES
    required this.servicioInternet,
    required this.servicioAgua,
    required this.servicioLuz,
    required this.servicioDesague,
    required this.servicioTelefono,
    required this.servicioGas,
    required this.biblioteca,
    required this.laboratorio,
    required this.canchaDeportiva,
    required this.comedor,
    required this.serviciosHigienicos,
    required this.otrosServicios,
    
    // ESTADÍSTICAS DE MATRÍCULA
    required this.totalMatriculados,
    required this.matriculadosInicial,
    required this.matriculadosPrimaria,
    required this.matriculadosSecundaria,
    required this.matriculadosMasculino,
    required this.matriculadosFemenino,
    
    // RECURSOS HUMANOS
    required this.totalDocentes,
    required this.docentesInicial,
    required this.docentesPrimaria,
    required this.docentesSecundaria,
    required this.personalAdministrativo,
    required this.personalServicio,
    
    // INFRAESTRUCTURA
    required this.numeroAulas,
    required this.numeroLaboratorios,
    required this.capacidadBiblioteca,
    required this.areaTotalLocal,
    required this.numeroSecciones,
    
    // INDICADORES DE CALIDAD
    required this.anosFuncionamiento,
    required this.ratioDocenteEstudiante,
  });

  // Getters para compatibilidad con el código existente
  String get name => nombreIE;
  String get location => '$distrito, $provincia, $departamento';
  String get type => tipoGestion;
  String get level => nivelModalidad;
}
