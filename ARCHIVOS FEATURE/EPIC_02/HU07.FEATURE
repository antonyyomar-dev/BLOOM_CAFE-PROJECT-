Feature: HU07 - Comunicación interna por chat o alertas rápidas
  Como barista o mesero
  Quiero enviar mensajes o alertas rápidas al personal
  Para mejorar la coordinación y evitar retrasos

  Scenario: Envío de alerta a todo el personal
    Given que hay varios pedidos en curso
    When un miembro del personal envía una alerta o mensaje
    Then los empleados conectados reciben la notificación instantáneamente en su dispositivo

    Examples:
      | id_emisor | tipo_mensaje | contenido                   | personal_conectado | resultado_esperado                      |
      | 301       | alerta       | “Pedido acumulado en barra” | sí                 | notificación recibida al instante       |
      | 118       | mensaje      | “Mesa 4 requiere entrega”   | sí                 | todos reciben el mensaje en tiempo real |

  Scenario: Mensaje no entregado por falta de conexión
    Given que el mesero intenta enviar un mensaje al personal
    When existe un problema de conexión o sincronización
    Then el sistema muestra un aviso indicando que el mensaje no se envió
    And reintenta enviarlo automáticamente cuando se restablezca la conexión

    Examples:
      | id_emisor | contenido                   | estado_conexion | aviso_mostrado                | resultado_esperado                                 |
      | 402       | “Falta insumo en cocina”    | sin conexión    | mensaje no enviado            | reintentado al reconectar                          |
      | 225       | “Retraso en pedido 1203”    | intermitente    | error temporal de envío       | enviado correctamente tras recuperación de señal   |
