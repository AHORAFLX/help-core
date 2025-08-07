## Instalación de la extensión Flexygo Product Tools en Visual Studio

Para instalar la extensión **Flexygo Product Tools** en Visual Studio, sigue estos pasos:

1. Abre Visual Studio.
2. Ve al menú ```Extensiones``` y selecciona ```Administrar extensiones```.
3. En la ventana de búsqueda, escribe ```Flexygo.Tools.Product```.
4. Cuando aparezca la extensión en los resultados, haz clic en ```Descargar```.
5. Reinicia Visual Studio para completar la instalación.

Una vez instalada, podrás encontrar la barra de herramientas en ```Ver``` → ```Barras de herramientas``` → ```Flexygo Core Tools Product```.  

![Cargas de trabajo](../images/extension/update/toolbar.png)

Verás dos botones nuevos, uno de actualizar y otro de generar NuGets.
![Cargas de trabajo](../images/extension/update/buttons.png)

## Flujo de uso de Flexygo Product Tools en Visual Studio

### 1. Actualizar el producto

1. Haz clic en el botón de actualizar en la barra de herramientas.
2. Se abrirá una ventana donde podrás seleccionar la versión a la que deseas actualizar; por defecto, estará marcada la última versión disponible.  
   ![Seleccionar versión de actualización](../images/extension/update/versionUpdate.png)
3. Confirma la actualización a la versión seleccionada en la ventana de confirmación.  
   ![Confirmación de actualización](../images/extension/update/updateConfirm.png)
4. Aparecerá una pestaña con el progreso de la actualización.  
   ![Progreso de actualización](../images/extension/update/progressUpdate.png)
5. Ya tienes el producto actualizado a la versión elegida.
---

### 2. Generar NuGets

1. Haz clic en el botón de generar NuGets en la barra de herramientas.
2. Se abrirá una ventana donde podrás introducir la versión de NuGet que quieres generar.  
   ![Introducir versión de NuGet](../images/extension/nuget/versionNuget.png)
3. Confirma que deseas generar el paquete NuGet con la versión indicada en la ventana de confirmación.  
   ![Confirmación de generación de NuGet](../images/extension/nuget/confirmNuget.png)
4. Por último, se mostrará una pestaña con el progreso de la generación.  
   ![Progreso de generación de NuGet](../images/extension/nuget/progressNuget.png)
5. Una vez termine de generar los NuGets se abrirá la carpeta donde se han generado.

!!! note "Descarga provisional"
    Hasta que la extensión esté disponible en el Marketplace de Visual Studio, puedes descargarla directamente desde el siguiente enlace:

    [Descargar Flexygo Product Tools para Visual Studio](../files/Flexygo.Tools.Product.VisualStudio.vsix)
