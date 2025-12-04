Feature: HU34 - Respuesta rápida del sistema en la gestión de pedidos
    Como barista o cajero
    Quiero que la aplicación procese los pedidos de forma organizada y en tiempo real
    Para garantizar una atención más rápida y sin demoras en el servicio

    Scenario: Actualización inmediata del pedido
        Given que los pedidos pueden contener modificaciones de último momento
        When el barista o cajero actualice un pedido existente
        Then la aplicación debe reflejar los cambios de inmediato en totas las pantallas
        And la actualización no tarda más de un instante

        Examples:
            | id_pedido | modificacion         | usuario_actualiza | resultado_esperado                           |
            | 1201      | agregar producto    | barista           | cambios reflejados en todas las pantallas     |
            | 1202      | cambiar cantidad    | cajero            | actualización inmediata sin retraso           |
            | 1203      | eliminar producto   | barista           | todos los dispositivos muestran el cambio     |

    Scenario: Respuesta estable con múltiples pedidos simultáneos
        Given que la cafeteria está atendiendo varios pedidos a la vez
        When distintos usuarios modifiquen o creen pedidos simultáneamente
        Then la aplicación deberá mostrar los cambios sin retrasos perceptibles
        And mantiene la estabilidad del sistema ante bajo múltiples tareas

        Examples:
            | id_pedido | acciones_simultaneas                  | usuarios_involucrados       | resultado_esperado                        |
            | 1301      | modificar y agregar productos         | barista, cajero             | cambios reflejados sin retrasos           |
            | 1302      | crear nuevos pedidos simultáneamente  | barista, cajero, mesero     | sistema mantiene estabilidad y rapidez    |
            | 1303      | eliminar y actualizar productos       | barista, cajero             | todos los cambios visibles en tiempo real |
