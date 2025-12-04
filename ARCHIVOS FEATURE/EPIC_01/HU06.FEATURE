Feature: HU06 - Visualización de la disponibilidad de cada producto
    Como mesero de cafetería
    Quiero que la app permita visualizar la disponibilidad de cada producto en tiempo real
    Para poder informar al cliente y evitar registrar un producto no disponible en el pedido

    Scenario: Consulta de disponibilidad antes del registro del pedido
        Given que el cliente solicita un producto
        When el mesero visualice en la app la disponibilidad del producto antes de registrar el pedido
        Then se evitará ofrecer y registrar pedidos de productos que no estén disponibles

        Examples:
            | producto        | disponibilidad | acción_del_mesero              | resultado_esperado                     |
            | Latte           | disponible     | registra el pedido             | pedido aceptado                        |
            | Frappe Caramelo | no disponible  | informa indisponibilidad       | no se registra el pedido               |
            | Vainilla        | poco stock     | advierte al cliente            | se registra solo si el cliente acepta  |

    Scenario: Actualización automática de stock en tiempo real
        Given que un producto ha sido vendido y su stock disminuye
        When el sistema detecte que el inventario llegó a un límite mínimo
        Then deberá actualizar la disponibilidad en la app para todo el personal
        And mostrará el producto como "poco stock" o "no disponible"

        Examples:
            | producto      | stock_actual | limite_minimo | disponibilidad_resultante |
            | Capuccino     | 3            | 5              | poco stock                |
            | Croissant     | 0            | 2              | no disponible             |
            | Matcha Latte  | 6            | 5              | disponible                |
