Feature: HU04 - Gestión de pedidos pendientes y priorización automática
  Como cajero o mesero
  Quiero visualizar los pedidos pendientes con prioridad automática según el tiempo de espera
  Para atender primero los pedidos más antiguos o urgentes

  Scenario: Destacar pedidos con exceso de tiempo de espera
    Given que hay múltiples pedidos en cola
    When se superen ciertos tiempos de espera, el sistema debe resaltar el pedido en color de prioridad
    Then el personal podrá identificar fácilmente los pedidos más urgentes
    And atenderlos primero

    Examples:
      | id_pedido | tiempo_espera_min | prioridad | color_resaltado      | resultado_esperado                              |
      | 2001      | 15                | media     | amarillo             | pedido visible y destacado como prioridad media |
      | 2002      | 30                | alta      | rojo                 | pedido destacado como urgente en la lista       |
      | 2003      | 5                 | baja      | verde                | pedido visible sin alerta especial              |

  Scenario: Reorganización automática por prioridad
    Given que existen pedidos más nuevos y más antiguos
    When uno de los pedidos alcance un umbral crítico de tiempo
    Then la aplicación deberá moverlo automáticamente a las primeras posiciones de la lista
    And mantendrá la cola organizada según prioridad

    Examples:
      | id_pedido | tiempo_espera_min | prioridad | posicion_actual | posicion_esperada | resultado_esperado                       |
      | 2001      | 30                | alta      | 5               | 1                 | pedido movido a la primera posición      |
      | 2002      | 15                | media     | 3               | 2                 | pedidos reorganizados según prioridad    |
      | 2003      | 5                 | baja      | 1               | 3                 | cola correctamente ordenada por urgencia |
 