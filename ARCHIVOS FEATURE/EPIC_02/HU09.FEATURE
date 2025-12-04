
Feature: HU09 - Notificación al personal de limpieza
  Como cajero
  Quiero notificar automáticamente al personal de limpieza cuando una mesa queda libre
  Para mantener el orden del local

  Scenario: Notificación automática al marcar mesa como libre
    Given que el cliente ha finalizado su consumo y la mesa se marca como libre
    When el cajero actualiza el estado de la mesa en la aplicación
    Then el sistema envía una notificación al personal de limpieza indicando la mesa que requiere atención

    Examples:
      | id_mesa | estado_anterior | estado_nuevo | notificacion_enviada | resultado_esperado                           |
      | 12      | ocupada         | libre        | sí                    | limpieza notificada correctamente           |
      | 7       | en uso          | libre        | sí                    | personal de limpieza informado de inmediato |

  Scenario: Mesa asignada como limpia
    Given que el personal de limpieza recibió la notificación
    When el trabajador marca la mesa como "limpia" en la aplicación
    Then el sistema actualiza su estado y notifica al cajero que la mesa ya está disponible

    Examples:
      | id_mesa | estado_actual | accion_personal | estado_final | notificacion_cajero | resultado_esperado                    |
      | 12      | libre         | marcar limpia   | disponible   | enviada             | mesa habilitada para nuevos clientes  |
      | 7       | libre         | marcar limpia   | disponible   | enviada             | actualización reflejada correctamente |
