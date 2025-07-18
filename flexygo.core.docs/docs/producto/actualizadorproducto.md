# Instalación y uso de la herramienta Flexygo Product Updater

La herramienta **Flexygo Product Updater** permite actualizar de forma automática los paquetes NuGet de tu producto Flexygo Core (Frontend, Backend y Database), y sincronizar recursos y configuración tras cada actualización.

!!! warning "Importante"
    No actualizar los proyectos de la solución manualmente ya que el actualizador realiza acciones adicionales que son necesarias para el correcto funcionamiento del mismo.

## 1. Instalación de la herramienta

La herramienta se distribuye como un **.NET Global Tool** y se instala ejecutando el siguiente comando en una terminal:

```bash
dotnet tool install --global Flexygo.Tools.ProductUpdater
```

Esto hará que el comando `flexygo-product-updater` esté disponible globalmente en tu sistema.

> **Nota:**  
> Si necesitas soporte de autocompletado de parámetros en la consola, puedes instalar también:
> 
> ~~~
> dotnet tool install --global dotnet-suggest
> ~~~

## 2. Uso básico

Con el siguiente comando indicando la ruta a tu producto:

```bash
flexygo-product-updater -s "RUTA_A_TU_SOLUCION"
```


Esto realizará automáticamente:

- Búsqueda de proyectos Frontend, Backend y Database en la solución.
- Comprobación y actualización de los paquetes NuGet `Flexygo.Frontend`, `Flexygo.Backend` y `Flexygo.Database` a la última versión.
- Copia y sincronización de los recursos (`wwwroot`, `updater`) del NuGet actualizado a tu proyecto (sobrescribiendo lo existente).
- Merge de los nuevos parámetros en `appsettings` desde el NuGet a tu proyecto, manteniendo las claves personalizadas.

## 3. Opciones disponibles

Puedes ver las opciones disponibles en cualquier momento con:

```bash
flexygo-product-updater --help
```

## 4. Notas importantes

- Es recomendable realizar una copia de seguridad de tu solución antes de actualizar paquetes y recursos, especialmente si tienes modificaciones manuales en las carpetas `wwwroot` o `updater`.
- Tras la actualización, revisa el fichero `appsettings` por si quieres ajustar alguna configuración nueva.

