Feature: HU11 - Confirmación de stock al registrar pedidos
  Como mesero
  Quiero recibir una alerta si un producto está por agotarse antes de confirmar el pedido
  Para ofrecer una alternativa al cliente

  Scenario: Alerta de producto con stock limitado
    Given que el mesero está registrando un pedido
    When selecciona un producto con stock limitado o agotado
    Then el sistema muestra una alerta visual o sonora
    And el sistema sugiere opciones múltiples

    Examples:
      | id_producto | nombre_producto    | stock_actual | alerta_mostrada | opciones_sugeridas              | resultado_esperado                               |
      | 3001        | Café Latte         | 2            | sí              | Espresso, Cappuccino            | mesero notificado y alternativas sugeridas       |
      | 3002        | Muffin de Chocolate| 0            | sí              | Muffin Vainilla, Brownie        | alerta visible y producto alternativo disponible |
      | 3003        | Té Verde           | 5            | no              |   ----                          | producto disponible, sin alerta                  |

  Scenario: Selección de producto alternativo
    Given que el producto elegido no tiene stock suficiente
    When el mesero es notificado por la alerta
    Then podrá seleccionar un producto alternativo de la lista
    And el sistema actualizará el pedido y stock correspondiente

    Examples:
      | id_producto  | nombre_producto | stock_actual | id_producto_alternativo | nombre_alternativo | resultado_esperado                          |
      | 3002         | Muffin Chocolate| 0            | 3004                    | Muffin Vainilla    | pedido actualizado con producto alternativo |
      | 3001         | Café Latte      | 1            | 3005                    | Espresso           | alerta mostrada y selección de alternativa  |
