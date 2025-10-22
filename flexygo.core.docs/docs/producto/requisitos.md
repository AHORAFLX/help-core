## Requisitos previos para el desarrollo

Antes de empezar a trabajar con un producto generado por la plantilla **Flexygo Core**, asegúrate de tener instalado lo siguiente:

---

### **Visual Studio 2022 o Visual Studio 2026 Insiders**

Microsoft ha descontinuado la versión *Preview* de Visual Studio 2022.  
Por ello, es importante tener en cuenta lo siguiente según el tipo de proyecto con el que vayas a trabajar:

#### 🔹 Para **proyectos nuevos**
Usa **Visual Studio 2022** (versión estable más reciente).  
Esta versión **sí incluye la característica _SDK-style SQL Projects_**, necesaria para los nuevos proyectos de base de datos generados por **Flexygo Core**.

Durante la instalación o modificación de Visual Studio:

- Selecciona las siguientes **cargas de trabajo**:
  
  ![Cargas de trabajo](../images/VS/CargasTrabajoVS1.png)  
  ![Cargas de trabajo](../images/VS/CargasTrabajoVS2.png)  
  ![Cargas de trabajo](../images/VS/CargasTrabajoVS3.png)

- En **Componentes individuales**, marca **SDK-style SQL Projects** y **deshabilita SQL Server Data Tools**, ya que ambas no son compatibles:
  
  ![Componentes individuales](../images/VS/SqlVS.png)

#### 🔹 Para **proyectos antiguos**
Usa **Visual Studio 2026 Insiders** si ya trabajabas previamente con él o con versiones que incluían soporte para tus proyectos anteriores.  
Ten en cuenta que **Visual Studio 2026 Insiders por el momento no incluye la característica _SDK-style SQL Projects_**, por lo que **no puede usarse para crear ni modificar proyectos nuevos**.

Durante la instalación, selecciona las mismas **cargas de trabajo** mostradas en las capturas anteriores, pero **no instales SDK-style SQL Projects** y selecciona **SQL Server Data Tools**.

---

!!! info "Por qué son necesarias ambas versiones"
    Actualmente, **Microsoft mantiene que las características “SQL Server Data Tools (SSDT)” y “SDK-style SQL Projects” no son compatibles dentro de la misma instalación de Visual Studio**.  
    Por esta razón, es necesario tener **dos versiones distintas**:
    - **Visual Studio 2022** para los proyectos nuevos basados en _SDK-style SQL Projects_.  
    - **Visual Studio 2026 Insiders** para los proyectos antiguos que siguen usando **SQL Server Data Tools**.


---

### **SQL Server 2016 o superior**

Debes tener una instancia local o accesible de **SQL Server 2016 o superior** para poder desplegar y trabajar con los proyectos de base de datos.

---

!!! warning "Importante"
    - Para **proyectos nuevos**, utiliza **Visual Studio 2022** con la característica **_SDK-style SQL Projects_**.  
    - Para **proyectos antiguos**, puedes continuar con **Visual Studio 2026 Insiders**, pero **no podrás crear ni modificar proyectos de base de datos SDK**.  
    - Mantén tanto **Visual Studio** como **SQL Server** actualizados para evitar incompatibilidades con los paquetes y herramientas de Flexygo.
