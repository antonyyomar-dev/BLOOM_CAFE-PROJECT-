Feature: HU02 - Coordinación automática entre área de atención y cocina
    Como mesero o personal de atención
    Quiero enviar automáticamente los pedidos a la cocina desde la app
    Para reducir los tiempos de espera y asegurar que cada pedido sea preparado correctamente
    
    Scenario: Envío automático de pedido a cocina
        Given que el cliente ha confirmado su pedido en la aplicación
        When el sistema reciba la confirmación
        Then enviará automáticamente la orden a cocina con todos los detalles de personalización
        And el sistema notificará al mesero y al cliente en cuanto el pedido esté listo para su entrega

        Examples:
            | producto       | cantidad | personalizacion                 | metodo_entrega |
            | Cappuccino     | 1        | leche deslactosada              | mesa           |
            | Latte Vainilla | 2        | extra vainilla, sin azúcar      | recojo         |

    Scenario: Pedido rechazado por información incompleta
        Given que el mesero ha registrado un pedido desde la app
        When falten datos obligatorios como cantidad, producto o método de entrega
        Then el sistema no enviará la orden a cocina
        And mostrará un mensaje indicando los datos faltantes que deben completarse

        Examples:
            | producto   | cantidad | metodo_entrega | motivo_rechazo             |
            | Mocha      | -        | mesa           | falta cantidad             |
            | -          | 1        | recojo         | falta producto             |
            | Americano  | 1        | -              | falta método de entrega    |
