## Crear paquete NuGet para el producto

### 1. Publicación AhoraFlexy

Publicaremos el proyecto principal en una carpeta `publish` dentro de cualquier directorio externo al proyecto.  
Ejemplo: `C:\Temp\Publish`

Una vez publicado, copiaremos a esta carpeta `publish` la carpeta `Scripts` que se ubica en el proyecto principal, si la tuviera.

### 2. Publicación AhoraFlexyBD

Publicaremos el proyecto de BBDD de configuración y copiaremos el fichero `.dacpac` resultante en la carpeta `publish\db`.

### 3. Utilidades NuGet

Descargar el fichero `nuget.zip` y extraerlo al mismo nivel que la carpeta `publish`.  
(Ejemplo: `C:\Temp`)

### 4. Fichero `config.nuspec`

Editar el fichero `config.nuspec` para adaptar los valores a nuestro proyecto (ID, título, versión, etc.).

### 5. Generar paquete NuGet

Abrimos una ventana de comandos y ejecutamos:

```bash
nuget pack config.nuspec
```

Esto generará un fichero `.nupkg`.

### 6. Instalación

Copiaremos el fichero `.nupkg` junto al instalador de Flexygo.

El instalador detectará que existe un paquete distinto al de Flexygo y preguntará si deseamos instalar ese producto en su lugar.  
Si todo ha ido bien, seguiremos los pasos habituales y el producto quedará instalado correctamente.

## Generación de paquetes NuGet para distribución

Después de haber publicado los proyectos de base de datos, puedes generar fácilmente los paquetes NuGet necesarios para distribuir tu producto. Para ello, la solución generada incluye un script llamado **`GenerateNugets.ps1`**.

### ¿Cómo usar el script?

1. **Abre una terminal de PowerShell** en la raíz de tu solución.
2. Ejecuta el script:

    ```powershell
    .\GenerateNugets.ps1
    ```

3. El script te preguntará **qué versión** quieres generar para los paquetes.
4. Introduce el número de versión deseado y pulsa **Enter**.

El script realizará automáticamente todos los pasos necesarios para crear los paquetes NuGet de tu producto. Al finalizar, tendrás generados los siguientes paquetes listos para distribuir:

- `{NombreDelProyecto}.Frontend.{Versión}.nupkg`
- `{NombreDelProyecto}.Backend.{Versión}.nupkg`
- `{NombreDelProyecto}.Data.Database.{Versión}.nupkg`
- `{NombreDelProyecto}.Conf.Database.{Versión}.nupkg`

> **Nota:** Sustituye `{NombreDelProyecto}` por el nombre real de tu producto y `{Versión}` por la versión que hayas indicado.

---

**Ejemplo:**  
Si tu proyecto se llama `CRMCore` y generas la versión `1.0.0`, tendrás:

- `CRMCore.Frontend.1.0.0.nupkg`
- `CRMCore.Backend.1.0.0.nupkg`
- `CRMCore.Data.Database.1.0.0.nupkg`
- `CRMCore.Conf.Database.1.0.0.nupkg`

