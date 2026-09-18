---
layout: policy
title: Política de privacidad de Shengye
app: shengye
app_name: Shengye
lang: es
permalink: /es/app/shengye/privacy/
translation_group: shengye-privacy
sections: shengye_policy_sections
updated: "2026-09-18"
policy_version: "1.3"
description: Cómo trata Shengye las grabaciones, transcripciones, sincronización, anuncios y eliminación de datos.
---
<div class="summary-box" markdown="1">
**En resumen:** Las grabaciones y los textos se guardan en tu dispositivo por defecto. La transcripción se realiza en el dispositivo. Tú decides si activas iCloud o compartes contenido. La versión sin Pro muestra anuncios. No operamos un servidor de contenido de grabaciones.
</div>

## 1. Alcance {#scope}

Esta política se aplica a **Shengye / 声页 / 聲頁**, del equipo de Vanto (App Store ID **1241562587**, identificador `com.mac.zhou.artrecorder.first`), según la implementación actual de la versión 5.0.0. Las versiones anteriores pueden tener otros mecanismos de publicidad, análisis y compras. Desactivar ahora un servicio no elimina los datos enviados anteriormente. Leer esta política no otorga consentimiento ni permisos del sistema.

## 2. Datos locales y protección {#local}

- **Grabaciones:** El audio, los títulos, las fechas, la duración, las etiquetas, el texto y sus tiempos, los puntos destacados, las notas, los recortes, la posición de escucha y el progreso de las tareas se guardan localmente, junto con los ajustes y los derechos de compra.
- **Bloqueo de la app:** iOS verifica la biometría o el código del dispositivo. La app no recibe plantillas biométricas. El bloqueo controla el acceso; no cifra cada archivo.
- **Widgets y Actividades en directo:** El almacenamiento compartido del dispositivo o las actividades del sistema muestran el estado de grabación y reproducción. Se comparten identificadores de control, tiempos e información de los fragmentos destacados, no el audio completo ni las transcripciones. Activar el bloqueo oculta el contenido correspondiente; otras personas podrían ver la información de una pantalla sin proteger.

## 3. Transcripción y permisos {#speech}

Grabar requiere permiso para usar el micrófono. La transcripción utiliza el reconocimiento de voz de Apple en el dispositivo; algunos idiomas requieren descargar un modelo de Apple la primera vez. La app no envía audio a un servidor de reconocimiento operado por nosotros. Los resultados dependen del idioma, el dispositivo y los modelos disponibles.

La importación y exportación usan las funciones del sistema para seleccionar y compartir archivos. Puedes gestionar los permisos del micrófono y la biometría en Ajustes de iOS; denegarlos limita las funciones correspondientes.

## 4. Sincronización, uso compartido y copias {#cloud}

