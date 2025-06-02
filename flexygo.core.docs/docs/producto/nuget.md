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
