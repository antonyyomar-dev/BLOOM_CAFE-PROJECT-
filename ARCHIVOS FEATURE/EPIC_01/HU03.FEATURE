Feature: HU03 - Actualización del estado del pedido en tiempo real
    Como barista
    Quiero poder actualizar el estado de los pedidos desde mi dispositivo
    Para mantener informados al personal y al cliente sobre el progreso del pedido

    Scenario: Actualización inmediata del estado del pedido
        Given que el pedido ha sido registrado en el sistema
        When el barista marque un cambio de estado
        Then la app deberá actualizarlo inmediatamente en la pantalla del mesero y del cliente
        And el pedido mostrará el nuevo estado sin necesidad de recargar la aplicación

        Examples:
            | id_pedido | estado_anterior | estado_nuevo     | resultado_esperado                        |
            | 1023      | En preparación  | Listo para servir| se refleja el nuevo estado en tiempo real |
            | 1051      | Pendiente       | En preparación   | el cambio se muestra sin recargar         |


    Scenario: Error temporal al cambiar el estado
        Given que el barista intenta actualizar el estado de un pedido
        When el sistema tenga una pérdida momentánea de conexión
        Then deberá mostrarse un mensaje indicando "No se pudo actualizar, reintente"
        And el sistema deberá guardar el cambio en cuanto se recupere la conexión

        Examples:
            | id_pedido | estado_intentado  | conexion     | mensaje_mostrado                   | accion_sistema                             |
            | 2044      | En preparación    | inestable    | No se pudo actualizar, reintente   | guarda el cambio al reconectar             |
            | 2099      | Listo para servir | desconectado | No se pudo actualizar, reintente   | reintenta automáticamente al volver la red |
