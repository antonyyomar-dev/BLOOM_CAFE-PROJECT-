Feature: HU01 - Registro y visualización de pedidos en tiempo real
  Como barista o cajero
  Quiero visualizar en una pantalla los pedidos que ingresan en tiempo real
  Para prepararlos en el orden correcto, reducir errores y agilizar la atención durante las horas de mayor demanda

  Scenario: Registro correcto del pedido
    Given que el cliente ha confirmado su pedido en la aplicación
    When el sistema registre la orden mostrando automáticamente la hora de registro, el número de orden y su estado actual
    Then el personal podrá marcar el pedido como “en preparación” o “listo”
    And la aplicación actualizará el estado en tiempo real

    Examples:
      | id_pedido | cliente       | productos                   | hora_registro | estado_actual      | resultado_esperado                         |
      | 1001      | Juan Pérez    | Café Latte, Croissant       | 10:15         | pendiente          | pedido registrado y visible en tiempo real |
      | 1002      | María López   | Espresso, Muffin            | 10:17         | pendiente          | pedido registrado y actualizado correctamente |

  Scenario: Pedido no visible inmediatamente
    Given que el cliente ha confirmado su pedido correctamente
    When el sistema presente un retraso temporal por carga
    Then la pantalla del barista deberá mostrar un aviso de “Actualizando pedidos”
    And refrescar la lista automáticamente en menos de 5 segundos para visualizar el pedido pendiente

    Examples:
      | id_pedido | cliente      | estado_sistema | mensaje_mostrado         | tiempo_refresco | resultado_esperado                              |
      | 1003      | Carlos Díaz  | retraso        | Actualizando pedidos     | 5 segundos      | pedido visible automáticamente después del refresco |
      | 1004      | Ana Torres   | retraso        | Actualizando pedidos     | 4 segundos      | pedido aparece actualizado sin intervención       |
