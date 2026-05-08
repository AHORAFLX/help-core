# Instalación y uso de Flexygo Product Tools

Las **Flexygo Product Tools** son un conjunto de utilidades que te permiten gestionar y mantener tus productos Flexygo Core de forma sencilla. Con ellas puedes generar tus propios paquetes NuGet personalizados, actualizar tu solución a nuevas versiones y sincronizar recursos y configuración automáticamente.

!!! tip "CLI opcional"
    El uso de la herramienta por línea de comandos es opcional. Las mismas operaciones están disponibles desde el **instalador de Flexygo Core**, la **extensión para Visual Studio 2022** ([ver más](./extension.md)) y la **extensión Flexygo Developer Tools para VS Code** ([ver más](./extension.md)), sin necesidad de usar la terminal.


!!! warning "Importante"
    No actualices los proyectos de la solución manualmente, ya que el actualizador realiza acciones adicionales necesarias para el correcto funcionamiento del sistema.

## 1. Instalación de la herramienta

Las herramientas se distribuyen como un **.NET Global Tool** y se instalan ejecutando el siguiente comando en una terminal:

```bash
dotnet tool install --global Flexygo.Tools.Product
```

Esto hará que el comando ```flexygo-product``` esté disponible globalmente en tu sistema.

> **Nota:**  
> Si necesitas soporte de autocompletado de parámetros en la consola, puedes instalar también:
>
> ```bash
> dotnet tool install --global dotnet-suggest
> ```

## 2. Uso básico

El comando principal es ```flexygo-product```, que dispone de dos subcomandos: ```nuget``` y ```update```.

### a) Generar NuGet personalizado

Permite generar los paquetes NuGet de tu solución.

```bash
flexygo-product nuget -s "RUTA_A_TU_SOLUCION" [-v VERSIÓN] [-c CONFIGURACIÓN]
```

- ```-s```: Ruta a la solución (**obligatorio**)
- ```-v```: Versión a generar del NuGet (**opcional**; si no se especifica, usará la versión actual)
- ```-c```: Configuración (```Release``` o ```Debug```, por defecto ```Release```)

### b) Actualizar tu producto Flexygo

Actualiza tu solución Flexygo Core a la última versión (o a una versión específica si la indicas).

```bash
flexygo-product update -s "RUTA_A_TU_SOLUCION" [-v VERSIÓN]
```

- ```-s```: Ruta a la solución (**obligatorio**)
- ```-v```: Versión a la que quieres actualizar (**opcional**; si no se especifica, actualiza a la última disponible)

Esto realizará automáticamente:

- Búsqueda de proyectos Frontend, Backend y Database en la solución.
- Comprobación y actualización de los paquetes NuGet ```Flexygo.Frontend```, ```Flexygo.Backend``` , ```Flexygo.Conf.Database``` y ```Flexygo.Library``` a la versión solicitada o la última disponible.
- Copia y sincronización de los recursos (```wwwroot```, ```updater```) del NuGet actualizado a tu proyecto (sobrescribiendo lo existente).
- Merge de los nuevos parámetros en ```appsettings``` desde el NuGet a tu proyecto, manteniendo las claves personalizadas.

## 3. Opciones disponibles

Puedes ver todas las opciones en cualquier momento con:

```bash
flexygo-product --help
```

## 4. Notas importantes

- Es recomendable realizar una copia de seguridad de tu solución antes de actualizar paquetes y recursos, especialmente si tienes modificaciones manuales en las carpetas ```wwwroot```.
- Tras la actualización, revisa el fichero ```appsettings``` por si quieres ajustar alguna configuración nueva.

---

!!! tip "Convención de nombres NuGet"
    Para que el instalador detecte correctamente los paquetes de tu producto deben seguir la convención de nombres estándar. Consulta la sección [Convención de nombres NuGet](./plantilla.md#convencion-de-nombres-nuget) en la guía de creación de producto.
