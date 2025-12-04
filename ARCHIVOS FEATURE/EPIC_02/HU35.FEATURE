Feature: HU35 - Estabilidad del sistema durante horas con mayor demanda
  Como barista o cajero
  Quiero que la aplicación se mantenga estable durante las horas pico
  Para gestionar múltiples pedidos simultáneamente sin interrupciones

  Scenario: Funcionamiento estable bajo alta demanda
    Given que el barista o cajero atiende muchos pedidos en horas de alta demanda
    When varios usuarios realizan pedidos de manera simultánea
    Then la aplicación permanece operativa sin errores, cierres inesperados o pérdida de información

    Examples:
      | cantidad_usuarios_simultaneos | estado_servidor | resultado_esperado                          |
      | 150                           | estable         | aplicación operativa sin fallos             |
      | 250                           | estable         | sistema mantiene estabilidad                |
      | 350                           | alta carga      | aplicación responde sin cierres inesperados |

  Scenario: Alerta de saturación del servidor
    Given que el sistema recibe un volumen muy alto de solicitudes
    When el límite de capacidad está por alcanzarse
    Then el sistema emite una alerta preventiva para que el administrador tome medidas

    Examples:
      | solicitudes_por_minuto | capacidad_maxima | alerta_generada       | resultado_esperado                         |
      | 900                    | 1000             | sí                    | administrador recibe aviso oportuno        |
      | 980                    | 1000             | sí                    | alerta preventiva antes de la saturación   |
      | 1000                   | 1000             | sí                    | advertencia inmediata por capacidad límite |
