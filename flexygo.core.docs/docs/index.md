# Bienvenido a Flexygo Core

!!! tip "Descarga del instalador"
    Puedes descargar el **instalador oficial de Flexygo Core** para comenzar rápidamente con tu entorno de desarrollo.  
    👉 [Descargar instalador](./files/flexygoinstallercore.rar)

---

## 🔄 Migración desde Flexygo clásico

Este nuevo proyecto, **Flexygo Core**, es una evolución natural del anterior Flexygo basado en .NET Framework.

Hasta ahora, el modelo clásico de Flexygo consistía en una **única aplicación web** que contenía tanto el frontend como el backend y todas sus librerías dentro del mismo sitio.

A partir de **Flexygo Core**, hemos rediseñado completamente la arquitectura usando **.NET 9**, y ahora se divide en:

- 🖥️ **Frontend**: la interfaz web que el usuario ve
- ⚙️ **Backend**: la lógica del servidor y las APIs
- 🛢️ **Base de datos**

Este nuevo enfoque modular responde a varios objetivos clave:

- **Seguridad**: al separar los componentes, puedes alojar el frontend en un servidor distinto del backend y la base de datos. Si se comprometiera el servidor frontend, **no habría acceso directo a los datos** ni a la lógica interna.
- **Escalabilidad**: puedes distribuir las partes del sistema en diferentes entornos físicos o virtuales.
- **Flexibilidad**: permite desplegar soluciones personalizadas y adaptadas a cada cliente o entorno.
- **Rendimiento y mantenimiento**: usar .NET 9 nos permite trabajar con las últimas mejoras del ecosistema .NET en rendimiento, soporte multiplataforma y facilidad de despliegue.

Con esta base, estamos apostando por **modernizar todo el ecosistema Flexygo**, asegurando su futuro y adaptándolo a los estándares actuales de desarrollo empresarial.

---

## 🚀 ¿Cómo se utiliza Flexygo Core?

Tienes varias opciones para ejecutar o desplegar tu solución basada en Flexygo Core:

- **[IIS (Internet Information Services)](despliegue/iis.md)**  
  Ideal para entornos Windows, usando nuestro instalador personalizado que automatiza toda la configuración.

- **[Docker](despliegue/docker.md)**  
  Perfecto para despliegue en la nube, entornos Linux o soluciones automatizadas con contenedores.

- **[Kestrel](despliegue/kestrel.md)**  
  Ejecutable directamente con `dotnet run`, ideal para entornos de desarrollo o soluciones con proxy inverso.

Pulsa en cualquiera de las opciones para ver una guía detallada sobre su uso, instalación y ventajas.
