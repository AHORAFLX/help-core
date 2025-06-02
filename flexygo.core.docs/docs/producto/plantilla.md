# Crear un nuevo producto con la plantilla oficial

La plantilla de producto de Flexygo Core permite generar una solución lista para compilar y comenzar el desarrollo de inmediato, con todo lo necesario integrado.

## Instalación de la plantilla

```bash
dotnet new install Flexygo.Product.Template --nuget-source https://nuget.ahorabh.com/v3/index.json --force
```

> Este comando instala la plantilla desde el feed oficial de NuGet de Flexygo.

## Actualización de la plantilla

Para actualizar la plantilla a su última versión disponible:

```bash
dotnet new update --install flexygoproduct --nuget-source https://nuget.ahorabh.com/v3/index.json --force
```

## Eliminación de la plantilla

En caso de que desees desinstalarla:

```bash
dotnet new uninstall Flexygo.Product.Template
```

## Crear un nuevo producto

Para crear un nuevo producto basado en la plantilla:

```bash
dotnet new flexygoproduct --name CRMCore --output "G:\Proyectos Plantilla\CRMCore" --allow-scripts yes
```

> Cambia `CRMCore` por el nombre de tu producto y la ruta por donde quieras generar el proyecto.

Al crear el producto, se generará automáticamente un **perfil de ejecución** en Visual Studio con el mismo nombre que hayas indicado. Por tanto, **recuerda seleccionar ese perfil en la parte superior del IDE** para ejecutar el proyecto correctamente.

---

## Pasos para comenzar a desarrollar

Una vez generado el producto:

1. Abre la solución generada con Visual Studio.
2. Compila la solución completa.
3. Publica los proyectos de base de datos:  
    - `{NombreDelProyecto}_DB`  
    - `{NombreDelProyecto}_DataDB`
4. ¡Listo! Ya puedes empezar a desarrollar sobre tu nuevo producto Flexygo Core.

