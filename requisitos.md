# Manitas: Historias de usuario del MVP

App móvil para contratar servicios del hogar (plomería, carpintería, soldadura, electricidad y pintura).

## Decisión de diseño

El cliente elige primero al técnico y luego le envía la solicitud de cotización.

---

## Historia 1: Búsqueda y selección de técnicos
**Rol:** Cliente

Como cliente que necesita una reparación en casa,
quiero filtrar y ver un listado de técnicos disponibles por especialidad (carpintería, plomería, electricidad, etc.) y ubicación,
para encontrar rápidamente al profesional adecuado para mi necesidad.

**Criterios de aceptación**
- El usuario puede seleccionar la categoría del servicio (ej. "Carpintería").
- Se muestra una lista de técnicos con su foto, calificación promedio (estrellas) y distancia o zona de cobertura.
- Se puede ordenar la lista por cercanía o por mejor valoración.

---

## Historia 2: Solicitud y cotización del servicio
**Rol:** Cliente

Como cliente,
quiero enviar una solicitud de cotización adjuntando detalles, fotos y/o dimensiones del trabajo (ej. fotos de una puerta rota o medidas de una cocina),
para que el técnico entienda el alcance y me envíe un presupuesto estimado.

**Criterios de aceptación**
- El cliente puede escribir una descripción del problema o proyecto.
- Puede adjuntar hasta 5 imágenes desde su celular o computadora.
- La solicitud envía una notificación al técnico seleccionado.

---

## Historia 3: Negociación y chat
**Rol:** Cliente / Técnico

Como cliente o técnico,
quiero tener un chat directo dentro de la aplicación con la otra parte,
para negociar el precio, acordar la fecha y hora de la visita y aclarar dudas antes de confirmar el trabajo.

**Criterios de aceptación**
- Debe existir un chat privado asociado a cada solicitud de servicio.
- El técnico puede enviar una oferta o propuesta formal de precio a través del chat.
- El cliente puede aceptar o rechazar la propuesta formal dentro de la misma pantalla del chat.

---

## Historia 4: Perfil profesional del técnico
**Rol:** Técnico

Como técnico especializado,
quiero crear un perfil donde pueda publicar mis especialidades, fotos de trabajos anteriores y mi zona de cobertura,
para generar confianza en los clientes y recibir más solicitudes.

**Criterios de aceptación**
- El técnico puede seleccionar una o varias categorías de servicio.
- Puede subir un álbum o portafolio con fotos de proyectos realizados.
- Permite configurar el radio de kilometraje o los barrios donde presta servicio.

---

## Historia 5: Calificar al técnico
**Rol:** Cliente

Como cliente que ha finalizado un servicio,
quiero calificar al técnico con estrellas y dejar un comentario sobre su trabajo,
para compartir mi experiencia y ayudar a otros usuarios a tomar decisiones informadas.

**Criterios de aceptación**
- La opción de calificar solo se habilita cuando el servicio es marcado como "Finalizado" (por el técnico o por el sistema).
- El cliente debe asignar una puntuación de 1 a 5 estrellas.
- Hay un campo de comentario opcional, de texto libre (máximo 500 caracteres).
- Se pueden seleccionar etiquetas rápidas opcionales (ej. "Puntual", "Limpio", "Buen precio", "Excelente trabajo").
- Solo se permite una reseña por cada servicio contratado.