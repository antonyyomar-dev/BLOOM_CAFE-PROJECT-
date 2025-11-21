
Feature: HU07 - Comunicación interna por chat o alertas rápidas
  Como barista o mesero
  Quiero enviar mensajes o alertas rápidas al personal
  Para mejorar la coordinación y evitar retrasos

  Scenario: Envío de alerta a todo el personal
    Given que hay varios pedidos en curso
    When un miembro del personal envía una alerta o mensaje
    Then los empleados conectados reciben la notificación instantáneamente en su dispositivo

  Scenario: Mensaje no entregado por falta de conexión
    Given que el mesero intenta enviar un mensaje al personal
    When existe un problema de conexión o sincronización
    Then el sistema muestra un aviso indicando que el mensaje no se envió
    And reintenta enviarlo automáticamente cuando se restablezca la conexión




