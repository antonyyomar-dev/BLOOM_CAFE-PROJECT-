Feature: HU10 - Registro de incidencias o problemas
  Como mesero
  Quiero reportar incidencias desde la aplicación
  Para que el administrador o cocina puedan resolverlas rápidamente

  Scenario: Registro de un incidente en la aplicación
    Given que el mesero ha identificado un problema en el servicio
    When accede a la sección de incidencias y registra los detalles del problema
    Then el sistema guarda el reporte y notifica automáticamente al área correspondiente

    Examples: 
      | id_incidencia | tipo_problema       | descripcion                           | area_notificada  | resultado_esperado                     |
      | 9001          | Retraso en pedido   | Pedido de mesa 8 lleva más de 20 min  | cocina           | incidencia registrada y enviada        |
      | 9002          | Producto incorrecto | Cliente recibió bebida equivocada      | atención        | reporte guardado y personal alertado   |

  Scenario: Incidencia pendiente de respuesta
    Given que existe una incidencia previamente registrada
    When el administrador o área responsable aún no la ha atendido
    Then el sistema la muestra como "pendiente" y permite marcarla como "en proceso" o "resuelta"

    Examples:
      | id_incidencia | estado_actual | opciones_disponibles          | resultado_esperado                           |
      | 9001          | pendiente     | en proceso, resuelta          | incidencia visible como pendiente            |
      | 9002          | pendiente     | en proceso, resuelta          | administrador puede actualizar su estado     |