**La sincronización con iCloud está desactivada por defecto y requiere Pro.** Al activarla, los datos de las grabaciones, como audio, texto, etiquetas, puntos destacados y marcas de eliminación, se sincronizan con la base de datos privada de CloudKit de tu cuenta de Apple. Las grabaciones marcadas como solo locales no se suben. Desactivar la sincronización no borra los datos existentes en la nube y las solicitudes ya enviadas pueden completarse. Las eliminaciones y restauraciones requieren que los dispositivos se conecten y terminen de sincronizar. Consulta la [política de privacidad de Apple](https://www.apple.com/legal/privacy/).

Al exportar audio, texto, subtítulos o copias de seguridad, el contenido se entrega al destinatario o servicio de almacenamiento que elijas. **Las copias .shengye no están cifradas.** Incluyen las grabaciones guardadas y sus datos de organización, pero no la papelera, las tareas pendientes, los derechos de compra ni los créditos de transcripción. La importación requiere confirmación y no sobrescribe grabaciones existentes. Guarda las copias en un lugar seguro.

Según los ajustes del sistema, las copias del dispositivo de Apple también pueden incluir datos de la app. Eliminar contenido en la app no retira copias compartidas o guardadas por separado.

## 5. Publicidad, compras y análisis {#services}

- **Anuncios:** La versión sin Pro muestra banners en la pantalla de grabación y permite ver anuncios recompensados, si lo eliges, para obtener créditos de transcripción. Pro elimina ambos formatos. Google AdMob proporciona los anuncios y UMP gestiona las opciones de privacidad aplicables en cada región. Los anuncios esperan a que completes las elecciones necesarias; cuando se requiere, los ajustes ofrecen opciones de privacidad. La app solicita anuncios no personalizados y no pide permiso de seguimiento ATT.
- **Datos publicitarios:** El SDK de Google puede tratar la dirección IP y la ubicación aproximada inferida, identificadores del dispositivo o la app, interacciones con anuncios y la app, e información de fallos y rendimiento para publicidad, medición, seguridad y funcionamiento. No personalizado no significa ausencia de recopilación. La app no añade audio, títulos, transcripciones, etiquetas ni notas a las solicitudes de anuncios. Consulta la [información de Google sobre datos](https://developers.google.com/admob/ios/privacy/data-disclosure?hl=es) y su [política de privacidad](https://policies.google.com/privacy?hl=es).
- **Compras y créditos:** Apple StoreKit procesa las compras y restauraciones de Pro; no recibimos datos de tarjetas. La app guarda los derechos verificados. Los saldos de transcripción, las reservas para tareas y los comprobantes de recompensas se guardan localmente, fuera de las copias de la biblioteca y de iCloud. Las compras anteriores válidas siguen reconociéndose. Comprar Pro de por vida no cancela una suscripción anterior.
- **Análisis y diagnóstico opcionales:** La versión actual desactiva el análisis de uso y el diagnóstico de fallos de la app, revoca las activaciones anteriores, no inicia Firebase Analytics ni Crashlytics y no integra Performance. El tratamiento propio del SDK publicitario es independiente.

## 6. Conservación y eliminación {#retention}

Los datos locales suelen conservarse hasta que elimines el contenido o los datos de la app. **La papelera está activada por defecto y no se vacía automáticamente.** Puedes restaurar sus elementos. Al desactivarla, las nuevas eliminaciones son permanentes tras confirmarlas, sin borrar los elementos que ya estaban en la papelera. Con la sincronización activada, también debe completarse la sincronización de la eliminación.

La limpieza de almacenamiento solo elimina archivos temporales sin uso, no grabaciones guardadas ni originales conservados de versiones anteriores. Gestiona por separado las copias de migración, exportaciones, copias del dispositivo, copias en la nube y registros de transacciones de Apple. Borrar o desinstalar la app no garantiza su eliminación.

## 7. Opciones y derechos {#choices}

Puedes gestionar permisos, bloqueo, sincronización, opciones de privacidad publicitaria, uso compartido y eliminación. Según la ley aplicable, puedes tener derechos de acceso, rectificación, supresión, obtención de una copia, retirada del consentimiento o reclamación. Contacta con nosotros abajo. No podemos leer ni borrar a distancia los datos que solo están en tu dispositivo.

Los servicios de terceros pueden tratar datos fuera de tu región; su conservación y tratamiento se rigen por sus políticas y la ley aplicable. Protege el dispositivo, la cuenta de Apple y las copias: ningún método de almacenamiento o transmisión es completamente seguro. Las visitas a esta página se rigen por el [aviso de privacidad del sitio (en inglés)]({{ '/en/site-privacy/' | relative_url }}).

## 8. Contacto y cambios {#contact}

**Proveedor y contacto de privacidad: equipo de Vanto**<br>
Correo: [{{ site.contact_email }}](mailto:{{ site.contact_email }})

Usamos tu correo y la información que aportes solo para atender tu solicitud, darle el seguimiento necesario y cumplir las obligaciones aplicables, durante el tiempo necesario para esos fines. Indica la versión de la app, sin enviar grabaciones privadas, textos, contraseñas ni datos de pago. Los cambios importantes actualizarán la fecha y versión de esta página, con aviso o solicitud de consentimiento cuando corresponda.
