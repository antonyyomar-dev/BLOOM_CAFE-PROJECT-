
Feature: HU38 Recomendaciones personalizadas y eficientes para el cliente
  Como cliente de BloomCafé
  Quiero recibir recomendaciones precisas y rápidas sobre bebidas o cafeterías cercanas
  Para obtener sugerencias útiles sin demoras en mi experiencia de uso

  Scenario: Recomendaciones basadas en historial y ubicación
    Given el cliente desea recibir sugerencias adaptadas a sus gustos y ubicación
    When accede a la sección de recomendaciones dentro de la aplicación
    Then el sistema debe mostrar opciones personalizadas basadas en su historial de pedidos y localización

    Examples:
      | id_cliente | historial_favoritos                      | ubicacion_actual     | recomendaciones_generadas                                      |
      | CL-102     | Latte vainilla, Mocha, Cappuccino        | Av. Primavera 123    | Latte vainilla (cercano), Mocha (muy pedido), Frappe Hazelnut  |
      | CL-223     | Matcha Latte, Té Chai                    | San Borja Sur        | Matcha Latte (popular), Capuchino (similar), Green Tea Ice     |
      | CL-350     | Espresso doble, Americano                | Miraflores Central   | Americano (preferido), Espresso suave, Cold Brew cercano       |

  Scenario: Recomendaciones no disponibles por falta de datos
    Given un cliente ingresa por primera vez al sistema
    When no exista historial suficiente para generar recomendaciones
    Then la aplicación deberá mostrar un mensaje de "No hay recomendaciones disponibles por ahora"

    Examples:
      | id_cliente | historial_existente | mensaje_mostrado                                  |
      | CL-001     | no                 | No hay recomendaciones disponibles por ahora       |
      | CL-002     | vacío              | No hay recomendaciones disponibles por ahora       |
