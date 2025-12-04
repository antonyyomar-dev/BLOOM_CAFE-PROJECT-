Feature: HU08 - Registro de propinas y métodos de pago
    Como cajero
    Quiero registrar propinas y tipos de pago
    Para mantener un control financiero más exacto

    Scenario: Registro correcto de propina y método de pago
        Given que el cliente está realizando el pago de su pedido
        When el cajero selecciona el método de pago y añade el monto de propina correspondiente
        Then el sistema debe registrar ambos valores
        And reflejarlos correctamente en el historial financiero del día

        Examples:
            | id_pedido | metodo_pago | monto_propina | total_pagado | resultado_esperado                        |
            | 3201      | Tarjeta     | 3.50          | 28.50        | registrado en historial del día           |
            | 3202      | Yape        | 1.00          | 17.00        | registrado sin inconsistencias            |
            | 3203      | Efectivo    | 5.00          | 30.00        | valores guardados correctamente           |

    Scenario: Pago sin propina registrada
        Given que el cajero está procesando un pago
        When el cliente decida no dejar propina
        Then el sistema debe permitir completar la transacción sin monto adicional
        And registrar el valor de la propina en 0

        Examples:
            | id_pedido | metodo_pago | monto_propina | total_pagado | resultado_esperado                 |
            | 4101      | Efectivo    | 0.00          | 15.00        | transacción completada sin errores |
            | 4102      | Tarjeta     | 0.00          | 22.00        | propina registrada como cero       |
