
Feature: HU05 - Notificación automática al cliente y al personal
  Como personal de cafetería
  Quiero que la app envíe notificaciones automáticas cuando un pedido esté listo
  Para mejorar la comunicación y evitar demoras en la entrega

  Scenario: Aviso por cambio de estado a listo
    Given que el pedido ha cambiado al estado "listo"
    When el estado del pedido se actualiza en el sistema
    Then se envía una notificación al cliente y al personal correspondiente
    And ambos reciben una alerta inmediata indicando que el pedido está listo para la entrega

  Scenario: Reintento automático cuando la notificación falla
    Given que el sistema envía una notificación al cliente
    When el dispositivo del cliente no puede recibirla por falta de internet o bloqueo temporal
    Then el sistema reintenta enviarla hasta 3 veces
    And registra el estado de entrega de la notificación


