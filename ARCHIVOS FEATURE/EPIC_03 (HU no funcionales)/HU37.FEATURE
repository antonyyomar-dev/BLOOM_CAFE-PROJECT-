
Feature: HU37 - Interfaz intuitiva y experiencia de uso fluida
  Como cliente de cafetería
  Quiero que la aplicación sea sencilla, visualmente clara y accesible
  Para poder realizar pedidos personalizados desde cualquier dispositivo móvil

  Scenario: Navegación sencilla y accesible
    Given el cliente de la cafetería desea realizar pedidos personalizados desde su dispositivo móvil
    When el usuario accede a la aplicación para navegar y seleccionar sus productos
    Then la interfaz se muestra clara, legible y adaptada correctamente a la pantalla

    Examples:
      | tipo_dispositivo | tamaño_pantalla | elementos_visibles                      | resultado_esperado                                   |
      | smartphone       | 6.1 pulgadas    | menú, buscador, categorías, carrito     | interfaz legible y navegación fluida                 |
      | tablet           | 10 pulgadas     | menú expandido, categorías detalladas   | vista clara y ordenada con mayor espacio disponible  |
      | smartphone       | 5 pulgadas      | elementos esenciales                    | visualización sin saturación de contenido            |

  Scenario: Adaptación automática en pantallas pequeñas
    Given un cliente utiliza un dispositivo móvil con pantalla reducida
    When el cliente abre la aplicación
    Then la interfaz reorganiza los elementos visuales, manteniendo claridad y facilidad de navegación

    Examples:
      | tamaño_pantalla | reorganización_aplicada         | resultado_esperado                                    |
      | 4.7 pulgadas    | sí                              | elementos reubicados y botones accesibles             |
      | 5.0 pulgadas    | sí                              | interfaz compacta sin perder legibilidad              |
      | 5.2 pulgadas    | sí                              | navegación cómoda y elementos correctamente ajustados |

