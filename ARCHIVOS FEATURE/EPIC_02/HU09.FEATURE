
Feature: HU09 - Notificación al personal de limpieza
  Como cajero
  Quiero notificar automáticamente al personal de limpieza cuando una mesa queda libre
  Para mantener el orden del local

  Scenario: Notificación automática al marcar mesa como libre
    Given que el cliente ha finalizado su consumo y la mesa se marca como libre
    When el cajero actualiza el estado de la mesa en la aplicación
    Then el sistema envía una notificación al personal de limpieza indicando la mesa que requiere atención

  Scenario: Mesa asignada como limpia
    Given que el personal de limpieza recibió la notificación
    When el trabajador marca la mesa como "limpia" en la aplicación
    Then el sistema actualiza su estado y notifica al cajero que la mesa ya está disponible



    
