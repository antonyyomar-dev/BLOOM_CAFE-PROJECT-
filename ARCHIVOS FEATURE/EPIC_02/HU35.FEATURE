
Feature: HU35 - Estabilidad del sistema durante horas con mayor demanda
  Como barista o cajero
  Quiero que la aplicación se mantenga estable durante las horas pico
  Para gestionar múltiples pedidos simultáneamente sin interrupciones

  Scenario: Funcionamiento estable bajo alta demanda
    Given que el barista o cajero atiende muchos pedidos en horas de alta demanda
    When varios usuarios realizan pedidos de manera simultánea
    Then la aplicación permanece operativa sin errores, cierres inesperados o pérdida de información

  Scenario: Alerta de saturación del servidor
    Given que el sistema recibe un volumen muy alto de solicitudes
    When el límite de capacidad está por alcanzarse
    Then el sistema emite una alerta preventiva para que el administrador tome medidas



