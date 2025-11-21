
Feature: HU10 - Registro de incidencias o problemas
  Como mesero
  Quiero reportar incidencias desde la aplicación
  Para que el administrador o cocina puedan resolverlas rápidamente

  Scenario: Registro de un incidente en la aplicación
    Given que el mesero ha identificado un problema en el servicio
    When accede a la sección de incidencias y registra los detalles del problema
    Then el sistema guarda el reporte y notifica automáticamente al área correspondiente

  Scenario: Incidencia pendiente de respuesta
    Given que existe una incidencia previamente registrada
    When el administrador o área responsable aún no la ha atendido
    Then el sistema la muestra como "pendiente" y permite marcarla como "en proceso" o "resuelta"



