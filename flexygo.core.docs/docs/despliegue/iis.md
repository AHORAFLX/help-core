## Despliegue en IIS

Flexygo Core puede instalarse fácilmente en un entorno Windows con **IIS** usando nuestro instalador. Este instalador te guía paso a paso y ofrece tanto una **instalación básica** como una **instalación avanzada**, adaptándose a distintos escenarios.

---

### :material-tools: Requisitos

Antes de comenzar, asegúrate de que el entorno dispone de:

- IIS instalado y configurado (el instalador puede instalarlo si no lo está)
- SQL Server (opcionalmente instalable también desde el instalador)
- .NET Hosting Bundle (instalado automáticamente si se detecta su ausencia)
- Permisos de administrador

---

### :material-flash: Instalación básica

La instalación básica está pensada para usuarios que quieren un despliegue rápido y funcional.

- Todo se instala en un solo sitio de IIS (puede ser uno ya existente o uno nuevo creado desde el propio instalador).
- El **frontend** y el **backend** comparten el mismo sitio web.
- El backend se instala por defecto en una **subcarpeta `/backend`**.

!!! example "Ejemplo"
    Si eliges instalar sobre **Default Web Site** y el nombre de tu producto es `CRM`, se configurará así:
    <br>- Frontend: `http://localhost/crm`
    <br>- Backend: `http://localhost/crm/backend`

Este modelo es ideal para instalaciones rápidas o entornos de desarrollo.

---

### :material-cog: Instalación avanzada

La instalación avanzada ofrece un mayor control y flexibilidad. Permite:

- Asignar un **sitio IIS distinto** al frontend y al backend.
- Ejecutar instalaciones **parciales**, por ejemplo:
  - Solo frontend en un servidor
  - Solo backend en otro servidor
- Instalar desde cualquier **repositorio de paquetes NuGet**, ya sea local o remoto.
- Soporta múltiples versiones del mismo paquete con selector desplegable.

### :material-label: Estructura de nombres NuGet

Para que el instalador detecte correctamente los paquetes, deben cumplir la siguiente convención:

- Si tu producto se llama `GestionTaller`, los paquetes deben ser:

  - `GestionTaller.Frontend`
  - `GestionTaller.Backend`
  - `GestionTaller.Conf.Database`
  - `GestionTaller.Data.Database`

De esta forma, el instalador los detectará automáticamente y propondrá instalarlos.

Si hay múltiples versiones disponibles, se mostrará una **lista desplegable** para seleccionar la versión deseada.

> Puedes consultar las guías de instalación desde la  propio sección del [instalador](instalador.md).

---

### :material-server: :material-database: Instalación de IIS y SQL Server

Tanto en modo básico como avanzado, el instalador ofrece opciones automáticas para:

- Instalar **IIS** si no está presente.
- Instalar **SQL Server** Developer Edition si el usuario lo solicita (ideal para entornos de pruebas o instalaciones locales).

---

### :material-star: Recomendación

Utiliza el modo **básico** para pruebas rápidas o entornos de desarrollo local.

El modo **avanzado** es ideal para entornos profesionales, despliegues por fases o infraestructuras distribuidas (por ejemplo, frontend en un servidor DMZ y backend en una red interna).

El instalador te guiará durante todo el proceso para garantizar una configuración correcta y estable.
